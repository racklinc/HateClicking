local HCSvFrame = CreateFrame("Frame")
HCSvFrame:SetScript("OnEvent",function(self, event)
	if(HCSmartEnableCBVal == nil) then
		HCSmartEnableCBVal = false
	elseif (HCSmartEnableCBVal == true) then
		HCSmartEnableCB:SetChecked(true)
	elseif (HCSmartEnableCB == false) then
		HCSmartEnableCB:SetChecked(false)
	end
	if(HCSmartEnableCBVal == true) then
		HCSmartEnable = 1
	else
		HCSmartEnable = 0
	end
	if (HCCombatDefaultCBVal == nil) then
		HCCombatDefaultCBVal = false
		HCCombatDefaultCB:SetChecked(false)
		HCMLCombatDefault = 0
	elseif(HCCombatDefaultCBVal == true) then
		HCCombatDefaultCBVal = true
		HCCombatDefaultCB:SetChecked(true)
		HCMLCombatDefault = 1
	elseif(HCCombatDefaultCBVal == false) then
		HCCombatDefaultCBVal = false
		HCCombatDefaultCB:SetChecked(false)
		HCMLCombatDefault = 0
	end	
	if (HCMLDoubleTapDefaultVal == nil) then
		HCMLDoubleTapDefaultVal = false
		HCMLDoubleTapDefaultCB:SetChecked(false)
		HCMLDoubleTapDefault = 0
	elseif(HCMLDoubleTapDefaultVal == true) then
		HCMLDoubleTapDefaultVal = true
		HCMLDoubleTapDefaultCB:SetChecked(true)
		HCMLDoubleTapDefault = 1
	elseif(HCMLDoubleTapDefaultVal == false) then
		HCMLDoubleTapDefaultVal = false
		HCMLDoubleTapDefaultCB:SetChecked(false)
		HCMLDoubleTapDefault = 0
	end
	if (HCMLMovingDefaultVal == nil) then
		HCMLMovingDefaultVal = false
		HCMLMovingDefaultCB:SetChecked(false)
		HCMLMovingDefault = 0
	elseif(HCMLMovingDefaultVal == true) then
		HCMLMovingDefaultVal = true
		HCMLMovingDefaultCB:SetChecked(true)
		HCMLMovingDefault = 1
	elseif(HCMLMovingDefaultVal == false) then
		HCMLMovingDefaultVal = false
		HCMLMovingDefaultCB:SetChecked(false)
		HCMLMovingDefault = 0
	else
		HCMLMovingDefaultVal = false
		HCMLMovingDefaultCB:SetChecked(false)
		HCMLMovingDefault = 0
	end
	if (HCMLMovingDefaultValStr == nil) then
		HCMLMovingDefaultValStr = 0.25
		HCMovingTimeDetect = 0.25
	elseif(HCMLMovingDefaultValStr) then
		HCMovingTimeDetect = HCMLMovingDefaultValStr
	end
	--HCMLMovingDefaultStr:SetNumber(HCMovingTimeDetect)
	if (HCOverrideEnable_LM_CB == nil) then
		HCOverrideEnable_LM_CB = false
	end
	if(HCOverrideEnable_LM_CB == true) then
		HCOverrideEnable_LM_CBFrame:SetChecked(true)
	else
		HCOverrideEnable_LM_CBFrame:SetChecked(false)
	end
	if (HCOverrideType_LM_DD_Var == nil) then
		HCOverrideType_LM_DD_Var = "none"
	end
	if (HCOverWoWFunc_LM_DD_Var == nil) then
		HCOverWoWFunc_LM_DD_Var = "TOGGLEAUTORUN"
	end	
	if(HCOverrideType_LM_DD_Var == "WoW function") then
		HCOverWoWFunc_LM_DD_Frame:Show()
	else
		HCOverWoWFunc_LM_DD_Frame:Hide()
	end
	if (HcLmOverMacro_Val == nil) then
		HcLmOverMacro_Val = ""
	end
	if(HCOverrideType_LM_DD_Var == "WoW function") then
		HCOverWoWFunc_LM_DD_Frame:Show()
		HcLmOverMacro_Frame:Hide()
	elseif(HCOverrideType_LM_DD_Var == "MACRO") then
		HCOverWoWFunc_LM_DD_Frame:Hide()
		HcLmOverMacro_Frame:Show()
	else
		HCOverWoWFunc_LM_DD_Frame:Hide()
		HcLmOverMacro_Frame:Hide()
	end
	UIDropDownMenu_SetText(HCOverrideType_LM_DD_Frame,"Left Mouse Override type: " .. HCOverrideType_LM_DD_Var)
	UIDropDownMenu_SetText(HCOverWoWFunc_LM_DD_Frame,"Override action: " .. HCOverWoWFunc_LM_DD_Var)
	if (HCOverrideEnable_RM_CB == nil) then
		HCOverrideEnable_RM_CB = false
	end
	if(HCOverrideEnable_RM_CB == true) then
		HCOverrideEnable_RM_CBFrame:SetChecked(true)
	else
		HCOverrideEnable_RM_CBFrame:SetChecked(false)
	end
	if (HCOverrideType_RM_DD_Var == nil) then
		HCOverrideType_RM_DD_Var = "none"
	end
	if (HCOverWoWFunc_RM_DD_Var == nil) then
		HCOverWoWFunc_RM_DD_Var = "TOGGLEAUTORUN"
	end	
	if(HCOverrideType_RM_DD_Var == "WoW function") then
		HCOverWoWFunc_RM_DD_Frame:Show()
	else
		HCOverWoWFunc_RM_DD_Frame:Hide()
	end
	if (HcRmOverMacro_Val == nil) then
		HcRmOverMacro_Val = ""
	end
	if(HCOverrideType_RM_DD_Var == "WoW function") then
		HCOverWoWFunc_RM_DD_Frame:Show()
		HcRmOverMacro_Frame:Hide()
	elseif(HCOverrideType_RM_DD_Var == "MACRO") then
		HCOverWoWFunc_RM_DD_Frame:Hide()
		HcRmOverMacro_Frame:Show()
	else
		HCOverWoWFunc_RM_DD_Frame:Hide()
		HcRmOverMacro_Frame:Hide()
	end	
	UIDropDownMenu_SetText(HCOverrideType_RM_DD_Frame,"Right Mouse Override type: " .. HCOverrideType_RM_DD_Var)
	UIDropDownMenu_SetText(HCOverWoWFunc_RM_DD_Frame,"Override action: " .. HCOverWoWFunc_RM_DD_Var)
end)
HCSvFrame:RegisterEvent("ADDON_LOADED")
--widgets in this section are meant to control smart features of mouselook
local panel = CreateFrame("Frame")
panel.name = "HateClicking"
InterfaceOptions_AddCategory(panel)
local title = panel:CreateFontString(nil,"ARTWORK","GameFontNormalLarge")
title:SetPoint("TOPLEFT",10,-10)
title:SetText("HateClicking: Mouselook settings")
--mouselook can be statically turn off and on, this section allows double tapping the mouselook temp toggle to turn off an on toggling
HCMLDoubleTapDefaultCB = CreateFrame("CheckButton", "HCMLDoubleTapDefault_GlobalName", panel, "ChatConfigCheckButtonTemplate")
HCMLDoubleTapDefaultCB:SetPoint("TOPLEFT", 10, -25)
HCMLDoubleTapDefault_GlobalNameText:SetText("Mouselook toggle with double temp toggle.")
HCMLDoubleTapDefaultCB.tooltip = "Double tap the temp toggle keybinding to toggle mouselook."
HCMLDoubleTapDefaultCB:SetScript("OnClick", function()
	if(HCMLDoubleTapDefaultVal == true) then
		HCMLDoubleTapDefault = 0
		HCMLDoubleTapDefaultVal = false
	elseif(HCMLDoubleTapDefaultVal == false) then
		HCMLDoubleTapDefault = 1
		HCMLDoubleTapDefaultVal = true
	end
end)
--this section sets using or not using smart features at loading of the addon, the smart toggle keybinding can override this for a game session
HCSmartEnableCB = CreateFrame("CheckButton", "HCSmartEnable_GlobalName", panel, "ChatConfigCheckButtonTemplate")
HCSmartEnableCB:SetPoint("TOPLEFT", 10, -45)
HCSmartEnable_GlobalNameText:SetText("Smart features default.")
HCSmartEnableCB.tooltip = "Enable or disable smart features at load. Those will be ignored if smart features are off."
HCSmartEnableCB:SetScript("OnClick", function()
	if(HCSmartEnableCBVal == true) then
		HCSmartEnableCBVal = false
	elseif(HCSmartEnableCBVal == false) then
		HCSmartEnableCBVal = true
	end
end)
--mouselook can be toggled on automatically when entering combat with this section
HCCombatDefaultCB = CreateFrame("CheckButton", "HCCombatDefault_GlobalName", panel, "ChatConfigCheckButtonTemplate")
HCCombatDefaultCB:SetPoint("TOPLEFT", 50, -65)
HCCombatDefault_GlobalNameText:SetText("Mouselook combat default.")
HCCombatDefaultCB.tooltip = "Enable or disable mouselook when entering combat."
HCCombatDefaultCB:SetScript("OnClick", function()
	if(HCCombatDefaultCBVal == true) then
		HCMLCombatDefault = 0
		HCCombatDefaultCBVal = false
	elseif(HCCombatDefaultCBVal == false) then
		HCMLCombatDefault = 1
		HCCombatDefaultCBVal = true
	end
end)
--mouselook can be toggled on automatically when moving for a period of time. the period of time is set in the next section
HCMLMovingDefaultCB = CreateFrame("CheckButton", "HCMLMovingDefault_GlobalName", panel, "ChatConfigCheckButtonTemplate")
HCMLMovingDefaultCB:SetPoint("TOPLEFT", 50, -85)
HCMLMovingDefault_GlobalNameText:SetFormattedText("Mouselook by moving.")
HCMLMovingDefaultCB.tooltip = "Start mouselook by moving for a period of time. Put a delay time in seconds then press enter to save it. (ie: 0, 0.25, 1, 2)"
HCMLMovingDefaultCB:SetScript("OnClick", function()
	if(HCMLMovingDefaultVal == true) then
		HCMLMovingDefault = 0
		HCMLMovingDefaultVal = false
	elseif(HCMLMovingDefaultVal == false) then
		HCMLMovingDefault = 1
		HCMLMovingDefaultVal = true
	end
end)
--when the previous section is checked in the UI panel, use this box to set the time it takes to run before automatically enabling mouselook
HCMLMovingDefaultStr = CreateFrame("EditBox", "HCMLMovingDefaultStr", panel,"InputBoxTemplate")
HCMLMovingDefaultStr:SetSize(40, 20)
HCMLMovingDefaultStr:SetPoint("TOPLEFT", 200, -85)
HCMLMovingDefaultStr:SetFontObject("ChatFontNormal")
HCMLMovingDefaultStr:SetMaxLetters(10)
HCMLMovingDefaultStr:SetAutoFocus(false)
HCMLMovingDefaultStr:SetNumeric()
HCMLMovingDefaultStr:SetScript("OnEnterPressed", function()
	HCMovingTimeDetect = HCMLMovingDefaultStr:GetNumber()
	HCMLMovingDefaultValStr = HCMovingTimeDetect
	print("Mouselook will start after running " ..HCMovingTimeDetect.." seconds." )
end)
--the next several sections control overriding the left mouse button when mouselook is engaged.
--a checkbox used to enable or disable left mouse button (LMB) override
HCOverrideEnable_LM_CBFrame = CreateFrame("CheckButton", "HCOverrideEnable_LM_CBFrame_GlobalName", panel, "ChatConfigCheckButtonTemplate")
HCOverrideEnable_LM_CBFrame:SetPoint("TOPLEFT", 50, -105)
HCOverrideEnable_LM_CBFrame_GlobalNameText:SetFormattedText("Left mouse override.")
HCOverrideEnable_LM_CBFrame.tooltip = "Set a left mouse button override while mouselooking."
HCOverrideEnable_LM_CBFrame:SetScript("OnClick", function()
	if(HCOverrideEnable_LM_CB == true) then
		HCOverrideEnable_LM_CB = false
	elseif(HCOverrideEnable_LM_CB == false) then
		HCOverrideEnable_LM_CB = true
	end
end)
--primary drop down used to set between LMB override type
HCOverrideType_LM_DD_Frame = CreateFrame("Frame",HCOverrideType_LM_DD,panel,"UIDropDownMenuTemplate")
HCOverrideType_LM_DD_Frame:SetPoint("TOPLEFT",80,-125)
UIDropDownMenu_SetWidth(HCOverrideType_LM_DD_Frame,200)
UIDropDownMenu_Initialize(HCOverrideType_LM_DD_Frame,function (self,menuList)
	HCOTLMDDinfo = UIDropDownMenu_CreateInfo()	
	HCOTLMDDinfo.text = "none"
	HCOTLMDDinfo.func = HCOverLM_DDFunc_none
	UIDropDownMenu_AddButton(HCOTLMDDinfo)	
	HCOTLMDDinfo.text = "WoW function"
	HCOTLMDDinfo.func = HCOverLM_DDFunc_WoWFunc
	UIDropDownMenu_AddButton(HCOTLMDDinfo)	
	HCOTLMDDinfo.text = "MACRO"
	HCOTLMDDinfo.func = HCOverLM_DDFunc_MACRO
	UIDropDownMenu_AddButton(HCOTLMDDinfo)
end)
function HCOverLM_DDFunc_none()
	HCOverrideType_LM_DD_Var = "none"
	UIDropDownMenu_SetText(HCOverrideType_LM_DD_Frame,"Left Mouse Override type: " .. HCOverrideType_LM_DD_Var)
	HCOverWoWFunc_LM_DD_Frame:Hide()
	HcLmOverMacro_Frame:Hide()
	setHCOverScript_LM()
