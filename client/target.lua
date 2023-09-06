local models = {1876055757, -1501557515, -1502319666, 815879628, -1991361770, 1301167921, -538006270, 2303605526, 4185618299, 3756961026, 2793409781, 398786301, 568464183, 3067040863, 3171514707, 3899793496, 974001996, 4206216415, 1457191833, 3054877820, 4129005630, 3963576280, 3325005861, 543442061, 372224036, -1273554963} -- WIP: Verplaatsen naar config?


local function requireToken()
    if not lib.callback.await('qb-arcade:server:hasToken') then

        lib.notify({
            title = Lang:t('error.no_token_title'),
            description = Lang:t('error.no_token'),
            type = 'error',
        })
        
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