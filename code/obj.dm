obj
	icon='icons/obj.dmi'

obj/soldiers
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
	quantity= pick(10,20,40,50)

obj/tree
	icon_state="tree0"
	New()
		..()
		var/I = rand(0,4)
		src.icon_state="tree[I]"
		var/area/forest/F = new(src.loc)
		F.desc = "Делает невидимым"


obj/forest
	density=1
	opacity=1
	icon_state="forest0"
	New()
		..()
		var/I = rand(0,3)
		src.icon_state="forest[I]"
		var/area/forest/F = new(src.loc)
		F.desc = "Делает невидимым"

obj/bush
	icon = 'icons/flora.dmi'
	icon_state = "bush_1"
	New()
		..()
		var/I=rand(1,56)
		src.icon_state = "bush_[I]"
