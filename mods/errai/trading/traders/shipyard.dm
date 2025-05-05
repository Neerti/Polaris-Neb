// Shipyards are essentially giant malls for Engineering.
/obj/effect/overmap/trade_hub/errai/shipyard
	name = "Orbital Shipyard"
	desc = "Shipyards are stations that build and repair spaceships."
	extended_desc = "They are somewhat rare, as shipbuilding is a very expensive enterprise that demands a \
	highly developed economy to support it, as well as a highly skilled workforce. Thus, they tend to exist \
	in the core territory of powerful nations, owned by the government or a prominent mega-corporation. \
	Everyone else will be forced to buy ships from them, often with a significant markup.<br>\
	Shipyards are also used to modify and upgrade older ships, allowing them to extend their service life and have \
	features and capabilities that other ships of their class didn't have when they were built."

/obj/effect/overmap/trade_hub/errai/shipyard/get_trading_post_type()
	return /datum/trade_hub/overmap/errai/shipyard

/datum/trade_hub/overmap/errai/shipyard
	max_traders = 7
//	possible_trader_types = list(/datum/trader/errai/shipyard)

/datum/trade_hub/overmap/errai/get_initial_traders()
	return list(
		/datum/trader/errai/shipyard/electrical,
		/datum/trader/errai/shipyard/defense,
		/datum/trader/errai/shipyard/engine/high,
		/datum/trader/errai/shipyard/computing,
		/datum/trader/errai/shipyard/materials,
		/datum/trader/errai/canteen
	)

/datum/trader/errai/shipyard
	name = "Shipyard"
	origin = "Orbital Shipyard Warehouse"
	margin = 2

// Stuff that transmits power.
/datum/trader/errai/shipyard/electrical
	name = "Electrical"
	possible_trading_items = list(
		/obj/item/stock_parts/circuitboard/apc					= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/smes					= TRADER_THIS_TYPE,
		/obj/item/stock_parts/smes_coil							= TRADER_ALL,
		/obj/item/cell/high 									= TRADER_THIS_TYPE,
		/obj/item/stack/cable_coil								= TRADER_ALL,
		/obj/item/stack/cable_coil/cyborg						= TRADER_BLACKLIST,
		/obj/item/stack/cable_coil/fabricator					= TRADER_BLACKLIST,
		/obj/item/stock_parts/circuitboard/breaker				= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/batteryrack			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/recharger			= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/cell_charger			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/recharge_station		= TRADER_THIS_TYPE

	)

/datum/trader/errai/shipyard/atmospherics
	name = "Atmospherics"
	possible_trading_items = list(
		/obj/machinery/fabricator/pipe							= TRADER_THIS_TYPE,
		/obj/machinery/fabricator/pipe/disposal					= TRADER_THIS_TYPE,
		/obj/machinery/portable_atmospherics/powered/pump		= TRADER_THIS_TYPE,
		/obj/machinery/portable_atmospherics/powered/scrubber	= TRADER_THIS_TYPE,
		/obj/machinery/dehumidifier								= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/unary_atmos/cooler	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/unary_atmos/heater	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/portable_scrubber	= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/tray					= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/dehumidifier			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/space_heater			= TRADER_THIS_TYPE

	)

// Stuff that makes the ship not explode as fast.
/datum/trader/errai/shipyard/defense
	name = "Defense"
	possible_trading_items = list(
		/obj/item/stock_parts/circuitboard/shield_generator		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/shield_diffuser		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/pointdefense			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/pointdefense_control	= TRADER_THIS_TYPE,
	)

// Stuff that makes other ships explode faster. Most shipyards won't offer these.
/datum/trader/errai/shipyard/offense
	name = "Offense"
	possible_trading_items = list(
		/obj/item/stock_parts/circuitboard/disperser		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/disperserback	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/disperserfront	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/dispersermiddle	= TRADER_THIS_TYPE,
		/obj/structure/ship_munition/disperser_charge		= TRADER_SUBTYPES_ONLY
	)

// Stuff that makes power.
/datum/trader/errai/shipyard/engine
	name = "Engines"
	abstract_type = /datum/trader/errai/shipyard/engine


// 'Low end' engines, such as fission reactors.
/datum/trader/errai/shipyard/engine/low
	possible_trading_items = list(
		// Solars.
		/obj/item/solar_assembly								= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/solar_control		= TRADER_THIS_TYPE,
		/obj/item/tracker_electronics							= TRADER_THIS_TYPE,

		// Generators.
		/obj/machinery/port_gen/pacman							= TRADER_THIS_TYPE,
		/obj/machinery/port_gen/pacman/super					= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/pacman				= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/pacman/super			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/pacman/super/potato	= TRADER_THIS_TYPE,

		// TEGs.
		/obj/machinery/generator								= TRADER_THIS_TYPE,
		/obj/machinery/atmospherics/binary/circulator			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/turbine				= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/big_turbine			= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/teg_turbine			= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/unary_atmos/stirling = TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fission_core_control	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/unary_atmos/fission_core	= TRADER_THIS_TYPE,

		// Fusion.
		/obj/item/stock_parts/circuitboard/fusion/core_control	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fusion_core			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fusion_fuel_control	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fusion_injector		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/gyrotron				= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/gyrotron_control		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fuel_compressor		= TRADER_THIS_TYPE
	)

