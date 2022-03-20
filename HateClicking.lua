BINDING_HEADER_HATECLICKING = "HateClicking"
BINDING_NAME_HCMLTOGGLE = "Toggle mouse look."
BINDING_NAME_HCMLTEMPTOGGLE = "Temp toggle of mouse look."
BINDING_NAME_HCSmartEnableTOGGLE = "Disable or Enable smart features."
BINDING_NAME_HCMLDETECT = "Debugging print feature."
--todo
--keybindings to get through diaglogs
--reset cursor

--bool variables
HCMLTempToggleOveride = 0
HCMLSpellToggle = 0
HCBindingsOverridden = 0
HCTempToggleDoubleTap = 0
HCisBagsOpenVar = 0
HCBagsOpenOverride = 0
HCPlayerOnTaxi = 0
HCGossipOpen = false
isCombat = false
HCisTempToggleDown = 0
--time variables
HCtimeRunning = 0
HCtimeRunningStart = 0
HCtimeRunningNow = 0
HCTempToggleDoubleTapTime = 0
HCTempToggleDoubleTapStart = 0
HCTempToggleDoubleTapNow = 0

--disable any functions but toggling
function HCSmartDisable()
	HCSmartEnable = 0
	MouselookStop()
	print("HateClicking smart features disabled.")
end
--ensable functions smart functions
function HCSmartEnable()
	HCSmartEnable = 1
	print("HateClicking smart features enabled.")
end
--toggle on or off smart functions
function HateClickingSmartToggle()
	if HCSmartEnable == 1 then
		HCSmartEnable = 0
		MouselookStop()
		if(UnitAffectingCombat("player") == false) then
			HCBindingsOverriddenOff()
		end
		print("HateClicking smart features disabled.")
	else
		HCSmartEnable = 1
		print("HateClicking smart features enabled.")
	end
end
--lock or unlock mouse look
function HateClickingMLToggle()
	if IsMouselooking() == true then
		MouselookStop()
		if(UnitAffectingCombat("player") == false) then
			HCBindingsOverriddenOff()
		end
	else
		MouselookStart()
		if(UnitAffectingCombat("player") == false) then
			HCBindingsOverriddenOn()
		end
	end
end
--when pressing down keybinding invert the current state of mouselooking
function HateClickingMLTempToggle(keystate)
	isMLLooking = IsMouselooking()
	if keystate == "down" then
		HCisTempToggleDown = 1
		if (isMLLooking == true) then
			MouselookStop()
			if(UnitAffectingCombat("player") == false) then
				HCBindingsOverriddenOff()
			end
		else
			if (HCMLTempToggleOveride == 0) then
				MouselookStart()
				if(UnitAffectingCombat("player") == false) then
					HCBindingsOverriddenOn()
				end
			end
		end
	else
		HCisTempToggleDown = 0
		HCTempToggleDoubleTap = HCTempToggleDoubleTap + 1
		if isMLLooking == true then
			MouselookStop()
			if(UnitAffectingCombat("player") == false) then
				HCBindingsOverriddenOff()
			end
		else
			if (HCMLTempToggleOveride == 0) then
				MouselookStart()
				if(UnitAffectingCombat("player") == false) then
					HCBindingsOverriddenOn()
				end
			end
		end
	end
end
function HCisBagsOpen()
	HCisBagsOpenVar = false
	if(IsBagOpen(0)) then
		HCisBagsOpenVar = true
	elseif(IsBagOpen(1)) then
		HCisBagsOpenVar = true
	elseif(IsBagOpen(2)) then
		HCisBagsOpenVar = true
	elseif(IsBagOpen(3)) then
		HCisBagsOpenVar = true
	elseif(IsBagOpen(4)) then
		HCisBagsOpenVar = true
	end	
	return HCisBagsOpenVar
