print("[BeamNG-MP] | NetworkHandler loaded.")
--====================================================================================
-- All work by jojos38 & Titch2000.
-- You have no permission to edit, redistribute or upload. Contact us for more info!
--====================================================================================

local M = {}

local function send(code, data)
  if data then
    if HelperFunctions.CheckUpdateCode(code) and Settings.Protocol == "UDP" then
      NetworkUDP.UDPSend(code, data)
    else
      Network.TCPSend(code, data)
    end
  else
    if Settings.Protocol == "TCP" then -- Send item over TCP
      Network.TCPSend(code)
    elseif Settings.Protocol == "UDP" then -- Send item over UDP
      NetworkUDP.UDPSend(code)
    end
  end
end

M.send = send

return M
