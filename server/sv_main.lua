CreateThread(function()
    QBCore.Functions.AddItems({
        ['gametoken'] = {
            ['name'] = 'gametoken',
            ['label'] = 'Game Token',
            ['weight'] = 100,
            ['type'] = 'item',
            ['image'] = 'gametoken.png',
            ['unique'] = false,
            ['useable'] = false,
            ['shouldClose'] = false,
            ['combinable'] = nil,
            ['description'] = 'Game token.'
        }
    })
end)

lib.callback.register('qb-arcade:server:hasToken', function(source)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local hasToken = player.Functions.GetItemByName(Config.TokenItem)
    if hasToken ~= nil then
        player.Functions.RemoveItem(Config.TokenItem, 1)
        return true
    else
        return false
    end
end)

RegisterNetEvent('qb-arcade:server:buyToken', function(amount)
    local price = Config.TokenPrice * amount

    local player = QBCore.Functions.GetPlayer(source)

    if not player then return end
    if not player.Functions.RemoveMoney(Config.PaymentType, price, 'arcade-token-purchase') then 
        TriggerClientEvent('QBCore:Notify', source, Lang:t('error.not_enough_money'))
        return 
    end

    player.Functions.AddItem(Config.TokenItem, amount)
end)