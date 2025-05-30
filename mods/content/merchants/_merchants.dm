/decl/modpack/merchants
	name = "Merchants"
	desc = "Adds off-map merchants who can be traded with."
	nanoui_directory = "mods/content/merchants/nano_templates/"

/decl/modpack/merchants/pre_initialize()
	. = ..()
	global.debug_verbs |= list(
		/datum/admins/proc/list_merchants,
		/datum/admins/proc/add_singleton_trade_hub,
		/datum/admins/proc/add_overmap_trade_hub,
		/datum/admins/proc/remove_trade_hub,
		/datum/admins/proc/add_merchant,
		/datum/admins/proc/remove_merchant
		)