end
function HCOverLM_DDFunc_WoWFunc()
	HCOverrideType_LM_DD_Var = "WoW function"
	UIDropDownMenu_SetText(HCOverrideType_LM_DD_Frame,"Left Mouse Override type: " .. HCOverrideType_LM_DD_Var)
	HCOverWoWFunc_LM_DD_Frame:Show()
	HcLmOverMacro_Frame:Hide()
	setHCOverScript_LM()
end
function HCOverLM_DDFunc_MACRO()
	HCOverrideType_LM_DD_Var = "MACRO"
	UIDropDownMenu_SetText(HCOverrideType_LM_DD_Frame,"Left Mouse Override type: " .. HCOverrideType_LM_DD_Var)
	HCOverWoWFunc_LM_DD_Frame:Hide()
	HcLmOverMacro_Frame:Show()
	setHCOverScript_LM()
end
--if LMB override is set to function, this drop down is show allowing a choice of predefined functions.. more to come in the future
HCOverWoWFunc_LM_DD_Frame = CreateFrame("Frame",HCOverWoWFunc_LM_DD,panel,"UIDropDownMenuTemplate")
HCOverWoWFunc_LM_DD_Frame:SetPoint("TOPLEFT",80,-145)
UIDropDownMenu_SetWidth(HCOverWoWFunc_LM_DD_Frame,200)
UIDropDownMenu_Initialize(HCOverWoWFunc_LM_DD_Frame,function (self,menuList)
	HcLmOWFinfo = UIDropDownMenu_CreateInfo()	
	HcLmOWFinfo.text = "TOGGLEAUTORUN"
	HcLmOWFinfo.func = HcLmOWF_DDFunc_TAR
	UIDropDownMenu_AddButton(HcLmOWFinfo)
	HcLmOWFinfo.text = "SITORSTAND"
	HcLmOWFinfo.func = HcLmOWF_DDFunc_SoS
	UIDropDownMenu_AddButton(HcLmOWFinfo)
	HcLmOWFinfo.text = "TARGETLASTTARGET"
	HcLmOWFinfo.func = HcLmOWF_DDFunc_TLT
	UIDropDownMenu_AddButton(HcLmOWFinfo)
end)
function HcLmOWF_DDFunc_TAR()
	HCOverWoWFunc_LM_DD_Var = "TOGGLEAUTORUN"
	UIDropDownMenu_SetText(HCOverWoWFunc_LM_DD_Frame,"Override function: " .. HCOverWoWFunc_LM_DD_Var)
	setHCOverScript_LM()
