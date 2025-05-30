/datum/merchant/transient/clothing_shop
	name = "Clothing Store Employee"
	origin = "Clothing Store"
	possible_origins = list(
		"Space Eagle",
		"Banana Democracy",
		"Forever 22",
		"Textiles Factory Warehouse Outlet",
		"Blocks Brothers"
	)
	speech = /decl/merchant_speech/clothing_shop
	supply_potential = list(/decl/merchant_potential_commodities/clothing_shop)
	refuse_haggling = TRUE


/decl/merchant_potential_commodities/clothing_shop
	type_instructions = list(
		/obj/item/clothing/pants				= MERCHANT_INCLUDE_SUBTYPES,
		/obj/item/clothing/pants/pj				= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/pants/shorts			= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/pants/chameleon		= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/pants/mankini		= MERCHANT_EXCLUDE_ALL,

		/obj/item/clothing/shirt				= MERCHANT_INCLUDE_SUBTYPES,
		/obj/item/clothing/shirt/chameleon		= MERCHANT_EXCLUDE_ALL,

		/obj/item/clothing/dress				= MERCHANT_INCLUDE_SUBTYPES,
		/obj/item/clothing/dress/wedding		= MERCHANT_EXCLUDE_ALL,

		/obj/item/clothing/jumpsuit				= MERCHANT_INCLUDE_SUBTYPES,
		/obj/item/clothing/jumpsuit/chameleon	= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/jumpsuit/quantum		= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/jumpsuit/tactical	= MERCHANT_EXCLUDE_ALL
	)


/datum/merchant/transient/clothing_shop/shoes
	possible_origins = list(
		"Foot Safe",
		"Paysmall",
		"Popular Footwear",
		"Grimbly's Shoes",
		"Right Steps"
	)
	supply_potential = list(/decl/merchant_potential_commodities/shoe_shop)


/decl/merchant_potential_commodities/shoe_shop
	type_instructions = list(
		/obj/item/clothing/shoes						= MERCHANT_INCLUDE_SUBTYPES,
		/obj/item/clothing/shoes/chameleon				= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/shoes/jackboots/swat			= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/shoes/clown_shoes			= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/shoes/cult					= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/shoes/lightrig				= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/shoes/rig					= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/shoes/magboots				= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/shoes/syndigaloshes			= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/shoes/color/black/quantum	= MERCHANT_EXCLUDE_ALL
	)


/datum/merchant/transient/clothing_shop/hats_gloves_accessories
	possible_origins = list(
		"Baldie's Hats and Accessories",
		"The Right Fit",
		"Like a Glove",
		"Space Fashion"
	)
	supply_potential = list(/decl/merchant_potential_commodities/hats_gloves_accessories)


/decl/merchant_potential_commodities/hats_gloves_accessories
	type_instructions = list(
		/obj/item/clothing/neck							= MERCHANT_INCLUDE_ALL,
		/obj/item/clothing/suit/jacket					= MERCHANT_INCLUDE_ALL,
		/obj/item/clothing/suit/robe					= MERCHANT_INCLUDE_ALL,
		/obj/item/clothing/shoes/legbrace				= MERCHANT_INCLUDE_ALL,
		/obj/item/clothing/shoes/kneepads 				= MERCHANT_INCLUDE_ALL,
		/obj/item/clothing/armor_attachment/tag			= MERCHANT_INCLUDE_ALL,
		/obj/item/clothing/armor_attachment/helmcover	= MERCHANT_INCLUDE_ALL,

		/obj/item/clothing/gloves						= MERCHANT_INCLUDE_SUBTYPES,
		/obj/item/clothing/gloves/lightrig				= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/gloves/rig					= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/gloves/thick/swat			= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/gloves/chameleon				= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/gloves/quantum				= MERCHANT_EXCLUDE_ALL,

		/obj/item/clothing/head							= MERCHANT_INCLUDE_SUBTYPES,
		/obj/item/clothing/head/HoS						= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/bio_hood				= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/bomb_hood				= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/caphat					= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/centhat					= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/chameleon				= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/collectable				= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/helmet					= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/lightrig				= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/radiation				= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/warden					= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/welding					= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/helmet					= MERCHANT_EXCLUDE_ALL,
		/obj/item/clothing/head/pumpkinhead				= MERCHANT_EXCLUDE_ALL
	)


/decl/merchant_speech/clothing_shop
	hailed = "Hello, "+MERCHANT_TOKEN_PLAYER_HONORIFIC+"! Welcome to "+MERCHANT_TOKEN_ORIGIN+"!"
	denied_hail = "We do not trade with rude customers. Consider yourself blacklisted."
	trade_complete = "Thank you for shopping at "+MERCHANT_TOKEN_ORIGIN+". Remember: We cannot accept returns without the original tags!"
	forbidden_offer = "Hm, how about no?"
	goods_not_accepted = "We don't buy, "+MERCHANT_TOKEN_PLAYER_HONORIFIC+". Only sell."
	not_enough_value = "Sorry, "+MERCHANT_TOKEN_ORIGIN+" policy to not accept trades below our marked prices."
	how_much = "Your total comes out to "+MERCHANT_TOKEN_VALUE+" "+MERCHANT_TOKEN_CURRENCY+"."
	compliment_failure = "Excuse me?"
	compliment_success = "Aw, you're so nice!"
	insult_high_opinion = MERCHANT_TOKEN_PLAYER_HONORIFIC+"."
	insult_low_opinion = "Wow, I don't have to take this."
	bribe_failure = MERCHANT_TOKEN_ORIGIN+" policy clearly states we cannot stay for more than the designated time."
	bribe_success = "Hm.... sure! We'll have a few minutes of 'engine troubles'."