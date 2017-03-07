mob/proc
	speed_check()
		usr.movespeed = speedboost
		usr << "[movespeed]"

mob/verb/SeeInvisible()                 //ѕозвол€ет видеть все невидимое, но не через стены
	usr.see_invisible = 100