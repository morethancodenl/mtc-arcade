local pedEntities = {}

local function Nearby()
    if IsControlJustPressed(0, 38) then
        lib.showContext('arcade_purchase_token')
        return
    end
end

CreateThread(function()
    for _, v in ipairs(Config.Zones) do
        lib.points.new({
            coords = v,
            distance = 3,

            onEnter = function()
                lib.showTextUI(Lang:t('interactions.enter_token_shop'), {
                    position = "left-center",
                    icon = 'e'
                })
            end,

            onExit = function()
                lib.hideTextUI()
            end,

            nearby = Nearby
        })
    end
end)

CreateThread(function()
    for i, v in ipairs(Config.shops) do
        lib.points.new({
            coords = v.coords,
            distance = 25,

            onEnter = function()
                -- spawn npc here
                local model = joaat(v.model)
                lib.requestModel(model)
                local ped = CreatePed(4, model, v.coords.x, v.coords.y, v.coords.z, false, false, false)
                SetEntityHeading(ped, v.coords.w)
                FreezeEntityPosition(ped, true)
                SetEntityInvincible(ped, true)
                SetBlockingOfNonTemporaryEvents(ped, true)
                SetPedDiesWhenInjured(ped, false)
                SetPedCanPlayAmbientAnims(ped, true)

                if v.scenario then
                    TaskStartScenarioInPlace(ped, v.scenario, 0, true)
                end
                pedEntities[i] = ped

                exports['qb-target']:AddTargetEntity(ped, {
                    options = {
                        {
                            label = Lang:t('interactions.enter_token_shop'),
                            icon = v.icon,
                            action = function()
                                lib.showContext('arcade_purchase_token')
                            end
                        }
                    }
                })
            end,

            onExit = function()
                DeleteEntity(pedEntities[i])
            end,
        })
    end
end)