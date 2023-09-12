# RexshackGaming
- discord : https://discord.gg/s5uSk56B65
- github : https://github.com/Rexshack-RedM

# Dependancies
- rsg-core
- rsg-bossmenu
- rsg-jobwagon
- ox_lib

# Installation
- ensure that the dependancies are added and started
- add rsg-wholesaletrader to your resources folder
- adjust the config.lua as required

# add to shared jobs
```lua
    ['stdeniswholesale'] = {
        label = 'St Denis Wholesale Trader',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 25
            },
            ['1'] = {
                name = 'Trader',
                payment = 50
            },
            ['2'] = {
                name = 'Manager',
                isboss = true,
                payment = 75
            },
        },
    },
    ['blkwholesale'] = {
        label = 'Blackwater Wholesale Trader',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 25
            },
            ['1'] = {
                name = 'Trader',
                payment = 50
            },
            ['2'] = {
                name = 'Manager',
                isboss = true,
                payment = 75
            },
        },
    },
```

# insert into management_funds sql table
```
INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES
('stdeniswholesale', 0, 'boss'),
('blkwholesale', 0, 'boss');
```

# Starting the resource
- add the following to your server.cfg file : ensure rsg-wholesaletrader
