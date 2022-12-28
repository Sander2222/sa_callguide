ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterNetEvent('sa_callguide:NotifyTeam')
AddEventHandler('sa_callguide:NotifyTeam', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local TeamMember = 0

    for k, playerid in pairs(GetPlayers()) do
        local xPlayers = ESX.GetPlayerFromId(playerid)
        for i, v in ipairs(Configsv.Groups) do
            if xPlayers.getGroup() == v then
                TeamMember = TeamMember + 1
            end
        end
        if TeamMember > 0 then
            xPlayers.showNotification(Configsv.Language['PlayerAsked'] ..xPlayer.getName())
            if Configsv.ActiveWebhook then
                sendToDiscord(Configsv.Language['WebhookMessage']..xPlayer.getName())
            end
        else 
            xPlayer.showNotification(Configsv.Language['ThereIsNoTeam'])
            if Configsv.ActiveWebhook then
                sendToDiscord(Configsv.Language['WebhookMessageNoTeammember']..xPlayer.getName())
            end
        end
    end
 end)

 function sendToDiscord(message, footer)
    local embed = {
          {
              ["color"] = 16753920,
              ["title"] = "**".. Configsv.WebhookName .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = Configsv.WebhookFooter,
              },
          }
      }
  
    PerformHttpRequest(Configsv.Webhook, function(err, text, headers) end, 'POST', json.encode({username = Configsv.WebhookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end