end 
function HcLmOWF_DDFunc_SoS()
	HCOverWoWFunc_LM_DD_Var = "SITORSTAND"
	UIDropDownMenu_SetText(HCOverWoWFunc_LM_DD_Frame,"Override function: " .. HCOverWoWFunc_LM_DD_Var)
	setHCOverScript_LM()
end
function HcLmOWF_DDFunc_TLT()
	HCOverWoWFunc_LM_DD_Var = "TARGETLASTTARGET"
	UIDropDownMenu_SetText(HCOverWoWFunc_LM_DD_Frame,"Override function: " .. HCOverWoWFunc_LM_DD_Var)
	setHCOverScript_LM()
end
--if the LMB override dropdown type is set to macro then this input box allows setting the macro
HcLmOverMacro_Frame = CreateFrame("EditBox", "HCLMOverMacro_Frame", panel,"InputBoxTemplate")
HcLmOverMacro_Frame:SetSize(100, 20)
HcLmOverMacro_Frame:SetPoint("TOPLEFT", 105, -150)
HcLmOverMacro_Frame:SetFontObject("ChatFontNormal")
HcLmOverMacro_Frame:SetMaxLetters(16)
HcLmOverMacro_Frame:SetAutoFocus(false)
HcLmOverMacro_Frame:SetScript("OnEnterPressed", function()
	HcLmOverMacro_Val = HcLmOverMacro_Frame:GetText()
	print("Left mouse override macro '" ..HcLmOverMacro_Val.."' set." )
	setHCOverScript_LM()
end)
--function to actually set the choices from the previous sections for the LMB override into a script that can be interpreted
function setHCOverScript_LM()
	if(HCOverScript_LM == nil) then
		HCOverScript_LM = nil
	end
	if(HCOverrideEnable_LM_CB == false or HCOverrideType_LM_DD_Var == "none") then
		HCOverScript_LM = nil
	elseif(HCOverrideType_LM_DD_Var == "WoW function") then
		HCOverScript_LM = HCOverWoWFunc_LM_DD_Var
	elseif(HCOverrideType_LM_DD_Var == "MACRO") then
		HCOverScript_LM = "MACRO ".. HcLmOverMacro_Val
	end
	HCBindingsOverriddenOn()
