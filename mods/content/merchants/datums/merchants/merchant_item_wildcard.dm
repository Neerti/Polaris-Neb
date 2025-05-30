/decl/merchant_item_wildcard
	var/name = null

/decl/merchant_item_wildcard/proc/evaluate(atom/movable/instance, input)
	return FALSE

/decl/merchant_item_wildcard/proc/get_quantity(atom/movable/instance)
	if(istype(instance, /obj/item/stack))
		var/obj/item/stack/stack = instance
		return stack.amount
	return 1


/decl/merchant_item_wildcard/reagent

/decl/merchant_item_wildcard/gas

/decl/merchant_item_wildcard/material

