/datum/merchant/transient/gun_shop
	name = "Gun Shop Employee"
	origin = "Gun Shop"
	possible_origins = list(
		"Rooty Tootie's Point-n-Shooties",
		"Bang-Bang Shop",
		"Wild Wild West Shop",
		"Keleshnikov",
		"Hunting Depot",
		"Big Game Hunters"
	)
	speech = /decl/merchant_speech/gun_shop
	supply_potential = list(/decl/merchant_potential_commodities/gun_shop)


/decl/merchant_potential_commodities/gun_shop
	type_instructions = list(
		/obj/item/gun/projectile/pistol/holdout		= MERCHANT_INCLUDE_ALL,
		/obj/item/gun/projectile/shotgun/pump		= MERCHANT_INCLUDE_THIS_TYPE,
		/obj/item/ammo_magazine						= MERCHANT_INCLUDE_SUBTYPES,
		/obj/item/ammo_magazine/rifle/empty			= MERCHANT_EXCLUDE_ALL,
		/obj/item/ammo_magazine/pistol/small/empty	= MERCHANT_EXCLUDE_ALL,
		/obj/item/ammo_magazine/pistol/empty		= MERCHANT_EXCLUDE_ALL,
		/obj/item/ammo_magazine/box/pistol/empty	= MERCHANT_EXCLUDE_ALL,
		/obj/item/ammo_magazine/smg/empty			= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/webbing/holster			= MERCHANT_INCLUDE_ALL
	)


/decl/merchant_speech/gun_shop
	hailed = "Hello, hello! I hope you have your permit. Oh, who are we kidding, you're welcome anyway!"
	denied_hail = "Store policy dictates that you can fuck off."
	trade_complete = "Thanks for buying your guns from "+MERCHANT_TOKEN_ORIGIN+"!"
	forbidden_offer = "We may deal in guns, but that doesn't mean we'll trade for illegal goods..."
	goods_not_accepted = "Cash for guns, thats the deal."
	not_enough_value = "Guns are expensive! Give us more if you REALLY want it."
	how_much = "Well, I'd love to give this little beauty to you for "+MERCHANT_TOKEN_VALUE+" "+MERCHANT_TOKEN_CURRENCY+"."
	compliment_failure = "If we were in the same room right now, I'd probably punch you."
	compliment_success = "Ha! Good one!"
	insult_high_opinion = "I expected better from you. I suppose in that, I was wrong."
	insult_low_opinion = "If I had my gun I'd shoot you!"
	bribe_success = "For that much scratch, I can stay for another "+MERCHANT_TOKEN_TIME+" minutes."
	bribe_failure = "Look, I've got places to be, I can't hang around shooting the shit."
	leaving_soon = "I'm staying for another "+MERCHANT_TOKEN_TIME+" minutes."