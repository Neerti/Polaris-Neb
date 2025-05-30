
// WIP
/*
/datum/merchant/xeno_shop
	active_demand_offers = list(
		new /datum/merchant_commodity(list(
				/decl/merchant_commodity_requirement/typepath = list(
					/mob/living/simple_animal/tindalos				= MERCHANT_INCLUDE_THIS_TYPE,
					/mob/living/simple_animal/tomato				= MERCHANT_INCLUDE_THIS_TYPE,
					/mob/living/simple_animal/yithian				= MERCHANT_INCLUDE_THIS_TYPE,
					/mob/living/simple_animal/hostile/beast/diyaab	= MERCHANT_INCLUDE_THIS_TYPE,
					/mob/living/simple_animal/hostile/beast/shantak	= MERCHANT_INCLUDE_THIS_TYPE,
					/mob/living/simple_animal/hostile/beast/samak	= MERCHANT_INCLUDE_THIS_TYPE,
					/mob/living/simple_animal/hostile/carp 			= MERCHANT_INCLUDE_THIS_TYPE
				),

//				/decl/merchant_commodity_requirement/typepath = list(
//					/obj/item/box/fancy/cigarettes				= MERCHANT_INCLUDE_ALL,
//					/obj/item/box/fancy/cigarettes/tricord		= MERCHANT_EXCLUDE_THIS_TYPE, // Excluding these since they show up on the console as the regular cigarettes.
//					/obj/item/box/fancy/cigarettes/mindbreak	= MERCHANT_EXCLUDE_THIS_TYPE,
//					/obj/item/box/fancy/cigarettes/chemsmoke	= MERCHANT_EXCLUDE_THIS_TYPE,
//					/obj/item/box/fancy/cigarettes/flash_powder	= MERCHANT_EXCLUDE_THIS_TYPE
//				),
				/decl/merchant_commodity_requirement/mob_is_alive = TRUE
			)
		),
		new /datum/merchant_commodity(list(
			/decl/merchant_commodity_requirement/typepath = list(
				/obj/item/sword = MERCHANT_INCLUDE_ALL
			),
			/decl/merchant_commodity_requirement/material = /decl/material/solid/metal/gold
		)),
		new /datum/merchant_commodity(list(
			/decl/merchant_commodity_requirement/type_or_subtype = /obj/item/stack/material/ore,
			/decl/merchant_commodity_requirement/material = /decl/material/solid/hematite
		)),
		new /datum/merchant_commodity(list(
			/decl/merchant_commodity_requirement/type_or_subtype = /obj/machinery/portable_atmospherics/canister,
			/decl/merchant_commodity_requirement/gas/ratio = list(
				/decl/material/gas/oxygen = O2STANDARD,
				/decl/material/gas/nitrogen = N2STANDARD
			),
			/decl/merchant_commodity_requirement/gas/temperature = 20 CELSIUS
		)),
		new /datum/merchant_commodity(list(
			/decl/merchant_commodity_requirement/species = list(
				/decl/species/human,
				/decl/species/skrell,
				/decl/species/unathi,
				/decl/species/vox
			)
		)),
		new /datum/merchant_commodity(list(
			/decl/merchant_commodity_requirement/any_atom_movable = null,
			/decl/merchant_commodity_requirement/reagents/has_reagents = list(
				/decl/material/liquid/water
			)
		)),
		new /datum/merchant_commodity(list(
			/decl/merchant_commodity_requirement/any_atom_movable,
			/decl/merchant_commodity_requirement/reagents/ratio = list(
				/decl/material/liquid/weedkiller = 0.25,
				/decl/material/liquid/acid = 0.5,
				/decl/material/liquid/alcohol/ethanol = 0.25
			)
		)),
		new /datum/merchant_commodity(list(
			/decl/merchant_commodity_requirement/typepath = list(
				/obj/item/chems/glass/beaker/noreact = MERCHANT_INCLUDE_THIS_TYPE
			),
			/decl/merchant_commodity_requirement/reagents/empty
		)),
		new /datum/merchant_commodity(list(
			/decl/merchant_commodity_requirement/any_atom_movable,
			/decl/merchant_commodity_requirement/reagents/has_reagents = list(
				/decl/material/liquid/painkillers,
				/decl/material/liquid/antitoxins,
				/decl/material/liquid/antirads
			)
		)),
	)
*/