end
--the next several sections control overriding the right mouse button when mouselook is engaged.
--a checkbox used to enable or disable left mouse button (RMB) override
HCOverrideEnable_RM_CBFrame = CreateFrame("CheckButton", "HCOverrideEnable_RM_CBFrame_GlobalName", panel, "ChatConfigCheckButtonTemplate")
HCOverrideEnable_RM_CBFrame:SetPoint("TOPLEFT", 50, -170)
HCOverrideEnable_RM_CBFrame_GlobalNameText:SetFormattedText("Right mouse override.")
HCOverrideEnable_RM_CBFrame.tooltip = "Set a right mouse button override while mouselooking."
HCOverrideEnable_RM_CBFrame:SetScript("OnClick", function()
	if(HCOverrideEnable_RM_CB == true) then
		HCOverrideEnable_RM_CB = false
	elseif(HCOverrideEnable_RM_CB == false) then
		HCOverrideEnable_RM_CB = true
	end
end)
--primary drop down used to set between RMB override type
HCOverrideType_RM_DD_Frame = CreateFrame("Frame",HCOverrideType_RM_DD,panel,"UIDropDownMenuTemplate")
HCOverrideType_RM_DD_Frame:SetPoint("TOPLEFT",80,-190)
UIDropDownMenu_SetWidth(HCOverrideType_RM_DD_Frame,200)
UIDropDownMenu_Initialize(HCOverrideType_RM_DD_Frame,function (self,menuList)
	HCOTRMDDinfo = UIDropDownMenu_CreateInfo()	
	HCOTRMDDinfo.text = "none"
	HCOTRMDDinfo.func = HCOverRM_DDFunc_none
	UIDropDownMenu_AddButton(HCOTRMDDinfo)	
	HCOTRMDDinfo.text = "WoW function"
	HCOTRMDDinfo.func = HCOverRM_DDFunc_WoWFunc
	UIDropDownMenu_AddButton(HCOTRMDDinfo)	
	HCOTRMDDinfo.text = "MACRO"
	HCOTRMDDinfo.func = HCOverRM_DDFunc_MACRO
	UIDropDownMenu_AddButton(HCOTRMDDinfo)
end)
function HCOverRM_DDFunc_none()
	HCOverrideType_RM_DD_Var = "none"
	UIDropDownMenu_SetText(HCOverrideType_RM_DD_Frame,"Right Mouse Override type: " .. HCOverrideType_RM_DD_Var)
	HCOverWoWFunc_RM_DD_Frame:Hide()
	HcRmOverMacro_Frame:Hide()
	setHCOverScript_RM()
