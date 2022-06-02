ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1)
        local coords  = GetEntityCoords(GetPlayerPed(-1))
        if(GetDistanceBetweenCoords(coords, Config.CallCoords.x, Config.CallCoords.y,Config.CallCoords.z - 1, 331, true) < 2) then
            isInMarker2  = true
        else
            isInMarker2 = false
        end
        if isInMarker2 then
            ESX.ShowHelpNotification(Language['PressButton'])
            if IsControlPressed(0, Config.Button) then --E
                TriggerServerEvent('sv_callguide:NotifyTeam')
                ESX.ShowNotification(Language['CalledAdmin'])
                Wait(180000)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1)
        DrawMarker(1, Config.CallCoords.x, Config.CallCoords.y,Config.CallCoords.z - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 3, 254, 190, 255, false, true, 2, false, false, false, false)
    end
end)