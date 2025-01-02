/obj/item/engine
	name = "engine"
	desc = "An engine used to power a small vehicle."
	icon = 'icons/obj/objects.dmi'
	w_class = ITEM_SIZE_HUGE
	material = /decl/material/solid/metal/steel
	var/stat = 0
	var/trail_type
	var/cost_per_move = 5

/obj/item/engine/proc/get_trail()
	if(trail_type)
		return new trail_type
	return null

/obj/item/engine/proc/prefill()
	return

/obj/item/engine/proc/use_power()
	return 0

/obj/item/engine/proc/rev_engine(var/atom/movable/M)
	return

/obj/item/engine/proc/putter(var/atom/movable/M)
	return

/obj/item/engine/electric
	name = "electric engine"
	desc = "A battery-powered engine used to power a small vehicle."
	icon_state = "engine_electric"
	trail_type = /datum/effect/effect/system/trail/ion
	cost_per_move = 200	// W
	var/obj/item/cell/cell

/obj/item/engine/electric/attackby(var/obj/item/I, var/mob/user)
	if(istype(I,/obj/item/cell))
		if(cell)
			to_chat(user, "<span class='warning'>There is already a cell in \the [src].</span>")
		else
			cell = I
			user.drop_from_inventory(I)
			I.forceMove(src)
		return TRUE
	else if(IS_CROWBAR(I))
		if(cell)
			to_chat(user, "You pry out \the [cell] with \the [I].")
			cell.dropInto(loc)
			cell = null
			return TRUE
		if(!user.check_intent(I_FLAG_HARM))
			to_chat(user, SPAN_WARNING("There is no cell in \the [src] to remove with \the [I]!"))
			return TRUE
	return ..()

/obj/item/engine/electric/prefill()
	cell = new /obj/item/cell/high(src.loc)

/obj/item/engine/electric/use_power()
	if(!cell)
		return 0
	return cell.use(cost_per_move * CELLRATE)

/obj/item/engine/electric/rev_engine(var/atom/movable/M)
	M.audible_message("\The [M] beeps, spinning up.")

/obj/item/engine/electric/putter(var/atom/movable/M)
	M.audible_message("\The [M] makes one depressed beep before winding down.")

/obj/item/engine/electric/emp_act(var/severity)
	if(cell)
		cell.emp_act(severity)
	..()

/obj/item/engine/thermal
	name = "thermal engine"
	desc = "A fuel-powered engine used to power a small vehicle."
	icon_state = "engine_fuel"
	trail_type = /datum/effect/effect/system/trail/thermal
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	var/obj/temp_reagents_holder
	var/fuel_points = 0
	//fuel points are determined by differing reagents

/obj/item/engine/thermal/prefill()
	fuel_points = 5000

/obj/item/engine/thermal/Initialize()
	. = ..()
	create_reagents(500)
	temp_reagents_holder = new()
	temp_reagents_holder.create_reagents(15)
	temp_reagents_holder.atom_flags |= ATOM_FLAG_OPEN_CONTAINER

/obj/item/engine/thermal/attackby(var/obj/item/I, var/mob/user)
	if(I.standard_pour_into(user, src))
		return TRUE
	return ..()

/obj/item/engine/thermal/use_power()
	if(fuel_points >= cost_per_move)
		fuel_points -= cost_per_move
		return 1
	if(!reagents || reagents.total_volume <= 0 || stat)
		return 0

	reagents.trans_to(temp_reagents_holder,min(reagents.total_volume,15))
	var/multiplier = 1
	var/actually_flameable = 0
	for(var/rtype in temp_reagents_holder.reagents.reagent_volumes)
		var/new_multiplier = 1
		var/decl/material/R = GET_DECL(rtype)
		if(istype(R, /decl/material/liquid/alcohol))
			var/decl/material/liquid/alcohol/E = R
			new_multiplier = (10/E.strength)
			actually_flameable = 1
		else if(istype(R,/decl/material/liquid/fuel/hydrazine))
			new_multiplier = 1.25
			actually_flameable = 1
		else if(istype(R,/decl/material/liquid/fuel))
			actually_flameable = 1
		else if(istype(R,/decl/material/liquid/frostoil))
			new_multiplier = 0.1
		else if(istype(R,/decl/material/liquid/water))
			new_multiplier = 0.4
		else if(istype(R,/decl/material/liquid/nutriment/sugar) && REAGENT_VOLUME(reagents, rtype) > 1)
			stat = DEAD
			explosion(get_turf(src),-1,0,2,3,0)
			return 0
		multiplier = (multiplier + new_multiplier)/2
	if(!actually_flameable)
		return 0
	fuel_points += 20 * multiplier * temp_reagents_holder.reagents.total_volume
	temp_reagents_holder.reagents.clear_reagents()
	return use_power()

/obj/item/engine/thermal/rev_engine(var/atom/movable/M)
	M.audible_message("\The [M] rumbles to life.")

/obj/item/engine/electric/putter(var/atom/movable/M)
	M.audible_message("\The [M] putters before turning off.")