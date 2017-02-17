obj/soldiers
	icon='icons/obj.dmi'
	var/quantity
	free_cavalry
		icon_state="free_cavalry"
	free_infantry
		icon_state="free_infantry"


obj/soldiers/free_cavalry/verb/Hire()
	set src in view(1)
	usr << "You have hire [src.quantity] knights"
	usr.cavalry += src.quantity
	usr.icon_check()
	del src

obj/soldiers/free_infantry/verb/Hire()
	set src in view(1)
	usr << "You have hire [src.quantity] troopers"
	usr.infantry += src.quantity
	usr.icon_check()
	del src

obj/soldiers/New()
	..()
	quantity= pick(100,200,400,500)