/// Creates `/datum/merchant_commodity` instances in bulk upon merchant init.
/// Used to reduce the tedium in assigning stock to merchants.
/datum/merchant_stock_builder
	var/list/type_paths = list()
	var/list/requirements = list()
	var/list/requirement_permutations = list()
	var/item_quantity_lower_bound = 0
	var/item_quantity_upper_bound = INFINITY
	var/item_quantity_method = /decl/merchant_quantity_method/instances

/**
Instantiates an object which will be used to create a bunch of `/datum/merchant_commodity`s in bulk, avoiding the need to tediously define each one manually if they're relatively similar.
- `list/_type_paths`: An assocative list of type paths and 'instructions' which will determine if a specific type or their subtypes are to be included or excluded.
The order that types are listed matters. Excluding must occur after including.
	- `MERCHANT_INCLUDE_THIS_TYPE`: The type itself will be included.
	- `MERCHANT_INCLUDE_SUBTYPES`: Subtypes of this type will be included.
	- `MERCHANT_INCLUDE_ALL`: Combines the previous two instructions, including the type and its subtypes.
	- `MERCHANT_EXCLUDE_THIS_TYPE`: The type itself will be excluded.
	- `MERCHANT_EXCLUDE_SUBTYPES`: Subtypes of this type will be excluded.
	- `MERCHANT_EXCLUDE_ALL`: Combines the previous two instructions, excluding the type and its subtypes.
- `list/_requirements`: A list of `/decl/merchant_commodity_requirement`s and their parameters. Each requirement will be applied to all created instances.
	E.g. `list(/decl/merchant_commodity_requirement/material = /decl/material/solid/metal/gold)` will cause all instances have the requirement of being made out of gold.
- `list/_requirement_permutations`: A list of `/decl/merchant_commodity_requirement`s and their parameters. Unlike the above, each permutation of the decls inside are created for each type.
	E.g. `list(list(/decl/merchant_commodity_requirement/material = /decl/material/solid/metal/gold, list(/decl/merchant_commodity_requirement/material = /decl/material/solid/metal/silver))` will create
	one instance which requires gold, and one instance which requires silver, for each type.
*/
/*
/datum/merchant_stock_builder/New(list/_type_paths, list/_requirements, list/_requirement_permutations, _item_quantity_lower_bound = 0, _item_quantity_upper_bound = INFINITY, _item_quantity_method = /decl/merchant_quantity_method/instances)
	type_paths = _type_paths
	requirements = _requirements
	requirement_permutations = _requirement_permutations
	item_quantity_lower_bound = _item_quantity_lower_bound
	item_quantity_upper_bound = _item_quantity_upper_bound
	item_quantity_method = _item_quantity_method

/datum/merchant_stock_builder/proc/build_stock(list/destination_list)
	var/list/types_included = list()
	for(var/type_path, instruction in type_paths)
		if(instruction & MERCHANT_INCLUDE_THIS_TYPE)
			types_included += type_path
		if(instruction & MERCHANT_INCLUDE_SUBTYPES)
			types_included += subtypesof(type_path)
		if(instruction & MERCHANT_EXCLUDE_THIS_TYPE)
			types_included -= type_path
		if(instruction & MERCHANT_EXCLUDE_SUBTYPES)
			types_included -= subtypesof(type_path)

//	var/list/test_permutations = cartesian_product(list(list("A" = "X","B" = "Y","C" = "Z"), list("1" = "10","2" = "20","3" = "30")))
//	var/list/test_permutations = cartesian_product(list(list("A" = "X", "A" = "Y", "A" = "Z"), list("1" = 10, "2" = 100, "3" = 1000)))

	var/list/test_permutations = cartesian_product(list(list(list("A" = "X"), list("A" = "Y"), list("A" = "Z")), list("1" = 10, "2" = 100, "3" = 1000)))

	to_world_log("Test permutations: [json_encode(test_permutations)]")

	var/list/list/sets = list()
	if(length(types_included))
		sets += list(types_included)

	if(length(requirement_permutations))
		sets += list(requirement_permutations)

	var/list/permutations = cartesian_product(sets)
	to_world_log("Permutations: [json_encode(permutations, JSON_PRETTY_PRINT)]")
	for(var/list/permutation as anything in permutations)
		to_world_log("Permutation: [json_encode(permutation)]")
//		var/required_type =
*/

