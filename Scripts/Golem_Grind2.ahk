#SingleInstance Force
#Requires AutoHotkey v2.0
;AHK script for GBF: Relink
;Modified for Golemology 103 
;Original by Wielkimati
;https://github.com/Wielkimati/GBFR-Slimepede-Farm 

;Timings in miliseconds
movingTime := 10
;questime variable depends on how well built your Rackam is /!\
questTime := 170000
loadingTime := 7000

$F1::{
	loop{
		TeleportToQuestCounter()
		GoToQuestCounterAndGetGolemology103()
		EmbarkOnQuest()

		;Loading quest
		Sleep loadingTime

		MoveCharacterToLocationAtStart()

		startTime := A_TickCount
		Loop {
			Shoot()
		} Until (A_TickCount - startTime > questTime)
		ClearKeys()
		
		;Wait for quest end, and wait some more just o be sure everything is in the starting place again
		Sleep 20000
	}
}

TeleportToQuestCounter(){
	SendInput "{r down}"
	Sleep 400
	SendInput "{r up}"
	Sleep 750
	SendEvent "{LButton Down}"
	Sleep 500
	SendEvent "{LButton up}"
	Sleep 750
	SendEvent "{LButton Down}"
	Sleep 500
	SendEvent "{LButton up}"
	Sleep 1500
	SendInput "{w down}"
	Sleep 1000
	SendInput "{w up}"
	Sleep 1000
}

GoToQuestCounterAndGetGolemology103(){
	SendInput "{f down}"
	Sleep 500
	SendInput "{f up}"
	Sleep 2000

	SendEvent "{LButton Down}"
	Sleep 500
	SendEvent "{LButton up}"

	Sleep 750
	SendEvent "{LButton Down}"
	Sleep 500
	SendEvent "{LButton up}"
	Sleep 750
	
	;
	SendEvent "{d Down}"
	Sleep 100
	SendEvent "{d up}"
	Sleep 750
	
	SendEvent "{w Down}"
	Sleep 100
	SendEvent "{w up}"
	Sleep 750
	SendEvent "{w Down}"
	Sleep 100
	SendEvent "{w up}"
	Sleep 750
	
	;
	SendEvent "{LButton Down}"
	Sleep 500
	SendEvent "{LButton up}"
	Sleep 750
	SendEvent "{LButton Down}"
	Sleep 500
	SendEvent "{LButton up}"
	Sleep 750
	SendEvent "{LButton Down}"
	Sleep 500
	SendEvent "{LButton up}"
	Sleep 2000
}

EmbarkOnQuest(){
	SendInput "{3 down}"
	Sleep 500
	SendInput "{3 up}"
	Sleep 1000
	SendEvent "{LButton Down}"
	Sleep 500
	SendEvent "{LButton up}"
}

;Unused 
MoveCharacterToLocationAtStart(){
	SendInput "{w down}"
	Sleep movingTime
	SendInput "{w up}"
}

Shoot(){
	FireWeapon()
	Sleep 20
}

FireWeapon(){
	SendEvent "{LButton}"
	Sleep 5
	SendEvent "{LButton}"
	Sleep 5
}

ClearKeys(){
	SendInput "{w up}"
	Sleep 5
	SendInput "{a up}"
	Sleep 5
	SendInput "{s up}"
	Sleep 5
	SendInput "{d up}"
	Sleep 5
	SendEvent "{LButton up}"
	Sleep 5
}

$+esc::{
	ClearKeys()
	exitapp
}