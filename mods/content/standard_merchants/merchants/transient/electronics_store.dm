/datum/merchant/transient/electronics_store
	name = "Electronics Shop Employee"
	origin = "Electronics Shop"
	possible_origins = list(
		"Best Sale",
		"Overstore",
		"Oldegg",
		"Circuit Citadel",
		"Silicon Village",
		"Positronic Solutions LLC",
		"Sunvolt Inc."
	)
	supply_potential = list(/decl/merchant_potential_commodities/electronics_store)
	speech = /decl/merchant_speech/electronics_store
	refuse_haggling = TRUE


/decl/merchant_potential_commodities/electronics_store
	type_instructions = list(
		/obj/item/stock_parts/computer/battery_module			= MERCHANT_INCLUDE_SUBTYPES,
		/obj/item/stock_parts/circuitboard						= MERCHANT_INCLUDE_SUBTYPES,
		/obj/item/stock_parts/circuitboard/unary_atmos			= MERCHANT_EXCLUDE_ALL,
		/obj/item/stock_parts/circuitboard/arcade				= MERCHANT_EXCLUDE_ALL,
		/obj/item/stock_parts/circuitboard/broken				= MERCHANT_EXCLUDE_ALL,
		/obj/item/stack/cable_coil								= MERCHANT_INCLUDE_SUBTYPES,
		/obj/item/stack/cable_coil/cyborg						= MERCHANT_EXCLUDE_ALL,
		/obj/item/stack/cable_coil/random						= MERCHANT_EXCLUDE_ALL,
		/obj/item/stack/cable_coil/cut							= MERCHANT_EXCLUDE_ALL,
		/obj/item/stack/cable_coil/fabricator					= MERCHANT_EXCLUDE_ALL,
		/obj/item/stack/cable_coil/single						= MERCHANT_EXCLUDE_ALL,
		/obj/item/stock_parts/circuitboard/air_alarm			= MERCHANT_INCLUDE_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/airlock_electronics	= MERCHANT_INCLUDE_ALL,
		/obj/item/cell											= MERCHANT_INCLUDE_THIS_TYPE,
		/obj/item/cell/crap										= MERCHANT_INCLUDE_THIS_TYPE,
		/obj/item/cell/high										= MERCHANT_INCLUDE_THIS_TYPE,
		/obj/item/cell/super									= MERCHANT_INCLUDE_THIS_TYPE,
		/obj/item/cell/hyper									= MERCHANT_INCLUDE_THIS_TYPE,
		/obj/item/tracker_electronics							= MERCHANT_INCLUDE_THIS_TYPE
	)


/decl/merchant_speech/electronics_store
	hailed = "Hello, "+MERCHANT_TOKEN_PLAYER_HONORIFIC+"! Welcome to "+MERCHANT_TOKEN_ORIGIN+", I hope you find what you are looking for."
	denied_hail = "Your call has been disconnected."
	trade_complete = "Thank you for shopping at "+MERCHANT_TOKEN_ORIGIN+", would you like to get the extended warranty as well?"
	forbidden_offer = MERCHANT_TOKEN_PLAYER_HONORIFIC+", this is a /electronics/ store."
	goods_not_accepted = "As much as I'd love to buy that from you, I can't."
	not_enough_value = "Your offer isn't adequate, "+MERCHANT_TOKEN_PLAYER_HONORIFIC+"."
	how_much = "Your total comes out to "+MERCHANT_TOKEN_VALUE+" "+MERCHANT_TOKEN_CURRENCY+"."
	compliment_failure = "Hahaha! Yeah... funny..."
	compliment_success = "That's very nice of you!"
	insult_high_opinion = "That was uncalled for, "+MERCHANT_TOKEN_PLAYER_HONORIFIC+". Don't make me get my manager."
	insult_low_opinion = MERCHANT_TOKEN_PLAYER_HONORIFIC+", I am allowed to hang up the phone if you continue, "+MERCHANT_TOKEN_PLAYER_HONORIFIC+"."
	bribe_failure = "Sorry, "+MERCHANT_TOKEN_PLAYER_HONORIFIC+", but I can't really do that."
	bribe_success = "Why not! Glad to be here for a few more minutes."
	leaving_soon = "I can stay for another "+MERCHANT_TOKEN_TIME+" minutes."
