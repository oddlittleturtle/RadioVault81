Scriptname Vlt81Radio:oltRadioVault81QuestInitScript extends Quest
{Adds everything to appropriate spot.}

;/---------------------------------------------
       PROPERTIES
-----------------------------------------------/;
Group Message_Properties
    Formlist Property HelpManualPC Auto Const Mandatory
    Formlist Property HelpManualXBox Auto Const Mandatory
    Message Property oltHelpVault81Radio Auto Const Mandatory
EndGroup

Group MQ102_Properties
    Int Property MyStageToSet Auto Const Mandatory
    Int Property MyStageToWatch = 10 Auto Const
    Quest Property MQ102 Auto Const Mandatory
EndGroup

Group Radios
    FormList Property workshopScrapRecipe_Radio Auto Const
    Activator Property oltRadioVault81Receiver Auto Const
    Activator Property oltRadioVault81ReceiverNew Auto Const
EndGroup

bool bInitialized = false

;/---------------------------------------------
       BASE RADIOS
-----------------------------------------------/;
; these didn't have unique names

;old radio in Penske's room
ObjectReference RadioDiamondCityReceiver
Int iRadioDiamondCityReceiver = 0x0019D897 const
;X = -2753.1541
;Y = -963.0422
;Z = -433.2913
;Rotation = 342.8113

; new radio at Vault entrance
ObjectReference RadioDiamondCityReceiverNew_1
Int iRadioDiamondCityReceiverNew_1 = 0x001B2372 const

; new radio in Sunshine Diner
ObjectReference RadioDiamondCityReceiverNew_2
Int iRadioDiamondCityReceiverNew_2 = 0x001B2371 const

;new radio in Barber Shop
ObjectReference RadioDiamondCityReceiverNew_3
Int iRadioDiamondCityReceiverNew_3 = 0x001B2374 const

;new radio in Reactor
ObjectReference RadioDiamondCityReceiverNew_4
Int iRadioDiamondCityReceiverNew_4 = 0x001B2373 const

;old and off radio on floor in Tina's room
ObjectReference RadioDiamondCityReceiverOff
Int iRadioDiamondCityReceiverOff = 0x0019D8A0 const

;center marker
ObjectReference Vault81AtriumMapMarker
int iVault81AtriumMapMarker = 0x0021DDB9 const

String sFO4 = "Fallout4.esm" const
bool bFO4EventsReady

;/---------------------------------------------
       NEW RADIOS
-----------------------------------------------/;
;these will autofill when the plugin loads

;radio going to Penske's Room
ObjectReference Property oltRadioOldPenskeRoom Auto Hidden
Int ioltRadioOldPenskeRoom = 0x0000174F const

;radio going to Vault Entrance
ObjectReference Property oltRadioNewVaultEntrance Auto Hidden
Int ioltRadioNewVaultEntrance = 0x0000176F const

;radio going to Sunshine Diner
ObjectReference Property oltRadioNewSunshineDiner Auto Hidden
int ioltRadioNewSunshineDiner = 0x00001770 const

;radio going to Barber Shop
ObjectReference Property oltRadioNewBarbershop Auto Hidden
int ioltRadioNewBarbershop = 0x00001771 const

;radio going to Reactor
ObjectReference Property oltRadioNewReactor Auto Hidden
int ioltRadioNewReactor = 0x00001772 const

;radio going to Tina's Room
ObjectReference Property oltRadioOffTinasRoom Auto Hidden
int ioltRadioOffTinasRoom = 0x00001773 const

;center marker
ObjectReference Property oltRadioMarkerCenterRef Auto Hidden
int ioltRadioMarkerCenterRef = 0x00001750 const


String sRV81 = "RadioVault81_olt.esm"

bool bRadioEventsReady



;/---------------------------------------------
       QUEST START
-----------------------------------------------/;
Event OnQuestInit()
    if (!bInitialized)
        ; these only need to be called here. We're already going to have the plugins loaded
        bFO4EventsReady = bFO4EventsReady || ProcessOldRadioVariables()
        bRadioEventsReady = bRadioEventsReady || ProcessNewRadioVariables()

        ;add our help menu message
        AddToHelpFiles()

        ;register for player leaving vault
        RegisterForMQEvent()
    endif
    bInitialized = true
    debug.trace(self + " --- Radio Vault 81 - Initialized.")
EndEvent


Event Quest.OnStageSet(quest akSendingQuest, int auiStageID, int auiItemID)
    RegisterForMQEvent()
EndEvent

;/---------------------------------------------
       FUNCTIONS
-----------------------------------------------/;

Function AddToHelpFiles()
    ; add help messages
    HelpManualPC.AddForm(oltHelpVault81Radio)
    HelpManualXBox.AddForm(oltHelpVault81Radio)

    debug.trace(self + " --- Radio Vault 81. Help Menu Updated. DO NOT UNINSTALL AND CONTINUE ON THE SAME SAVE. HELP MENU IS FORMLIST. HELP MENU WILL BREAK! ")
EndFunction

Function UpdateScraplist()
    debug.trace(self + " --- Radio Vault 81. Updating Scraplist")
    ; if players remove this mod in the middle of their game, this formlist will break
    ; there's no other way to do this and avoid compatibility issues.
    workshopScrapRecipe_Radio.AddForm(oltRadioVault81Receiver)
    workshopScrapRecipe_Radio.AddForm(oltRadioVault81ReceiverNew)
    debug.trace(self + " --- Radio Vault 81. Vault 81 done updating scraplist. DO NOT UNINSTALL AND CONTINUE ON THE SAME SAVE. SCRAP LIST IS FORMLIST. SCRAP LIST WILL BREAK! ")
