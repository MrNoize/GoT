mob/proc
	speed_check()
		usr.movespeed = speedboost
		usr << "[movespeed]"

mob/verb/SeeInvisible()                 //��������� ������ ��� ���������, �� �� ����� �����
	usr.see_invisible = 100