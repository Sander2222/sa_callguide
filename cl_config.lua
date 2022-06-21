Config = {}

Config.CallCoords = { x= -1038.349609375,y= -2737.6276855469,z= 20.169296264648 }
Config.Button = 38 -- Button is E for now (https://docs.fivem.net/docs/game-references/controls)
Config.WaitForTeam = 3 -- This time must wait the player to call a teammeber after called a teammember (in Minutes)
Config.DrakMarker = 10.0 --this is the distance when the DrawMarker should show 
Config.EnterDrawMarker = 2.0 --this is the distance when the Player can press the input button to use this script
Config.Groups = { --All of this  groups get a message when i player use this script  
    'mod',
    'admin',
    'superadmin'
}


Language = {
    ['PressButton'] = 'Press ~INPUT_CONTEXT~ to call a teammember.',
    ['CalledAdmin'] = 'You called a admin for ingame whitelist.',
    ['PlayerAsked'] = 'This player asked for a teammember: ',
    ['WaitTime'] = 'You need to wait this time befor you can call a nother: ',
    ['Minutes'] = ' minutes'
}