// 'Mid range' engines, such as SM and fusion reactors.
/datum/trader/errai/shipyard/engine/mid
	possible_trading_items = list(
		// Solars.
		/obj/item/solar_assembly								= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/solar_control		= TRADER_THIS_TYPE,
		/obj/item/tracker_electronics							= TRADER_THIS_TYPE,

		// Generators.
		/obj/machinery/port_gen/pacman							= TRADER_ALL,
		/obj/machinery/port_gen/pacman/super/potato				= TRADER_BLACKLIST, // Not portable.
		/obj/item/stock_parts/circuitboard/pacman				= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/pacman/super			= TRADER_THIS_TYPE,

		// Supermatter.
		/obj/machinery/generator								= TRADER_THIS_TYPE,
		/obj/machinery/atmospherics/binary/circulator			= TRADER_THIS_TYPE,
		/obj/machinery/emitter									= TRADER_THIS_TYPE,
		/obj/machinery/power/supermatter						= TRADER_THIS_TYPE,

		// Fusion.
		/obj/item/stock_parts/circuitboard/fusion/core_control	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fusion_core			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fusion_fuel_control	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fusion_injector		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/gyrotron				= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/gyrotron_control		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fuel_compressor		= TRADER_THIS_TYPE,

		// Misc.
		/obj/item/stock_parts/circuitboard/turbine				= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/big_turbine			= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/teg_turbine			= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/unary_atmos/stirling = TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fission_core_control	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/unary_atmos/fission_core	= TRADER_THIS_TYPE
	)

// 'High end' engines, such as the singulo and portable fusion.
/datum/trader/errai/shipyard/engine/high
	possible_trading_items = list(
		// Solars.
		/obj/item/solar_assembly								= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/solar_control		= TRADER_THIS_TYPE,
		/obj/item/tracker_electronics							= TRADER_THIS_TYPE,

		// Singulo.
		/obj/machinery/emitter									= TRADER_THIS_TYPE,
		/obj/machinery/field_generator							= TRADER_THIS_TYPE,
		/obj/machinery/rad_collector							= TRADER_THIS_TYPE,
		/obj/structure/particle_accelerator/fuel_chamber		= TRADER_THIS_TYPE,
		/obj/machinery/particle_accelerator/control_box			= TRADER_THIS_TYPE,
		/obj/structure/particle_accelerator/particle_emitter	= TRADER_SUBTYPES_ONLY, // Includes left, right, and center pieces.
		/obj/structure/particle_accelerator/power_box			= TRADER_THIS_TYPE,
		/obj/structure/particle_accelerator/end_cap				= TRADER_THIS_TYPE,
		/obj/machinery/singularity_generator					= TRADER_THIS_TYPE,

		// Generators.
		/obj/machinery/port_gen/pacman							= TRADER_ALL,
		/obj/machinery/port_gen/pacman/super/potato				= TRADER_BLACKLIST, // Not portable.
		/obj/machinery/port_gen/pacman/mrs						= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/pacman				= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/pacman/super			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/pacman/mrs			= TRADER_THIS_TYPE,

		// Supermatter.
		/obj/machinery/generator								= TRADER_THIS_TYPE,
		/obj/machinery/atmospherics/binary/circulator			= TRADER_THIS_TYPE,
		/obj/machinery/power/supermatter						= TRADER_THIS_TYPE,

		// Fusion.
		/obj/item/stock_parts/circuitboard/fusion/core_control	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fusion_core			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fusion_fuel_control	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fusion_injector		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/gyrotron				= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/gyrotron_control		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fuel_compressor		= TRADER_THIS_TYPE,

		// Misc.
		/obj/item/stock_parts/circuitboard/turbine				= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/big_turbine			= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/teg_turbine			= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/unary_atmos/stirling = TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/fission_core_control	= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/unary_atmos/fission_core	= TRADER_THIS_TYPE
	)

// Computers and telecomms stuff.
/datum/trader/errai/shipyard/computing
	name = "Computing and Networking"
	possible_trading_items = list(
		/obj/item/stock_parts/circuitboard/aicore				= TRADER_THIS_TYPE,
		/obj/item/stack/net_cable_coil							= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/commsrelay			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/subspace							= TRADER_SUBTYPES_ONLY,
		/obj/item/stock_parts/circuitboard/acl					= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/mainframe			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/relay				= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/router				= TRADER_ALL,
		/obj/item/stock_parts/circuitboard/telecomms_hub		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/message_monitor		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/message_server		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/commsrelay			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/design_database		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/design_console		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/modem				= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/comms_maser			= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/comms_antenna		= TRADER_THIS_TYPE,
		/obj/item/stock_parts/circuitboard/shipsensors			= TRADER_THIS_TYPE
	)

