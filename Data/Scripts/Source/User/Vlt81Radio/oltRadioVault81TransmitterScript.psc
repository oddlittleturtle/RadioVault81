Scriptname Vlt81Radio:oltRadioVault81TransmitterScript extends DefaultAlias Const Hidden
{Sets a stage when the player enters the outer radius of this radio transmitter. It will shut down the quest.}

Event OnPipboyRadioDetection(bool abDetected)
	Debug.Trace(self + ": OnPipboyRadioDetection() called on Vlt81Radio:oltRadioVault81TransmitterScript script.")
	TryToSetStage()
EndEvent
