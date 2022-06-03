ESX = nil
local isInMarker2 = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1)
        local PlayerCoords  = GetEntityCoords(PlayerPedId())

            --local dist = GetDistanceBetweenCoords(PlayerCoords, CallCoords.x, CallCoords.y, CallCoords.z, - 1, 331, true)

            if #(PlayerCoords - vector3(Config.CallCoords.x, Config.CallCoords.y, Config.CallCoords.z)) < 2  then
                isInMarker2  = true
                print(isInMarker2)
            else
                isInMarker2 = false
            end
        print(isInMarker2)
        if isInMarker2 then
            ESX.ShowHelpNotification(Language['PressButton'])
            if IsControlPressed(0, Config.Button) then --E
                TriggerServerEvent('callguide:NotifyTeam')
                ESX.ShowNotification(Language['CalledAdmin'])
                ESX.ShowNotification(Language['WaitTime'] ..Config.WaitForTeam.. Language['Minutes'])
                Wait(Config.WaitForTeam * 60000)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1)
            DrawMarker(1, Config.CallCoords.x, Config.CallCoords.y, Config.CallCoords.z - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 1.0, 3, 254, 190, 255, false, true, 2, false, false, false, false)
    end
end)