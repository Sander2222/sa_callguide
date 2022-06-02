ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterNetEvent('callguide:NotifyTeam')
AddEventHandler('callguide:NotifyTeam', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    for k, playerid in pairs(GetPlayers()) do
        local xPlayers = ESX.GetPlayerFromId(playerid)
        
        if xPlayers.getGroup() =='mod' or xPlayers.getGroup() == 'admin' or xPlayers.getGroup() == 'superadmin' then
            xPlayers.showNotification(Language['PlayerAsked'] ..xPlayer.getName())
        end
    end 
 end)    