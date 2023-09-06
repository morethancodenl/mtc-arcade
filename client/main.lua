RegisterNUICallback('exit', function()
    SendNUIMessage({
        type = "off",
        game = "",
    })
    SetNuiFocus(false, false)
end)
