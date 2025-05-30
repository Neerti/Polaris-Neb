/// Contains instructions for how to construct a merchant's stock and demand.
/datum/merchant_inventory_instruction
	/// An assoc list which is used to determine what types a merchant will offer to buy or sell.
	/// The format is the type path as the key, and a `MERCHANT_*` bitflag as the value.
	/// Multiple types, similar or otherwise, can be in the same list, forming a 'block' that is only affected by the data inside the block.
	/// Example: `list(/obj/item/foo = MERCHANT_INCLUDE_ALL, /obj/item/foo/bar = MERCHANT_EXCLUDE_THIS_TYPE)` will generate a merchant buy or sell order containing
	/// `/obj/item/foo` and all of its subtypes, except for `/obj/item/foo/bar`.
	/// The list is evaluated sequentially, so order matters. Put excludes below the includes.
	/// Seperating into different blocks is generally only needed if you plan to have different items have different quantities or probabilities.
	VAR_PRIVATE/list/type_instructions = null

	/// Sets a hard cap on how many type paths can be part of this block.
	VAR_PRIVATE/max_block_size = null

	/// Imposes a limit of how many of one particular item type can be bought or sold by a merchant, on a per-item basis.
	/// For example, setting this to 5, in a block with ten types available, will make the merchant offer five of each type, for a total of fifty items.
	VAR_PRIVATE/item_quantity_lower_bound = null

	VAR_PRIVATE/item_quantity_upper_bound = null

	/// Determines the odds that everything defined in this block can be offered, on a per-block basis.
	VAR_PRIVATE/block_probability = null

	/// Determines the odds that an individual type path can be offered, on a per-item basis.
	VAR_PRIVATE/item_probability = null

	/// A list of procs which merchants will use as additional checks on whether to accept buying or selling items.
	/// If any proc in the list does not evaluate to TRUE, the merchant will reject the trade.
	VAR_PRIVATE/list/block_predicates = null

	var/list/potential_inventory = null

/datum/merchant_inventory_instruction/New(list/_type_instructions, _max_block_size = INFINITY, _item_quantity_lower_bound = 0, _item_quantity_upper_bound = INFINITY, _block_probability = 100, _item_probability = 100, list/_block_predicates = null)
	type_instructions = _type_instructions
	max_block_size = _max_block_size
	item_quantity_lower_bound = _item_quantity_lower_bound
	item_quantity_upper_bound = _item_quantity_upper_bound
	block_probability = _block_probability
	item_probability = _item_probability
	block_predicates = _block_predicates
	potential_inventory = list()

	if(!prob(block_probability))
		return

	// Evaluate the type instructions.
	var/list/item_candidates = list()
	for(var/type_path in type_instructions)
		var/instruction = type_instructions[type_path]
		if(instruction & MERCHANT_INCLUDE_THIS_TYPE)
			item_candidates += type_path
		if(instruction & MERCHANT_INCLUDE_SUBTYPES)
			item_candidates += subtypesof(type_path)
		if(instruction & MERCHANT_EXCLUDE_THIS_TYPE)
			item_candidates -= type_path
		if(instruction & MERCHANT_EXCLUDE_SUBTYPES)
			item_candidates -= subtypesof(type_path)

	for(var/type_path in item_candidates)
		var/atom/A = type_path
		// Filter out anything weird that might've sneaked in.
		if(!TYPE_IS_SPAWNABLE(A))
			item_candidates -= A
		// Remove things randomly, if desired.
		if(!prob(item_probability))
			item_candidates -= A

	// Trim types down if necessary.
	if(length(item_candidates) > max_block_size)
		while(length(item_candidates) > max_block_size)
			pick_n_take(item_candidates)

	for(var/type_path in item_candidates)
		var/quantity = INFINITY
		if(item_quantity_upper_bound != INFINITY)
			quantity = rand(item_quantity_lower_bound, item_quantity_upper_bound)
		potential_inventory[type_path] = quantity

/datum/merchant_inventory_instruction/proc/generate_stock(datum/merchant/merchant)
	. = list()
	for(var/type_path, quantity in potential_inventory)
		.[type_path] = new /datum/merchant_stock_metadata(
			quantity,
			block_predicates,
			rand(1 / merchant.price_variance * 100, 1 * merchant.price_variance * 100) / 100
		)


// Despite the name, this is also used for both buying and selling items.
/datum/merchant_stock_metadata
	var/quantity = null					//! How many instances of something the merchant has, or wants to buy. If left unset, there is no limit.
	var/list/predicates = null			//! A list of procs that act as extra checks for the merchant to agree to a trade. All of them must evaluate to TRUE or the merchant will refuse.
	var/price_variance = null

/datum/merchant_stock_metadata/New(_quantity = null, list/_predicates = null, _price_variance = null)
	quantity = _quantity
	predicates = _predicates
	price_variance = _price_variance