end
function HCOverRM_DDFunc_WoWFunc()
	HCOverrideType_RM_DD_Var = "WoW function"
	UIDropDownMenu_SetText(HCOverrideType_RM_DD_Frame,"Right Mouse Override type: " .. HCOverrideType_RM_DD_Var)
	HCOverWoWFunc_RM_DD_Frame:Show()
	HcRmOverMacro_Frame:Hide()
	setHCOverScript_RM()
end
function HCOverRM_DDFunc_MACRO()
	HCOverrideType_RM_DD_Var = "MACRO"
	UIDropDownMenu_SetText(HCOverrideType_RM_DD_Frame,"Right Mouse Override type: " .. HCOverrideType_RM_DD_Var)
	HCOverWoWFunc_RM_DD_Frame:Hide()
	HcRmOverMacro_Frame:Show()
	setHCOverScript_RM()
end
--if RMB override is set to function, this drop down is show allowing a choice of predefined functions.. more to come in the future
HCOverWoWFunc_RM_DD_Frame = CreateFrame("Frame",HCOverWoWFunc_RM_DD,panel,"UIDropDownMenuTemplate")
HCOverWoWFunc_RM_DD_Frame:SetPoint("TOPLEFT",80,-210)
UIDropDownMenu_SetWidth(HCOverWoWFunc_RM_DD_Frame,200)
UIDropDownMenu_Initialize(HCOverWoWFunc_RM_DD_Frame,function (self,menuList)
	HcRmOWFinfo = UIDropDownMenu_CreateInfo()	
	HcRmOWFinfo.text = "TOGGLEAUTORUN"
	HcRmOWFinfo.func = HcRmOWF_DDFunc_TAR
	UIDropDownMenu_AddButton(HcRmOWFinfo)
	HcRmOWFinfo.text = "SITORSTAND"
	HcRmOWFinfo.func = HcRmOWF_DDFunc_SoS
	UIDropDownMenu_AddButton(HcRmOWFinfo)
	HcRmOWFinfo.text = "TARGETLASTTARGET"
	HcRmOWFinfo.func = HcRmOWF_DDFunc_TLT
	UIDropDownMenu_AddButton(HcRmOWFinfo)
end)
function HcRmOWF_DDFunc_TAR()
	HCOverWoWFunc_RM_DD_Var = "TOGGLEAUTORUN"
	UIDropDownMenu_SetText(HCOverWoWFunc_RM_DD_Frame,"Override function: " .. HCOverWoWFunc_RM_DD_Var)
	setHCOverScript_RM()
