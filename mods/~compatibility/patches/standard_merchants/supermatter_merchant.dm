/datum/merchant/transient/rare/rock/pre_inventory_generation()
	..()
	supply_potential += /decl/merchant_potential_commodities/supermatter


/decl/merchant_potential_commodities/supermatter
	type_instructions = list(
		/obj/machinery/power/supermatter = MERCHANT_INCLUDE_ALL
	)