--██╗░░██╗  ░██████╗░█████╗░██████╗░██╗██████╗░████████╗░██████╗
--╚██╗██╔╝  ██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
--░╚███╔╝░  ╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░╚█████╗░
--░██╔██╗░  ░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░░╚═══██╗
--██╔╝╚██╗  ██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░██████╔╝
--╚═╝░░╚═╝  ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░
-- Support: https://discord.gg/N74Yuq9ARQ


Config = {}

Config.ProgressDuration = 1600 -- Duration 
Config.AnimationDict = 'mp_car_bomb' -- anim dict
Config.AnimationName = 'car_bomb_mechanic' -- anim name

-- Notifications
Config.TireRemovedTitle = 'Tire Punctured'
Config.TireRemovedDesc = 'You successfully punctured the tire.'
Config.CanceledTitle = 'Canceled'
Config.CanceledDesc = 'You canceled the action.'
Config.NoToolTitle = 'No Tool'
Config.NoToolDesc = 'You don\'t have the required tool to puncture the tire.'


Config.ToolItem = 'WEAPON_CROWBAR' -- Item that you need

Config.RemoveItem = false  -- Set to true to remove the item after puncture tires or false to dont

Config.AllowedJob = 'everyone'  -- Set to 'everyone' for everyone to can do this , or set a job specificly to perform puncture tires