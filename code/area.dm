area/forest
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


area/cityexit
	density=0
	Enter()
		src.verbs += /mob/proc/leave_city
		return ..()
	Exit()
		src.verbs -= /mob/proc/leave_city
		return ..()