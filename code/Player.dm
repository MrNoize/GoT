mob
	New()
		..()
		usr.icon_check()
	Login()
		src.loc=locate(/turf/build/town)
		world<<"[src] has Logged In"
		usr.icon_check()
		create_character()
//		changemovedelay()
	Logout()
		world<<"[src] has Logged Out"
	var/infantry = 1
	var/cavalry = 0
	var/movespeed = 1
	var/speedboost = 2
	var/list/L = list(1,2,1,1)    //(pathfinding, commerce, defense, offensive)
	var/movedelay = 0
	var/mayattack = 1


mob/verb

	Say(t as text)
		view()<<"<b>[src]:</b> says: [t]"

	Show_stop()
		overlays += /obj/overlay/stop
		spawn(10)
		overlays -= /obj/overlay/stop

	Magic_Say(t as text)
		world<<"<b>Magicsay: [src]:</b> [t]"

	Icon_check()
		usr.icon_check()

	Speed_Check()
		speed_check()

	Attack()
		set src in oview(1,usr)
		if(src.mayattack == 1 & usr.mayattack == 1)
			usr.mayattack = 0
			src.mayattack = 0
			var/temp_cavalry = src.cavalry
			var/temp_infantry = src.infantry
			src.cavalry =- usr.cavalry
			src.infantry =- usr.infantry
			usr.cavalry =- temp_cavalry
			usr.infantry =- temp_infantry
			sleep(10)
			if( (src.cavalry+src.infantry)>(usr.cavalry+usr.infantry) )
				src.mayattack = 1
				view(6) << "[usr] attacked [src]. And was defeated."
				walk_away(usr,src,10)
				sleep(100)
				usr.mayattack = 1
			else if ( (src.cavalry+src.infantry) == (usr.cavalry+usr.infantry) )
				view(6) << "[usr] attacked [src]. And noone won. Сan you help them to choose the winner?"
			else
				view(6) << "[usr] attacked [src]. And won. "
				usr.mayattack = 1
				walk_away(src,usr,10)
				sleep(30)
				walk(src,0)
				src.mayattack = 1
		else usr << "You can't attack him."

	GetHisBody()
		set src in view(10)
		src.key = usr.key

mob/Player
	icon='icons/Player.dmi'
	icon_state="infantry0"
	var/Busy = 0


	Stat()
		stat("Name:",usr.name)
		stat("")
		stat("Pathfinfing",usr.L[1]) //Для скорости передвижения
		stat("Commerce",usr.L[2])     //Навык торговли.
		stat("Defensive",usr.L[3])   //Пассивный навык защиты
		stat("Offensive",usr.L[4])   //Пассивный навык нападения.
		stat("")
		stat("MayBeAttacked",usr.mayattack)   //Может ли атаковать или быть атакованным



	Move()
		if(!Busy)
			..()
			Busy = 1;
			spawn(movedelay)
				Busy = 0

mob/proc
	icon_check()
		var/tempicon = src.icon_state
		if(src.cavalry/src.infantry >=1)
			src.icon_state="horse"
			src<<"You are now in horse"
		else src.icon_state="[tempicon]"
//	changemovedelay()
//		usr.movedelay =0.5 * (usr.infantry+usr.cavalry)
	create_character()
		usr.name = input("Choose a name for your character.","Your Name",usr.name)
		usr.infantry = 400//input("Choose infantry quantity.","Infantry",usr.infantry)
		usr.cavalry = 200//input("Choose cavalry quantity.","Cavalry",usr.cavalry)
		var/tempicon = 1
		tempicon = input("Select your character icon.","Your icon",tempicon) in list(0,1,2,3)
		input("Внимание. Это препрепрепрерперперпеальфа. Голосуйте за гринлайт в стиме.","Спасибо за внимание") in list("Купить коллекционную версию","Начать играть")
		usr.icon = 'Player.dmi'
		usr.icon_state = "infantry[tempicon]"
		icon_check()