EndFunction

bool Function ProcessOldRadioVariables()
    if Game.IsPluginInstalled(sFO4)
        RadioDiamondCityReceiver = Game.GetFormFromFile(iRadioDiamondCityReceiver, sFO4) as ObjectReference
        RadioDiamondCityReceiverNew_1 = Game.GetFormFromFile(iRadioDiamondCityReceiverNew_1, sFO4) as ObjectReference
        RadioDiamondCityReceiverNew_2 = Game.GetFormFromFile(iRadioDiamondCityReceiverNew_2, sFO4) as ObjectReference
        RadioDiamondCityReceiverNew_3 = Game.GetFormFromFile(iRadioDiamondCityReceiverNew_3, sFO4) as ObjectReference
        RadioDiamondCityReceiverNew_4 = Game.GetFormFromFile(iRadioDiamondCityReceiverNew_4, sFO4) as ObjectReference
        RadioDiamondCityReceiverOff = Game.GetFormFromFile(iRadioDiamondCityReceiverOff, sFO4) as ObjectReference
        Vault81AtriumMapMarker = Game.GetFormFromFile(iVault81AtriumMapMarker, sFO4) as ObjectReference

        return true
    endif
    return false
EndFunction

bool Function ProcessNewRadioVariables()
    if Game.IsPluginInstalled(sRV81)
        oltRadioOldPenskeRoom = Game.GetFormFromFile(ioltRadioOldPenskeRoom, sRV81) as ObjectReference
        oltRadioNewVaultEntrance = Game.GetFormFromFile(ioltRadioNewVaultEntrance, sRV81) as ObjectReference
        oltRadioNewSunshineDiner = Game.GetFormFromFile(ioltRadioNewSunshineDiner, sRV81) as ObjectReference
        oltRadioNewBarbershop = Game.GetFormFromFile(ioltRadioNewBarbershop, sRV81) as ObjectReference
        oltRadioNewReactor = Game.GetFormFromFile(ioltRadioNewReactor, sRV81) as ObjectReference
        oltRadioOffTinasRoom = Game.GetFormFromFile(ioltRadioOffTinasRoom, sRV81) as ObjectReference
        oltRadioMarkerCenterRef = Game.GetFormFromFile(ioltRadioMarkerCenterRef, sRV81) as ObjectReference
        return true
    endif
    return false
EndFunction


Function PlaceRadio(ObjectReference akOldRadio, ObjectReference akNewRadio)
    if akOldRadio
        debug.trace(self + " --- Radio Vault 81 old radio: " + akOldRadio)
        ;store the old radio's position
        float AngX = akOldRadio.GetAngleX()
        float AngY = akOldRadio.GetAngleZ()
        float AngZ = akOldRadio.GetAngleY()
        debug.trace(self + " --- Radio Vault 81 old Radio: " + akOldRadio + " position is: X = " + AngX + " Y = " + AngY + " Z = " + AngZ)

        ;move the old radio out of the way
        akOldRadio.MoveTo(oltRadioMarkerCenterRef, afXOffset=utility.randomfloat(0.0, 27.00), afYOffset=utility.randomfloat(1.0, 150.00), afZOffset=utility.randomfloat(8.0, 250.00))

        ;finalize it being gone
        akOldRadio.Disable()
        akOldRadio.Enable()

        ; move the new radio to the old radio's position
        akNewRadio.MoveTo(akOldRadio, afXOffset=AngX, afYOffset=AngY, afZOffset=AngZ, abMatchRotation=True)

        ;wait a hair
        utility.wait(0.2)

        ;finalize it into position
        akNewRadio.Disable()
        akNewRadio.Enable()

        debug.trace(self + " --- Radio Vault 81 radios are in place! ")
    endif
EndFunction

;called by MyStageToSet
Function SwitchOldRadios()
    PlaceRadio(RadioDiamondCityReceiver, oltRadioOldPenskeRoom)
    PlaceRadio(RadioDiamondCityReceiverNew_1, oltRadioNewVaultEntrance)
    PlaceRadio(RadioDiamondCityReceiverNew_2, oltRadioNewSunshineDiner)
    PlaceRadio(RadioDiamondCityReceiverNew_3, oltRadioNewBarbershop)
    PlaceRadio(RadioDiamondCityReceiverNew_4, oltRadioNewReactor)
    PlaceRadio(RadioDiamondCityReceiverOff, oltRadioOffTinasRoom)
EndFunction

Function RegisterForMQEvent()
    debug.trace(self + " --- Radio Vault 81. Has player left Vault 111?")
    ; check if player has left Vault 111
    if (MQ102.GetStageDone(MyStageToWatch) == True)
        debug.trace(self + " --- Radio Vault 81. Player has left Vault 111. Starting up radio!!")

        ; when stage sets, it turns on Radio Vault 81 and calls SwitchOldRadios()
        SetStage(MyStageToSet)
    else
        debug.trace(self + " --- Radio Vault 81. Player has not left Vault 111. Cannot start radio!")
        RegisterForRemoteEvent(MQ102, "OnStageSet")
    endif
EndFunction

Function UnregisterForMQEvent()
    debug.trace(self + " --- Radio Vault 81. initializing complete. Shutting down registration.")
    UnregisterForRemoteEvent(MQ102, "OnStageSet")
EndFunction