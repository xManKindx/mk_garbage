Config = {}

Config.TruckRentalFee = 500 --Truck deposit amount. Returned to player when truck is returned
Config.InviteTimer = 30 --Seconds to wait for player to accept an invite
Config.CollectionTimer = 20 --time to collect before route is cancelled (minutes)
Config.TotalStops = 10 --How many dumpsters to stop at on the route (MINIMUM HAS TO BE 4)
Config.CollectionMin = 2 --minimum bags at each dumpster
Config.CollectionMax = 5 --max bags at each dumpster 
Config.CollectionMultiplier = 2 --add this many bags per extra worker 

Config.TrashTruck = 'trash2' --spawn code for your desired trash truck

---@param vehicle number Vehicle entity id
Config.SetFuel = function(vehicle)
    if GetResourceState('LegacyFuel') == 'started' then
        exports['LegacyFuel']:SetFuel(vehicle, 100)
    elseif GetResourceState('ox_fuel') == 'started' then 
        Entity(vehicle).state:set('fuel', 100, true)
    elseif GetResourceState('cdn-fuel') == 'started' then 
        exports['cdn-fuel']:SetFuel(vehicle, 100)
    else
        --add fuel resource here
    end
end

---@param vehicle number Vehicle entity id
---@param plate string Vehicle plate text
--script automatically gives keys if using mk_vehiclekeys or qb-vehiclekeys (not needed here)
Config.GiveKeys = function(vehicle, plate)

end

Config.ProgressCircle = false --true = circle progress bar from ox_lib / false = rectangle progress bar from ox_lib
Config.ProgressCirclePosition = 'middle' --position of the progress circle. can be either 'middle' or 'bottom'

Config.RequireTrunkOpen = false --if true then back of garbage truck has to be open to put bags inside

Config.Payment = {
    CashMin = 125, --Per Stop
    CashMax = 175,  --Per Stop
    Items = { --add as many items as you wish. each item has an individual roll chance
        { 
            Name = 'plastic', 
            Min = 25, --minimum amount to give if awarded
            Max = 90, --maximum amound to give if awarded
            MinChance = 1, --min roll chance
            MaxChance = 100, --max roll chance
            RewardChance = 100 --if the random number rolled between MinChance and MaxChance is less than or equal to this then the item is awarded to the player
        },
        { 
            Name = 'glass', 
            Min = 1, 
            Max = 1, 
            MinChance = 1, 
            MaxChance = 100, 
            RewardChance = 2
        },
    }
}

Config.JobStart = {
    BoxZone = { --boxzone setup using ox_lib zones (box) and targeting system
        Coords = {
            x = -346.93,
            y = -1573.24,
            z = 25.23,
            h = 77
        },
        Length = 2.0,
        Width = 1.0,
        Name = 'mk_garbage_job_start', 
        MinZ = 22.0, 
        MaxZ = 25.43, 
    }
}

Config.Blip = {
    Coords = {x = -346.52, y = -1571.09},
    Name = "Garbage Collecting", 
    Sprite = 318, 
    Color = 46,
    ShortRange = true,
}

Config.TruckSpawns = { --garbage truck spawn locations
    {Coords = {x = -335.56, y = -1564.43, z = 24.94, h = 58.84}},
    {Coords = {x = -341.78295898438, y = -1555.9581298828, z = 24.943235397339, h = 174.9200592041}},
    {Coords = {x = -370.94647216797, y = -1551.2629394531, z = 25.841264724731, h = 193.48370361328}},
    {Coords = {x = -366.97497558594, y = -1563.1989746094, z = 24.870916366577, h = 205.13792419434}},
    {Coords = {x = -361.14492797852, y = -1573.6173095703, z = 24.057504653931, h = 207.03309631348}}
}