end 
function HcRmOWF_DDFunc_SoS()
	HCOverWoWFunc_RM_DD_Var = "SITORSTAND"
	UIDropDownMenu_SetText(HCOverWoWFunc_RM_DD_Frame,"Override function: " .. HCOverWoWFunc_RM_DD_Var)
	setHCOverScript_RM()
end
function HcRmOWF_DDFunc_TLT()
	HCOverWoWFunc_RM_DD_Var = "TARGETLASTTARGET"
	UIDropDownMenu_SetText(HCOverWoWFunc_RM_DD_Frame,"Override function: " .. HCOverWoWFunc_RM_DD_Var)
	setHCOverScript_RM()
end
--if the RMB override dropdown type is set to macro then this input box allows setting the macro
HcRmOverMacro_Frame = CreateFrame("EditBox", "HCRMOverMacro_Frame", panel,"InputBoxTemplate")
HcRmOverMacro_Frame:SetSize(100, 20)
HcRmOverMacro_Frame:SetPoint("TOPLEFT", 105, -215)
HcRmOverMacro_Frame:SetFontObject("ChatFontNormal")
HcRmOverMacro_Frame:SetMaxLetters(16)
HcRmOverMacro_Frame:SetAutoFocus(false)
HcRmOverMacro_Frame:SetScript("OnEnterPressed", function()
	HcRmOverMacro_Val = HcRmOverMacro_Frame:GetText()
	print("Right mouse override macro '" ..HcRmOverMacro_Val.."' set." )
	setHCOverScript_RM()
end)
--function to actually set the choices from the previous sections for the RMB override into a script that can be interpreted
function setHCOverScript_RM()
	if(HCOverScript_RM == nil) then
		HCOverScript_RM = nil
	end
	if(HCOverrideEnable_RM_CB == false or HCOverrideType_RM_DD_Var == "none") then
		HCOverScript_RM = nil
	elseif(HCOverrideType_RM_DD_Var == "WoW function") then
		HCOverScript_RM = HCOverWoWFunc_RM_DD_Var
	elseif(HCOverrideType_RM_DD_Var == "MACRO") then
		HCOverScript_RM = "MACRO ".. HcRmOverMacro_Val
	end
	HCBindingsOverriddenOn()
end
