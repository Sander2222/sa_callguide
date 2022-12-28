Configsv = {}

Configsv.ActiveWebhook = true
--Webhook sfuff
Configsv.Webhook = 'https://Your Webhook'
Configsv.WebhookName = 'Call Guide Logs'
Configsv.WebhookFooter = 'Discord Logs'

Configsv.Groups = { --All of this  groups get a message when i player use this script  
    'mod',
    'admin',
    'superadmin'
}

Configsv.Language = {
    ['WebhookMessage'] = 'The player called an admin: ',
    ['WebhookMessageNoTeammember'] = 'The player called an admin, but on teammember is online: ',
    ['ThereIsNoTeam'] = 'At the moment no teammember is online',
    ['PlayerAsked'] = 'This player asked for a teammember: '
}