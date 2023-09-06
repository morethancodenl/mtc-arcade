local models = {2303605526, 3756961026, 1301167921, 2793409781, 1876055757, 2792647630, 398786301, 3067040863, 568464183, 3171514707, 3899793496, 974001996, 4206216415, 1457191833, 3054877820, 815879628, 4129005630, 3325005861, 900099857, 543442061, 372224036, 970154536}


local function requireToken()
    if not lib.callback.await('qb-arcade:server:hasToken') then
        QBCore.Functions.Notify(Lang:t('error.no_token'), 'error')
        return false
    end

    return true
end

CreateThread(function()

   exports['qb-target']:AddTargetModel(models, {
        options = {
            {
                num = 1,
                icon = 'fas fa-gamepad',
                label = Lang:t('target.arcade'),
                action = function()
                    if not requireToken() then return end
                    lib.showMenu('arcade_machine')
                end
            },
            {
                num = 2,
                icon = 'fas fa-circle-dot',
                label = Lang:t('target.special'),
                action = function()
                    if not requireToken() then return end
                    lib.showMenu('arcade_hacking')
                end
            },
        },
    })
end)

AddEventHandler('onResourceStop', function(resource)
   if resource == GetCurrentResourceName() then
      for _, v in ipairs(models) do
        exports['qb-target']:RemoveTargetModel(v, Lang:t('target.arcade'))
        exports['qb-target']:RemoveTargetModel(v, Lang:t('target.special'))
      end
   end
end)