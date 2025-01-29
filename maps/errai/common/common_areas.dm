// Specific maps can override these as needed, since their definitions will be later in the load order.
/area/ship/errai
	icon = 'maps/errai/common/generic_areas.dmi'
	holomap_color = HOLOMAP_AREACOLOR_CREW

/*
	Command
*/
/area/ship/errai/command
	icon_state = "cerulean3"
	holomap_color = HOLOMAP_AREACOLOR_COMMAND

/*
	Engineering
*/
/area/ship/errai/engineering
	icon_state = "yellow3"
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/*
	Maintenance
*/
/area/ship/errai/maintenance
	holomap_color = HOLOMAP_AREACOLOR_MAINTENANCE
	icon_state = "yellow1"
	sound_env = TUNNEL_ENCLOSED
	area_flags = AREA_FLAG_RAD_SHIELDED
	turf_initializer = /decl/turf_initializer/maintenance
	forced_ambience = list('sound/ambience/maintambience.ogg')

/*
	Security
*/
/area/ship/errai/security
	icon_state = "red3"
	holomap_color = HOLOMAP_AREACOLOR_SECURITY

/*
	Medical
*/
/area/ship/errai/medical
	icon_state = "cyan3"
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL

/*
	Research
*/
/area/ship/errai/research
	icon_state = "purple3"
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/*
	Supply
*/
/area/ship/errai/supply
	icon_state = "orange3"
	holomap_color = HOLOMAP_AREACOLOR_CARGO

/*
	Service
*/
/area/ship/errai/service
	icon_state = "green3"
	holomap_color = HOLOMAP_AREACOLOR_CREW

/*
	Hallways
*/
/area/ship/errai/hallway
	icon_state = "green2"
	holomap_color = HOLOMAP_AREACOLOR_HALLWAYS
	secure = FALSE

/*
	Shuttles
*/
/area/ship/errai/shuttle
	icon_state = "pink3"
	holomap_color = HOLOMAP_AREACOLOR_EXPLORATION
	area_flags = AREA_FLAG_RAD_SHIELDED

