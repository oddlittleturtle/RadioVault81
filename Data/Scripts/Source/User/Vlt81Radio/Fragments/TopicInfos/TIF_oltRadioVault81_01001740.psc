;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Vlt81Radio:Fragments:TopicInfos:TIF_oltRadioVault81_01001740 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE Vlt81Radio:oltRadioVault81QuestScript
Vlt81Radio:oltRadioVault81QuestScript kmyQuest = GetOwningQuest() as Vlt81Radio:oltRadioVault81QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CurrentSong=1
kmyQuest.UpdateRadio()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment