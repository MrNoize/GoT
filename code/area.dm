area
	icon = 'icons/area/main.dmi'
	layer = MOB_LAYER+1
	icon_state = "none"
	invisibility = 99

area/forest
	icon_state = "forest"
	Enter()
		usr << " Shadow has swallow you.."
		usr.see_invisible = 20
		usr.invisibility = 15
		view(5) << "[usr] is fading in the shadows"
		return 1
	Exit()
		usr << " Sun is heat your body.."
		usr.see_invisible = 0
		usr.invisibility = 0
		return 1

area/safezone
	icon_state = "safezone"
	Enter()
		usr.mayattack=0
		return 1
	Exit()
		usr.mayattack=1
		return 1


//Уже не актуально, другая система перехода в город\на карту. Оставлю если потребуется.
/*
area/cityexit
	density=0
	Enter()
		src.verbs += /mob/proc/leave_city
		return ..()
	Exit()
		src.verbs -= /mob/proc/leave_city
		return ..()


mob/proc/leave_city()
	usr.Move(locate(/turf/build/town))

*/