Config.Stops = { --coordinates of dumpsters and their models for route calculations
    {Coords = {x = -55.62, y = -1496.41, z = 30.64}, Model = 218085040},
    {Coords = {x = -26.48, y = -1500.05, z = 29.44}, Model = 682791951},
    {Coords = {x = 95.69, y = -1438.40, z = 28.29}, Model = 218085040},
    {Coords = {x = 117.88, y = -1461.97, z = 28.24}, Model = -58485588},
    {Coords = {x = -75.90, y = -1406.34, z = 28.32}, Model = -58485588},
    {Coords = {x = -1180.34, y = -905.96, z = 12.49}, Model = 218085040}, --Burger Shot
    {Coords = {x = -1391.66, y = -642.28, z = 27.67}, Model = 218085040}, --Bahama Mamas
    {Coords = {x = -1396.27, y = -446.51, z = 33.47}, Model = -58485588}, --LS Underground
    {Coords = {x = -457.40, y = 67.38, z = 57.53}, Model = 218085040}, --Art Gallery
    {Coords = {x = -2.7490839958191, y = -1082.1510009766, z = 26.043090820313}, Model = -58485588}, --PDM
    {Coords = {x = 955.66271972656, y = -2101.8811035156, z = 29.740688323975}, Model = 218085040}, --Butcher
    {Coords = {x = -1259.4560546875, y = -1220.2777099609, z = 4.0632858276367}, Model = -58485588},
    {Coords = {x = -1294.4228515625, y = -1295.1353759766, z = 3.3896028995514}, Model = 666561306},
    {Coords = {x = -1303.6610107422, y = -1244.0661621094, z = 3.7151529788971}, Model = 666561306},
    {Coords = {x = -1244.7574462891, y = -1193.4816894531, z = 6.676842212677}, Model = 666561306},
    {Coords = {x = -1268.6478271484, y = -1098.6716308594, z = 6.7861518859863}, Model = 666561306},
    {Coords = {x = -1351.4403076172, y = -894.77368164063, z = 12.593574523926}, Model = 218085040},
    {Coords = {x = -1350.0151367188, y = -759.01452636719, z = 21.431686401367}, Model = 666561306},
    {Coords = {x = -1544.6564941406, y = -567.55364990234, z = 32.784236907959}, Model = 218085040},
    {Coords = {x = -1629.1665039063, y = -359.72283935547, z = 47.288398742676}, Model = 218085040},
    {Coords = {x = -1501.7276611328, y = -187.5064239502, z = 49.487915039063}, Model = 218085040},
    {Coords = {x = -1264.3361816406, y = -271.19110107422, z = 37.855346679688}, Model = -58485588},
    {Coords = {x = -1135.9635009766, y = -360.30868530273, z = 36.671463012695}, Model = 218085040},
    {Coords = {x = -1055.0216064453, y = -516.67633056641, z = 35.042213439941}, Model = 218085040},
    {Coords = {x = -725.42510986328, y = -429.90203857422, z = 34.29776763916}, Model = 218085040},
    {Coords = {x = -759.89910888672, y = -407.12026977539, z = 34.708206176758}, Model = 218085040},
    {Coords = {x = -857.41613769531, y = -239.82063293457, z = 38.464775085449}, Model = 218085040},
    {Coords = {x = -579.13677978516, y = 190.12135314941, z = 70.317337036133}, Model = 218085040},
    {Coords = {x = -506.27062988281, y = 307.12683105469, z = 82.250762939453}, Model = 666561306},
    {Coords = {x = -295.92492675781, y = 310.38751220703, z = 92.258430480957}, Model = 666561306},
    {Coords = {x = -178.65899658203, y = 203.22543334961, z = 86.762260437012}, Model = 666561306},
    {Coords = {x = -100.92370605469, y = 45.169609069824, z = 70.630958557129}, Model = 666561306},
    {Coords = {x = -26.985548019409, y = -77.088676452637, z = 56.25643157959}, Model = 666561306},
    {Coords = {x = 145.01342773438, y = -116.79621887207, z = 53.825149536133}, Model = 666561306},
    {Coords = {x = 71.594390869141, y = -211.87156677246, z = 53.49479675293}, Model = 666561306},
    {Coords = {x = 276.85720825195, y = -168.32247924805, z = 59.050136566162}, Model = 666561306},
    {Coords = {x = 644.00103759766, y = 138.28303527832, z = 90.369506835938}, Model = 666561306},
    {Coords = {x = 1116.087890625, y = -346.8486328125, z = 66.080253601074}, Model = 666561306},
    {Coords = {x = 1132.6879882813, y = -789.55755615234, z = 56.607223510742}, Model = 666561306},
    {Coords = {x = 793.99645996094, y = -660.19323730469, z = 27.810768127441}, Model = 218085040},
    {Coords = {x = 793.46368408203, y = -805.77862548828, z = 25.336044311523}, Model = 666561306},
    {Coords = {x = 704.97570800781, y = -834.12579345703, z = 23.415710449219}, Model = 218085040},
    {Coords = {x = 698.2705078125, y = -976.6826171875, z = 23.110107421875}, Model = 218085040},
    {Coords = {x = 864.59875488281, y = -1052.7718505859, z = 28.49723815918}, Model = 666561306},
    {Coords = {x = 776.47741699219, y = -1314.1234130859, z = 25.203819274902}, Model = 218085040},
    {Coords = {x = 397.02984619141, y = -1925.2885742188, z = 23.779779434204}, Model = 218085040},
    {Coords = {x = 417.77105712891, y = -2068.7497558594, z = 20.500345230103}, Model = 666561306},
    {Coords = {x = 314.86846923828, y = -2013.1298828125, z = 19.586687088013}, Model = -206690185},
    {Coords = {x = 187.43450927734, y = -1845.5712890625, z = 26.20871925354}, Model = 218085040},
    {Coords = {x = 160.39324951172, y = -1654.25390625, z = 28.295160293579}, Model = -58485588},
    {Coords = {x = -13.426147460938, y = -1812.9116210938, z = 24.91607093811}, Model = 666561306},
    {Coords = {x = 119.15502929688, y = -1944.2424316406, z = 19.718553543091}, Model = 218085040},
    {Coords = {x = -122.03498077393, y = -1622.0827636719, z = 31.137672424316}, Model = 666561306},
    {Coords = {x = -243.43383789063, y = -1472.662109375, z = 30.487192153931}, Model = 218085040},
    {Coords = {x = 8.6932373046875, y = -1030.0196533203, z = 28.169639587402}, Model = -58485588},
    {Coords = {x = 299.82971191406, y = -907.40991210938, z = 28.288005828857}, Model = 218085040},
    {Coords = {x = 437.6037902832, y = -1061.3695068359, z = 28.200622558594}, Model = 666561306},
    {Coords = {x = 932.04577636719, y = -1570.0302734375, z = 29.513746261597}, Model = -58485588},
    {Coords = {x = 972.50347900391, y = -1830.9273681641, z = 30.28978729248}, Model = 666561306},
}

