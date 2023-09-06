local function GenerateOptions()
    local options = {}
    for i = 1, #Config.games, 1 do
        options[#options + 1] = {
            label = Config.games[i].label,
            icon = Config.games[i].icon or 'fa-gamepad',  -- WIP: Verplaatsen naar config voor fa-gamepad
        }
    end
    return options
end

local function GenerateHacks()
    local options = {}
    for i = 1, #Config.hacks, 1 do
        options[#options + 1] = {
            label = Config.hacks[i].label,
            icon = Config.hacks[i].icon or 'fa-gamepad',  -- WIP: Verplaatsen naar config voor fa-gamepad
        }
    end
    return options
end

CreateThread(function()
    lib.registerMenu({
        id = 'arcade_machine',
        title = Lang:t('menu.arcade'),
        position = 'top-right',
        options = GenerateOptions(),
    }, function(selected, scrollIndex, args)
        SendNUIMessage({
            type = "on",
            game = Config.games[selected].args,
            gpu = "ETX2080",
            cpu = "U9_9900"
        })
        SetNuiFocus(true, true)
    end)

    lib.registerMenu({
        id = 'arcade_hacking',
        title = Lang:t('menu.special'),
        position = 'top-right',
        options = GenerateHacks(),
    }, function(selected, scrollIndex, args)
        Config.hacks[selected].action()
    end)

    lib.registerContext({
        id = 'arcade_purchase_token',
        title = Lang:t('menu.purchase_token'):format(Config.TokenPrice),
        options = {{
            title = Lang:t('menu.purchase_token'):format(Config.TokenPrice),
            icon = 'fa-shopping-cart',
            onSelect = function()
                local amount = lib.inputDialog(Lang:t('menu.amount'), {
                    {
                        label = Lang:t('menu.amount'),
                        type = 'number',
                        min = 1,
                        required = true,
                    }
                })
                if amount then
                    TriggerServerEvent('qb-arcade:server:buyToken', amount[1])
                end
            end

        }}
    })
end)