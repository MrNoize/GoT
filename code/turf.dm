
//Ground

turf
	icon='icons/turfs.dmi'
	Grass
		icon_state="grass"

	tree
		icon_state="tree0"
		New()
			..()
			var/I = rand(0,4)
			src.icon_state="tree[I]"


	forest
		density=1
		opacity=1
		icon_state="forest0"
		New()
			..()
			var/I = rand(0,3)
			src.icon_state="forest[I]"
	cobblestone
		icon_state="cobblestone"

	water
		density=1
		icon_state="water"
	bridge
		density=0
		icon_state="bridge"
//Builds

/turf/build
	icon='icons/builds.dmi'

/turf/build/wall
	icon_state="wall"
	density=1
	opacity=1
/turf/build/townhall
	icon_state="townhall"
	verb
		EnterToCity()
			set src in view(1)
			usr.Move(locate(2,6,1))



//City
turf/city
	icon='city_turfs.dmi'


	city_wall
		density = 1
		opacity = 1
		icon_state="wall"
	city_house_wall
		density = 1
		opacity = 1
		icon_state="house_wall"
	city_house_window
		density = 1
		icon_state="house_window"
	city_road
		icon_state="road"
	city_floor
		icon_state="floor"