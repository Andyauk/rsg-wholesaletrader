local Translations = {
    error = {
        not_authorised = 'Du bist nicht autorisiert!',
    },
    menu = {
        wholesale_trader = 'Großhandelshändler',
        wholesale_storage = 'Großhandelslager',
        wholesale_imports = 'Großhandelseinfuhren',
        job_management = 'Jobverwaltung',
        job_wagon = 'Job-Wagen',
        close_menu = '>> Menü schließen <<',
    },
}

if GetConvar('rsg_locale', 'en') == 'de' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