end
--frame for determining if mouselook should be on or off based on conditions
local HCframe = CreateFrame("Frame","HateClickingFrame")
local timeElapsed = 0
HCframe:HookScript("OnUpdate", function(self, elapsed)
	timeElapsed = timeElapsed + elapsed
	--frame & ms limiter
	if timeElapsed > 0.05 then
		timeElapsed = 0
		isMLLooking = IsMouselooking()
		isCursorSpell = SpellIsTargeting()
		isCombat = UnitAffectingCombat("player")
		--turns off mouselook if the cursor is holding a spell to target a unit or the ground
		if(HCMLSpellToggle == 1 and isCursorSpell == false) then
			MouselookStart()
			HCMLSpellToggle = 0
			HCMLTempToggleOveride = 0
			if(isCombat == false) then
				HCBindingsOverriddenOn()
			end
		end
		if(isMLLooking == true and isCursorSpell == true) then
			MouselookStop()
			HCMLSpellToggle = 1
			HCMLTempToggleOveride = 1
			if(isCombat == false) then
				HCBindingsOverriddenOff()
			end
		end
		--allows the use of the temp toggle to toggle mouselook by double tapping
		if (HCMLDoubleTapDefault == 1 and HCTempToggleDoubleTap > 0) then
			if(HCTempToggleDoubleTap >= 2) then
				HateClickingMLToggle()
				HCTempToggleDoubleTap = 0
				HCTempToggleDoubleTapTime = 0
				HCTempToggleDoubleTapStart = 0 
				HCTempToggleDoubleTapNow = 0
			else
				HCTempToggleDoubleTapNow = GetTime()
				if(HCTempToggleDoubleTapStart == 0) then
					HCTempToggleDoubleTapStart = GetTime()
					--HCTempToggleDoubleTapTime = 0.01
				else
					HCTempToggleDoubleTapTime = HCTempToggleDoubleTapNow - HCTempToggleDoubleTapStart
				end
				if(HCTempToggleDoubleTapTime > 1) then
					HCTempToggleDoubleTap = 0
					HCTempToggleDoubleTapTime = 0
					HCTempToggleDoubleTapStart = 0
					HCTempToggleDoubleTapNow = 0
				end
			end
		end
		-- HateClickingDisable() disables the body of code, making the addon just toggle on the temp toggle or toggle keybinding
		if HCSmartEnable == 1 then
			--goes back to mouselook after a temp override has been done
			if(HCMLTempToggleOveride == 0 and (HCisTempToggleDown == 0 and isMLLooking == false) and HCMLSpellToggle == 0 and isCursorSpell == false) then
				if(HCMLCombatDefault == 1 and isCombat == true) then
					MouselookStart()
				end
			end			
			--if you run for more than a second it will lock mouselook 
			if(HCMLMovingDefault == 1 and (HCisTempToggleDown == 0 and isMLLooking == false) and HCMLTempToggleOveride == 0 and HCisTempToggleDown == 0 and HCBagsOpenOverride == 0 and isCursorSpell == false) then
				isPlayerMoving = GetUnitSpeed("player")
				if(isPlayerMoving > 0) then
					HCtimeRunningNow = GetTime()
					if(HCtimeRunning == 0) then
						HCtimeRunningStart = GetTime()
						HCtimeRunning = 0.01
					else
						HCtimeRunning = HCtimeRunningNow - HCtimeRunningStart
					end
				else 
					HCtimeRunning = 0
				end
				if(HCtimeRunning > HCMovingTimeDetect) then
					MouselookStart()
					if(isCombat == false) then
						HCBindingsOverriddenOn()
					end
					HCtimeRunning = 0
					HCtimeRunningStart = 0
					HCtimeRunningNow = 0
				end
			end
			--disable smart features if the player has bags open
			if(isMLLooking == false and HCisBagsOpen() == true) then
				HCBagsOpenOverride = 1
			elseif(HCBagsOpenOverride == 1 and HCisBagsOpen() == false) then
				HCBagsOpenOverride = 0
			end			
			--disable smart features if the player is talking to an npc
			if(HCGossipOpen == true) then
				HCMLTempToggleOveride = 1
			elseif(HCGossipOpen == false) then
				HCMLTempToggleOveride = 0
			end			
			--disable smart features if the player is on a taxi
			if(isMLLooking == false and UnitOnTaxi("player") == true) then
				HCMLTempToggleOveride = 1
				HCPlayerOnTaxi = 1
			elseif(HCPlayerOnTaxi == 1 and UnitOnTaxi("player") == false) then
				HCMLTempToggleOveride = 0
				HCPlayerOnTaxi = 0
			end
		end---inside disable
	end --inside onUpdate
end)

local HCCombatFrame = CreateFrame("Frame")
HCCombatFrame:SetScript("OnEvent",function(self, event)
	if(SpellIsTargeting) then
		HCBindingsOverriddenOff()
	else
		HCBindingsOverriddenOn()
	end
end)
HCCombatFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
--overrides the left click and right click while mouselook is on
function HCBindingsOverriddenOn()
	SetOverrideBinding(HCframe,false,"BUTTON1",HCOverScript_LM)
	SetOverrideBinding(HCframe,false,"BUTTON2",HCOverScript_RM)
end
--turns off overrides while the mouselook is off
function HCBindingsOverriddenOff()
	ClearOverrideBindings(HCframe)
end
--detect if talking to an npc
--get moar: ITEMTEXTFRAME, ORDERHALLTALENTFRAME,QuestFrame,PlayerChoiceFrame
local HCGossipShow = CreateFrame("Frame")
HCGossipShow:SetScript("OnEvent",function(self, event)
	HCGossipOpen = true
end)
HCGossipShow:RegisterEvent("GOSSIP_SHOW")
HCGossipShow:RegisterEvent("MERCHANT_SHOW")
HCGossipShow:RegisterEvent("QUEST_GREETING")
--detect if talking to an npc
local HCGossipClosed = CreateFrame("Frame")
HCGossipClosed:SetScript("OnEvent",function(self, event)
	HCGossipOpen = false
end)
HCGossipClosed:RegisterEvent("GOSSIP_CLOSED")
HCGossipClosed:RegisterEvent("MERCHANT_CLOSED")
HCGossipClosed:RegisterEvent("QUEST_GREETING")
--debugging function to tap a keybind and get useful info
function HateClickingDetect()
	tempDetect = UnitName("mouseover")
	InteractUnit(tempDetect)
	print(tempDetect)
end