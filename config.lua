Config = {}
QBCore = exports['qb-core']:GetCoreObject()

-- Item that players get when they buy tokens and use to pay for a game.
Config.TokenItem = "gametoken" -- WIP (Item name: Game Token)
Config.TokenPrice = "5"
Config.PaymentType = "cash" -- WIP

Config.Zones = {
    vector3(-1290.31, -298.4, 36.05),
    vector3(-1291.52, -300.7, 36.05)
}

Config.blip = {
    coords = vector3(-1291.52, -300.7, 36.05),
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
        label = "Rondjes",
        icon = 'fa-regular fa-circle',
        action = function()
            exports['ps-ui']:Circle(function(success)
                if success then
                    QBCore.Functions.Notify("Je hebt de hack voltooid!", "success")
                else
                    QBCore.Functions.Notify("Je hebt de hack gefaald!", "error")
                end
            end, 2, 20) -- NumberOfCircles, MS
        end
    },
    {
        label = "Speurtocht",
        icon = 'search',
        action = function()
            exports['ps-ui']:Maze(function(success)
                if success then
                    QBCore.Functions.Notify("Je hebt de hack voltooid!", "success")
                else
                    QBCore.Functions.Notify("Je hebt de hack gefaald!", "error")
                end
            end, 20)
        end
    },
    {
        label = "VR",
        icon = 'vr-cardboard',
        action = function()
            exports['ps-ui']:VarHack(function(success)
                if success then
                    QBCore.Functions.Notify("Je hebt de hack voltooid!", "success")
                else
                    QBCore.Functions.Notify("Je hebt de hack gefaald!", "error")
                end
            end, math.random(3,5), math.random(6,9))
        end
    },
    {
        label = "blokjes",
        icon = 'fa-chess-board',
        action = function()
            exports['ps-ui']:Thermite(function(success)
                if success then
                    QBCore.Functions.Notify("Je hebt de hack voltooid!", "success")
                else
                    QBCore.Functions.Notify("Je hebt de hack gefaald!", "error")
                end
             end, 10, 5, 3) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
        end
    }
}