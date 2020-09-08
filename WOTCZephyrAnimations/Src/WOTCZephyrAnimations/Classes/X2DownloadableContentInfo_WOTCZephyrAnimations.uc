//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_WOTCZephyrAnimations.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_WOTCZephyrAnimations extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}



static function UpdateAnimations(out array<AnimSet> CustomAnimSets, XComGameState_Unit UnitState, XComUnitPawn Pawn)
{
	local XComContentManager	Content;

    if(!UnitState.IsSoldier()) return;

	//`LOG("Updating animations for: " @ UnitState.GetFullName() @ "equipped weapon: " @ ItemState.GetMyTemplateName(),, 'IRIPUNCH');

	//if (HasPrimaryKnuckleEquipped(UnitState))
	//{
		//if (HasSecondaryKnuckleEquipped(UnitState))
		//{
			//if (default.Force_Templar_ByTheBook_Armory_Attitude)
			//{
				UnitState.kAppearance.iAttitude = 0;
				UnitState.UpdatePersonalityTemplate();
			//}
			Content = `CONTENT;

			//`LOG("Check passed, patching animations",, 'IRIPUNCH');

			//	## Vanilla AnimSets
			//	Reattach Soldier animset to override anything done by Primary Secondaries.
			CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Soldier_ANIM.Anims.AS_Soldier")));
			CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Templar_ANIM.Anims.AS_Templar")));
			CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Soldier_Unarmed_ANIM.Anims.AS_UB_Soldier")));
			CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Soldier_Unarmed_ANIM.Anims.AS_UB_Medkit")));
			CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Soldier_Unarmed_ANIM.Anims.AS_UB_Skulljack")));
			CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("Templar_ANIM.Anims.AS_UB_Grenade")));

			//	## Custom AnimSets
			//CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("IRI_PunchAndKick.Anims.AS_Unarmed_Idle")));
			CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("CSWOTCUnarmedAnimations.Anims.AS_Soldier")));
			CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("CSWOTCUnarmedAnimations.Anims.AS_Armory")));
			CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("CSWOTCUnarmedAnimations.Anims.AS_Hellion")));
			CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("CSWOTCUnarmedAnimations.Anims.AS_Armory")));
		//}
		//else if (HasBallisticShieldEquipped(UnitState))
		//{
		//	Content = `CONTENT;
		//	CustomAnimSets.AddItem(AnimSet(Content.RequestGameArchetype("IRI_PunchAndKick.Anims.AS_Punch_Shield")));
		//}
	//}
}