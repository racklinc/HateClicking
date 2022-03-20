local function HateClickingCommands(msg, editbox)
	if msg == 'start' then
		MouselookStart();
	elseif msg == 'stop' then
		MouselookStop();
	elseif msg == 'smart' then
		HCSmartEnable()
	elseif msg == 'dumb' then
		HCSmartDisable()
	end
end

SLASH_HATECLICKING1 = '/hateclicking'
SLASH_HATECLICKING2 = '/hc'
SlashCmdList['HATECLICKING'] = HateClickingCommands
SlashCmdList['HC'] = HateClickingCommands