/*
	var/list/list/sets = list()
	var/list/types_set = list()

	for(var/type_path in types_included)
		types_set += list(list(/decl/merchant_commodity_requirement/type/exact_type = type_path))
	sets += types_set

	if(length(requirement_permutations))
		sets += list(requirement_permutations)
	var/list/permutations = cartesian_product(sets)

	for(var/list/permutation as anything in permutations)
		var/list/instance_requirements = permutation.Copy()
		to_world_log("/datum/merchant_stock_builder/proc/build_stock(): [json_encode(permutation)]")
		to_world_log("/datum/merchant_stock_builder/proc/build_stock(): Regular Assoc List Example: [json_encode(list(/decl/merchant_commodity_requirement/type/exact_type = /mob/living/human))]")


		to_world_log("/datum/merchant_stock_builder/proc/build_stock(): [json_encode(instance_requirements)]")
		destination_list += new /datum/merchant_commodity(instance_requirements, item_quantity_lower_bound, item_quantity_upper_bound, item_quantity_method)
*/


// TODO: Should these get moved to a stock helper file?

/**
Returns the cartesian product of two or more lists, which is a list containing every permutation

For example, `list(list("A","B","C"), list("1","2","3")` will produce a list containing;
```
list("A","1"),
list("A","2"),
list("A","3"),
list("B","1"),
...
list("C","2"),
list("C","3")
```
- `list/list/sets`: Nested list containing two or more lists to be combined.
- Returns: A nested list containing every combination of the inputted sets.
*/

/proc/cartesian_product(list/list/sets)
//	ASSERT(length(sets) >= 2)
	to_world_log("/proc/cartesian_product(): Sets: [json_encode(sets, JSON_PRETTY_PRINT)]")

	. = sets[1]
	// Each element in the first list is enclosed into their own list, so that they can be appended to in upcoming iterations.
	for(var/i = 1 to length(.))
		var/assoc_value = .[.[i]]
		if(assoc_value)
			.[i] = list(.[i] = assoc_value)
		else
			.[i] = list(.[i])
	to_world_log("/proc/cartesian_product(): First set: [json_encode(.)]")

	if(length(sets) < 2)
		to_world_log("/proc/cartesian_product(): Returning early, only one set contained.")
		return

	for(var/i = 2 to length(sets))
		. = cartesian_iteration(., sets[i])

	to_world_log("/proc/cartesian_product(): Product: [json_encode(.)]")


/// Returns a cartesian product of two sets.
/// Don't call this directly, use `cartesian_product()` instead.
/proc/cartesian_iteration(list/list/setA, list/setB)
	to_world_log("/proc/cartesian_iteration(): Start: setA: [json_encode(setA)], setB: [json_encode(setB)]")
	. = list()
	for(var/i = 1 to length(setA))
		for(var/j = 1 to length(setB))
			to_world_log("elementA: [json_encode(setA[i])]")
			to_world_log("elementB: [json_encode(setB[j])]")
			var/assoc_value = setB[setB[j]]
			to_world_log("elementBAssoc: [json_encode(assoc_value)]")
			if(assoc_value)
				. += list(setA[i] + list(setB[j] = assoc_value))
			else
				. += list(setA[i] + setB[j])

