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