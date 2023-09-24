local RSGCore = exports['rsg-core']:GetCoreObject()
local PlayerData = RSGCore.Functions.GetPlayerData()
local currentjob

-----------------------------------------------------------------------------------

-- wholesale prompts and blips
Citizen.CreateThread(function()
    for wholesale, v in pairs(Config.WholesaleLocations) do
        exports['rsg-core']:createPrompt(v.prompt, v.coords, RSGCore.Shared.Keybinds['J'], 'Open ' .. v.name, {
            type = 'client',
            event = 'rsg-wholesaletrader:client:openMenu',
            args = { v.job },
        })
        if v.showblip == true then
            local WholesaleTraderBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(WholesaleTraderBlip, joaat(Config.WholesaleBlip.blipSprite), true)
            SetBlipScale(WholesaleTraderBlip, Config.WholesaleBlip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, WholesaleTraderBlip, Config.WholesaleBlip.blipName)
        end
    end
end)

-----------------------------------------------------------------------------------
-- wholesale trader menu
RegisterNetEvent('rsg-wholesaletrader:client:openMenu', function(job)
    local playerjob = RSGCore.Functions.GetPlayerData().job.name
    if playerjob == job then
        currentjob = job
        lib.registerContext({
            id = 'wholesaletrader_menu',
            title = Lang:t('menu.wholesale_trader'),
            options = {
                {
                    title = Lang:t('menu.wholesale_storage'),
                    description = '',
                    icon = 'fas fa-box',
                    event = 'rsg-wholesaletrader:client:storage',
                    arrow = true
                },
                {
                    title = Lang:t('menu.wholesale_imports'),
                    description = '',
                    icon = 'fas fa-box',
                    event = 'rsg-wholesaletrader:client:openShop',
                    arrow = true
                },
                {
                    title = Lang:t('menu.job_management'),
                    description = '',
                    icon = 'fas fa-user-circle',
                    event = 'rsg-bossmenu:client:mainmenu',
                    arrow = true
                },
                {
                    title = Lang:t('menu.job_wagon'),
                    description = '',
                    icon = 'fas fa-horse',
                    event = 'rsg-jobwagon:client:openWagonMenu',
                    arrow = true
                },
            }
        })
        lib.showContext("wholesaletrader_menu")
    else
        RSGCore.Functions.Notify(Lang:t('error.not_authorised'), 'error')
    end
end)

-----------------------------------------------------------------------------------

-- wholesale shop
RegisterNetEvent('rsg-wholesaletrader:client:openShop')
AddEventHandler('rsg-wholesaletrader:client:openShop', function()
    local job = RSGCore.Functions.GetPlayerData().job.name
    if job == currentjob then
        local ShopItems = {}
        ShopItems.label = "Wholesale Shop"
        ShopItems.items = Config.WholesaleShop
        ShopItems.slots = #Config.WholesaleShop
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "WholesaleShop_"..math.random(1, 99), ShopItems)
    else
        RSGCore.Functions.Notify(Lang:t('error.not_authorised'), 'error')
    end
end)

-----------------------------------------------------------------------------------

-- wholesale trader general storage
RegisterNetEvent('rsg-wholesaletrader:client:storage', function()
    local job = RSGCore.Functions.GetPlayerData().job.name
    if job == currentjob then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", currentjob, {
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", currentjob)
    end
end)

-----------------------------------------------------------------------------------
