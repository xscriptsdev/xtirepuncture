ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('x-tirepuncture:checkItem', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem(item).count > 0 then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('x-tirepuncture:removeItem')
AddEventHandler('x-tirepuncture:removeItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if Config.RemoveItem then
    xPlayer.removeInventoryItem(item, 1)
    else 
    end
end)
