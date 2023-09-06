Config = {}
QBCore = exports['qb-core']:GetCoreObject()

-- Item that players get when they buy tokens and use to pay for a game.
Config.TokenItem = "gametoken"
Config.TokenPrice = "5"
Config.PaymentType = "cash" -- cash, bank, crypto

-- Arcade coin shop points
Config.Zones = {
    vector3(-1290.31, -298.4, 36.05),
    vector3(-1291.52, -300.7, 36.05)
}

-- Arcade coin shop NPC's
Config.shops = {
    {
        model = 'ig_jimmydisanto',
        coords = vector4(-1292.98, -301.59, 35.05, 300.74),
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        icon = 'fas fa-cart-shopping'
    }
}

Config.blip = {
    coords = vector3(-1286.24, -302.04, 36.03),
    label = "Arcade",
    sprite = 484,
    color = 0,
    scale = 0.7,
    display = 2,
}

Config.games = {
    {
        label = "Pacman",
        args = "http://xogos.robinko.eu/PACMAN/",
        icon = 'ghost'
    },
    {
        label = "Tetris",
        args = "http://xogos.robinko.eu/TETRIS/",
        icon = "cube"
    },
    {
        label = "Uno",
        args = "https://duowfriends.eu/",
        icon = "diamond"
    },
    {
        label = "FlappyParrot",
        args = "http://xogos.robinko.eu/FlappyParrot/",
        icon = "dove"
    },
    {
        label = 'slither',
        args = 'http://slither.io',
        icon = 'staff-snake',
    },
    {
        label = 'Duke Nukem 3D',
        args = string.format("nui://qb-arcade/html/msdos.html?url=%s&params=%s", "https://www.retrogames.cz/dos/zip/duke3d.zip", "./DUKE3D.EXE"),
        icon = 'gun'
    },
    {
        label = 'DOOM',
        args = string.format("nui://qb-arcade/html/msdos.html?url=%s&params=%s", "https://www.retrogames.cz/dos/zip/Doom.zip", "./DOOM.EXE"),
        icon = 'gun'
    }
}

Config.hacks = {
    {
        label = "Lockpick",
        icon = 'fa-regular fa-circle',
        action = function()
            exports['ps-ui']:Circle(function(success)
                if success then
                    QBCore.Functions.Notify("You opened the lock", "success")
                else
                    QBCore.Functions.Notify("You closed the lock", "error")
                end
            end, 2, 20) -- NumberOfCircles, MS
        end
    },
}