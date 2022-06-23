ESX = nil
local isInMarker2 = false
local IsClose = false 
local IsAt = false 

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(850)

        IsClose = false
		IsAt = false

            local dist = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(Configcl.CallCoords.x, Configcl.CallCoords.y, Configcl.CallCoords.z))

            if dist <= Configcl.EnterDrawMarker then
                IsClose = true
                IsAt = true
                CurrentStore = value
            elseif dist <= Configcl.DrakMarker then
                IsClose = true
                CurrentStore = value
            end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1)
		if  not IsClose then
			Wait(850)
        else
            DrawMarker(1, Configcl.CallCoords.x, Configcl.CallCoords.y, Configcl.CallCoords.z - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 3, 254, 190, 255, false, true, 2, false, false, false, false)
        end
		if IsAt then
            ESX.ShowHelpNotification(Language['PressButton'])
            if IsControlPressed(0, Configcl.Button) then --E
                TriggerServerEvent('sa_callguide:NotifyTeam')
                ESX.ShowNotification(Language['CalledAdmin'])
                ESX.ShowNotification(Language['WaitTime'] ..Configcl.WaitForTeam.. Language['Minutes'])
                Wait(Configcl.WaitForTeam * 60000)
            end
		end
    end
end)