// Overpriced materials.
/datum/trader/errai/shipyard/materials
	name = "Materials"
	margin = 3 // Reaaaaaally overpriced.
	possible_trading_items = list(
		// Sheets.
		/obj/item/stack/material/sheet/mapped/steel/fifty					= TRADER_THIS_TYPE,
		/obj/item/stack/material/sheet/shiny/mapped/aluminium/fifty			= TRADER_THIS_TYPE,
		/obj/item/stack/material/sheet/reinforced/mapped/fiberglass/fifty	= TRADER_THIS_TYPE,
		/obj/item/stack/material/sheet/reinforced/mapped/titanium/fifty		= TRADER_THIS_TYPE,
		/obj/item/stack/material/sheet/reinforced/mapped/ocp/fifty			= TRADER_THIS_TYPE,
		/obj/item/stack/material/sheet/reinforced/mapped/plasteel/fifty		= TRADER_THIS_TYPE,
		/obj/item/stack/material/sheet/reinforced/mapped/titanium/fifty		= TRADER_THIS_TYPE,
		/obj/item/stack/material/sheet/mapped/chipboard_oak/fifty			= TRADER_THIS_TYPE,
		/obj/item/stack/material/sheet/mapped/chipboard_maple/fifty			= TRADER_THIS_TYPE,
		/obj/item/stack/material/sheet/mapped/chipboard_walnut/fifty		= TRADER_THIS_TYPE,
		/obj/item/stack/material/sheet/mapped/chipboard_yew/fifty			= TRADER_THIS_TYPE,
		/obj/item/stack/material/sheet/mapped/chipboard_mahogany/fifty		= TRADER_THIS_TYPE,
		/obj/item/stack/material/sheet/mapped/chipboard_ebony/fifty			= TRADER_THIS_TYPE,

		// Panes.
		/obj/item/stack/material/pane/mapped/glass/fifty					= TRADER_THIS_TYPE,
		/obj/item/stack/material/pane/mapped/borosilicate/fifty				= TRADER_THIS_TYPE,
		/obj/item/stack/material/pane/mapped/rglass/fifty					= TRADER_THIS_TYPE,
		/obj/item/stack/material/pane/mapped/rborosilicate/fifty			= TRADER_THIS_TYPE,

		// Panels.
		/obj/item/stack/material/panel/mapped/plastic/fifty					= TRADER_THIS_TYPE,

		// Bricks.
		/obj/item/stack/material/brick/mapped/marble/fifty					= TRADER_THIS_TYPE,
		/obj/item/stack/material/brick/mapped/graphite/fifty				= TRADER_THIS_TYPE,

		// Ingots.
		/obj/item/stack/material/ingot/mapped/copper/fifty					= TRADER_THIS_TYPE,
		/obj/item/stack/material/ingot/mapped/lead/fifty					= TRADER_THIS_TYPE,
		/obj/item/stack/material/ingot/mapped/iron/fifty					= TRADER_THIS_TYPE,

		// Planks.
		/obj/item/stack/material/plank/mapped/wood/fifty					= TRADER_THIS_TYPE,
		/obj/item/stack/material/plank/mapped/mahogany/fifty				= TRADER_THIS_TYPE,
		/obj/item/stack/material/plank/mapped/maple/fifty					= TRADER_THIS_TYPE,
		/obj/item/stack/material/plank/mapped/walnut/fifty					= TRADER_THIS_TYPE,
		/obj/item/stack/material/plank/mapped/ebony/fifty					= TRADER_THIS_TYPE,
		/obj/item/stack/material/plank/mapped/yew/twentyfive				= TRADER_THIS_TYPE,

		// Carpet/Flooring.
		/obj/item/stack/tile/carpet/fifty									= TRADER_THIS_TYPE,
		/obj/item/stack/tile/carpet/blue/fifty								= TRADER_THIS_TYPE,
		/obj/item/stack/tile/carpet/blue2/fifty								= TRADER_THIS_TYPE,
		/obj/item/stack/tile/carpet/blue3/fifty								= TRADER_THIS_TYPE,
		/obj/item/stack/tile/carpet/magenta/fifty							= TRADER_THIS_TYPE,
		/obj/item/stack/tile/carpet/purple/fifty							= TRADER_THIS_TYPE,
		/obj/item/stack/tile/carpet/orange/fifty							= TRADER_THIS_TYPE,
		/obj/item/stack/tile/carpet/green/fifty								= TRADER_THIS_TYPE,
		/obj/item/stack/tile/carpet/red/fifty								= TRADER_THIS_TYPE,
		/obj/item/stack/tile/linoleum/fifty									= TRADER_THIS_TYPE,
		/obj/item/stack/tile/floor_white/fifty								= TRADER_THIS_TYPE,
		/obj/item/stack/tile/floor_dark/fifty								= TRADER_THIS_TYPE,
		/obj/item/stack/tile/floor_freezer/fifty							= TRADER_THIS_TYPE
	)