------------------------------------------------------CLOTHING----------------------------------------------------------------
Config.JobClothes = {
    Enable = false, --if true player clothes will change when clocked in. will return to previous clothes when clocked out
    setClothes = function()
        local myModel = GetEntityModel(PlayerPedId())
        local myPed = PlayerPedId()

        if myModel == 1885233650 then --default male ped 
            --adjust textures to match your clothing system for male peds
            --uncomment any additional features you want to adjust

            SetPedComponentVariation(myPed, 3, 30, 0, GetPedPaletteVariation(myPed, 3)) -- arms
            SetPedComponentVariation(myPed, 4, 9, 6, GetPedPaletteVariation(myPed, 4)) -- pants
            SetPedComponentVariation(myPed, 6, 12, 6, GetPedPaletteVariation(myPed, 6)) -- shoes
            SetPedComponentVariation(myPed, 8, 59, 1, GetPedPaletteVariation(myPed, 8)) -- undershirt
            SetPedComponentVariation(myPed, 11, 1, 1, GetPedPaletteVariation(myPed, 11)) -- jacket

            --SetPedComponentVariation(myPed, 1, 0, 0, GetPedPaletteVariation(myPed, 1)) -- mask
            --SetPedComponentVariation(myPed, 2, 0, 0, GetPedPaletteVariation(myPed, 2)) -- hair
            --SetPedComponentVariation(myPed, 5, 0, 0, GetPedPaletteVariation(myPed, 5)) -- bag
            --SetPedComponentVariation(myPed, 7, 0, 0, GetPedPaletteVariation(myPed, 7)) -- accessory
            --SetPedComponentVariation(myPed, 9, 0, 0, GetPedPaletteVariation(myPed, 9)) -- vest
            --SetPedComponentVariation(myPed, 10, 0, 0, GetPedPaletteVariation(myPed, 10)) -- badge
        elseif myModel == -1667301416 then --default female ped
            --adjust textures to match your clothing system for female peds
            --uncomment any additional features you want to adjust

            SetPedComponentVariation(myPed, 3, 33, 0, GetPedPaletteVariation(myPed, 3)) -- arms
            SetPedComponentVariation(myPed, 4, 30, 2, GetPedPaletteVariation(myPed, 4)) -- pants
            SetPedComponentVariation(myPed, 6, 24, 0, GetPedPaletteVariation(myPed, 6)) -- shoes
            SetPedComponentVariation(myPed, 8, 36, 1, GetPedPaletteVariation(myPed, 8)) -- undershirt
            SetPedComponentVariation(myPed, 11, 49, 0, GetPedPaletteVariation(myPed, 11)) -- jacket

            --SetPedComponentVariation(myPed, 1, 0, 0, GetPedPaletteVariation(myPed, 1)) -- mask
            --SetPedComponentVariation(myPed, 2, 0, 0, GetPedPaletteVariation(myPed, 2)) -- hair
            --SetPedComponentVariation(myPed, 5, 0, 0, GetPedPaletteVariation(myPed, 5)) -- bag
            --SetPedComponentVariation(myPed, 7, 0, 0, GetPedPaletteVariation(myPed, 7)) -- accessory
            --SetPedComponentVariation(myPed, 9, 0, 0, GetPedPaletteVariation(myPed, 9)) -- vest
            --SetPedComponentVariation(myPed, 10, 0, 0, GetPedPaletteVariation(myPed, 10)) -- badge
        else --custom peds (add to if statement with custom ped clothes to use otherwise they will not change)

        end
    end
}