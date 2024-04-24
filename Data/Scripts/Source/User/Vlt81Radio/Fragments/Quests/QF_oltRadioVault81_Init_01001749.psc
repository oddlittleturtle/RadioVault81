;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Vlt81Radio:Fragments:Quests:QF_oltRadioVault81_Init_01001749 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE Vlt81Radio:oltRadioVault81QuestInitScript
Quest __temp = self as Quest
Vlt81Radio:oltRadioVault81QuestInitScript kmyQuest = __temp as Vlt81Radio:oltRadioVault81QuestInitScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " Setting stage 10. Starting up Radio Vault 81!!!" )
;turn on Radio Vault 81
;kmyQuest.TurnOnRadioVault81()

;set up radios
kmyQuest.SwitchOldRadios()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN AUTOCAST TYPE Vlt81Radio:oltRadioVault81QuestInitScript
Quest __temp = self as Quest
Vlt81Radio:oltRadioVault81QuestInitScript kmyQuest = __temp as Vlt81Radio:oltRadioVault81QuestInitScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "Stage 255")
kmyQuest.UnregisterForMQEvent()

utility.wait(1.0)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
