local Translations = {
    menu = {
        arcade = "Arcade kast",
        special = "Speciale knop",   

        purchase_token = "Koop token | Prijs: € %s",
        amount = "Aantal",
    },

    target = {
        arcade = "Arcade kast",
        special = "Speciale knop kab00m!",
    },

    interactions = {
        enter_token_shop = "Gametokens inkopen"
    },

    error = {
        no_token_title = "Arcadekast",
        no_token = "Je hebt een gametoken nodig om een spelletje te kunnen spelen.",

        not_enough_money_title = "Gametokens",
        not_enough_money = "Je hebt niet voldoende geld om een gametoken te kopen.",
    }
}

if GetConvar('qb_locale', 'en') == 'nl' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
