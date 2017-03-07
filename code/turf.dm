
//Ground

turf
	icon='icons/turfs.dmi'
	Grass
		icon_state="grass"
		New()
			..()
			var/chance = rand(1,100)                                   //���������� ������ �������� �����
			if ( chance < 30 )
				var/obj/bush/F = new(src)
				F.desc = "���������� ��������"
			else return


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
/turf/build/town
	var/Cityname
	icon='turfs64.dmi'
	icon_state="town"
	DblClick(o,var/c)
		c = input("�� ������������� ������ ������� � ����� [Cityname]","�������",c) in list("��","���")
		if (c == "��") usr.Move(locate(2,6,1))



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
	city_gate
		icon='turfs64.dmi'
		icon_state="wall_gate"
		DblClick(o,var/c)
			c = input("�� ������������� ������ �������� ����� �����","�������",c) in list("��","���")
			if (c == "��") usr.Move(locate(/turf/build/town))