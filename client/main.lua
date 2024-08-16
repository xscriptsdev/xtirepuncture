ESX = exports['es_extended']:getSharedObject()

local removedTires = {}

local function setTireStatus(vehicle, tireIndex, removed)
    if removed then
        SetVehicleTyreBurst(vehicle, tireIndex, true, 1000.0) 
    else
        SetVehicleTyreFixed(vehicle, tireIndex) 
    end
end

local function removeTire(vehicle, tireIndex)
    local playerPed = PlayerPedId()

   
    RequestAnimDict(Config.AnimationDict)
    while not HasAnimDictLoaded(Config.AnimationDict) do
        Wait(100)
    end

    
    TaskPlayAnim(playerPed, Config.AnimationDict, Config.AnimationName, 8.0, 8.0, Config.ProgressDuration, 1, 0, false, false, false)

    local success = lib.progressCircle({
        duration = Config.ProgressDuration,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
            mouse = false,
        }
    })

    ClearPedTasks(playerPed)

    if success then
        setTireStatus(vehicle, tireIndex, true)
        removedTires[vehicle] = removedTires[vehicle] or {}
        removedTires[vehicle][tireIndex] = true

        lib.notify({
            title = Config.TireRemovedTitle,
            description = Config.TireRemovedDesc,
            type = "success"
        })

      
        TriggerServerEvent('x-tirepuncture:removeItem', Config.ToolItem)
    else
        lib.notify({
            title = Config.CanceledTitle,
            description = Config.CanceledDesc,
            type = "error"
        })
    end
end

local function attemptToRemoveTire(vehicle, tireIndex)
    ESX.TriggerServerCallback('x-tirepuncture:checkItem', function(hasItem)
        if hasItem then
            removeTire(vehicle, tireIndex)
        else
            lib.notify({
                title = Config.NoToolTitle,
                description = Config.NoToolDesc,
                type = "error"
            })
        end
    end, Config.ToolItem)
end

local function isAllowedJob()
    if Config.AllowedJob == "everyone" then
        return true
    else
        local playerData = ESX.GetPlayerData()
        return playerData.job and playerData.job.name == Config.AllowedJob
    end
end

CreateThread(function()
    exports.ox_target:addGlobalVehicle({
        {
            name = 'remove_tire_lr',
            icon = 'fas fa-wrench',
            label = 'Remove Left Rear Tire',
            onSelect = function(data)
                if isAllowedJob() then
                    attemptToRemoveTire(data.entity, 4) 
                else
                    lib.notify({
                        title = "Not Allowed",
                        description = "You are not authorized to perform this action.",
                        type = "error"
                    })
                end
            end,
            distance = 2.0,
            bones = {'wheel_lr'}
        },
        {
            name = 'remove_tire_rr',
            icon = 'fas fa-wrench',
            label = 'Remove Right Rear Tire',
            onSelect = function(data)
                if isAllowedJob() then
                    attemptToRemoveTire(data.entity, 5) 
                else
                    lib.notify({
                        title = "Not Allowed",
                        description = "You are not authorized to perform this action.",
                        type = "error"
                    })
                end
            end,
            distance = 2.0,
            bones = {'wheel_rr'}
        },
        {
            name = 'remove_tire_lf',
            icon = 'fas fa-wrench',
            label = 'Remove Left Front Tire',
            onSelect = function(data)
                if isAllowedJob() then
                    attemptToRemoveTire(data.entity, 0) 
                else
                    lib.notify({
                        title = "Not Allowed",
                        description = "You are not authorized to perform this action.",
                        type = "error"
                    })
                end
            end,
            distance = 2.0,
            bones = {'wheel_lf'}
        },
        {
            name = 'remove_tire_rf',
            icon = 'fas fa-wrench',
            label = 'Remove Right Front Tire',
            onSelect = function(data)
                if isAllowedJob() then
                    attemptToRemoveTire(data.entity, 1) 
                else
                    lib.notify({
                        title = "Not Allowed",
                        description = "You are not authorized to perform this action.",
                        type = "error"
                    })
                end
            end,
            distance = 2.0,
            bones = {'wheel_rf'}
        }
    })
end)
