local Translations = {
erro = {
    not_authorised = 'você não está autorizado!',
},
menu = {
    wholesale_trader = 'Comerciante Atacadista',
    wholesale_storage = 'Armazenamento Atacadista',
    wholesale_imports = 'Importações Atacadistas',
    job_management = 'Gerenciamento de Trabalho',
    job_wagon = 'Carro de Trabalho',
    close_menu = '>> Fechar Menu <<',
},
}

if GetConvar('rsg_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
