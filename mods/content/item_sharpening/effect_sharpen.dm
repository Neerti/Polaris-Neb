/decl/item_effect/sharpened/modify_attack_damage(base_damage, obj/item/used_item, mob/user, dry_run, list/parameters)
	var/uses = LAZYACCESS(parameters, IE_PAR_USES)
	if(uses <= 0)
		return base_damage
	. = (1 + ((uses / max(1, LAZYACCESS(parameters, IE_PAR_MAX_USES))) * LAZYACCESS(parameters, IE_PAR_SHARP_DAM_MULT)))
	if(!dry_run)
		uses = max(0, uses-1)
		used_item.set_item_effect_parameter(src, IE_CAT_DAMAGE, IE_PAR_USES, uses)
		if(uses == 0) // We've gone dull!
			used_item.update_attack_force()
			used_item.update_name()

/decl/item_effect/sharpened/on_examined(obj/item/item, mob/user, distance, list/parameters)
	if(distance <= 1)
		var/uses = item.get_item_effect_parameter(src, IE_CAT_DAMAGE, IE_PAR_USES)
		if(uses > 0)
			to_chat(user, SPAN_NOTICE("\The [src] has been sharpened to a keen edge."))
		else
			to_chat(user, SPAN_NOTICE("\The [src] is dull and in need of sharpening."))
