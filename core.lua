local frame = CreateFrame("FRAME")
frame:RegisterEvent("CHALLENGE_MODE_COMPLETED")


local sentMessage = false

function OnEvent(self, event, ...)
  if not sentMessage and (event == "CHALLENGE_MODE_COMPLETED") then
    C_Timer.After(6, function()
        if not sentMessage then
        	SendChatMessage("tyfg", "PARTY")
          	sentMessage = true
            frame:UnregisterEvent("CHALLENGE_MODE_COMPLETED")
        end
    end)
  end
end

frame:SetScript("OnEvent", OnEvent)

local function OnPlayerLeavingGroup(self, event, ...)
  sentMessage = false
  frame:RegisterEvent("CHALLENGE_MODE_COMPLETED")
end

local leaveGroupFrame = CreateFrame("FRAME")
leaveGroupFrame:RegisterEvent("GROUP_LEFT")
leaveGroupFrame:SetScript("OnEvent", OnPlayerLeavingGroup)
