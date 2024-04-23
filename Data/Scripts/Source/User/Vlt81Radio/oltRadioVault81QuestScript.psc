Scriptname Vlt81Radio:oltRadioVault81QuestScript extends Quest Conditional
{Vault 81 music featuring compositions from Guilherme Bernardes https://pixabay.com/users/guilhermebernardes-24203804/}


;/---------------------------------------------
       PROPERTIES
-----------------------------------------------/;

Group Songs
    Int Property CurrentSong Auto   Conditional
    Int Property LastSong01  Auto   Conditional
    Int Property LastSong02  Auto   Conditional
    Int Property LastSong03  Auto   Conditional
    Int Property LastSong04  Auto   Conditional
    Int Property LastSong05  Auto   Conditional
    Int Property LastSong06  Auto   Conditional
    Int Property LastSong07  Auto   Conditional
    Int Property LastSong08  Auto   Conditional
    Int Property LastSong09  Auto   Conditional
EndGroup


Group Timer_Properties
    Int Property RadioVlt81TimerID = 25     Auto Conditional
    Float Property LastSceneStartTime       Auto Conditional
    GlobalVariable Property GameDaysPassed  Auto Const Mandatory
EndGroup

Group Scene_Properties
    Scene Property oltRadioVault81RadioMusicScene Auto Const Mandatory
EndGroup

;/---------------------------------------------
       VAULT 81 RADIO
-----------------------------------------------/;

; the event that pushes the scenes
Event OnTimerGameTime(int aiTimerID)
    if (aiTimerID == RadioVlt81TimerID)
        ((LastSceneStartTime + 1) < (GameDaysPassed.GetValue()))
        ;restart everything
        oltRadioVault81RadioMusicScene.Start()
    endif

    ;run again
    StartTimerGameTime(12, RadioVlt81TimerID)
EndEvent

; update the songs on the radio
Function UpdateRadio()
    SongCount += 1

	LastSong09 = LastSong08
	LastSong08 = LastSong07
	LastSong07 = LastSong06
	LastSong06 = LastSong05
	LastSong05 = LastSong04
	LastSong04 = LastSong03
	LastSong03 = LastSong02
	LastSong02 = LastSong01
	LastSong01 = CurrentSong
EndFunction

; Timer function
Function StartVault81RadioTimer()
    StartTimerGameTime(12, RadioVlt81TimerID)
EndFunction


