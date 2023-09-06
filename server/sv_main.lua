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
        TriggerClientEvent('ox_lib:notify', source, {
            title = Lang:t('error.not_enough_money_title'),
            description = Lang:t('error.not_enough_money'),
            type = 'error',
        })
        return 
    end

    player.Functions.AddItem(Config.TokenItem, amount)
end)