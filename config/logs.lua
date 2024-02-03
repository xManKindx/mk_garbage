Config.Logs = {
    WebHook = '', --Discord webhook

    ---@param playerSource number Player server id
    ---@param playerIdentifier string Player identifier (citizen id for qb / identifier for esx)
    ---@param cashAwarded number Cash given to player
    ---@param itemRewarded { [itemname: string]: amount: number }
    --Player completed the garbage run
    CompletedRun = function(playerSource, playerIdentifier, cashAwarded, itemsRewarded)
        local rewards
        local next = next
        if itemsRewarded and next(itemsRewarded) ~= nil then
            for key, value in pairs(itemsRewarded) do 
                if not rewards then 
                    rewards = '['..value..'] '..key 
                else
                    rewards = rewards..', ['..value..'] '..key
                end
            end
        end
        local logString = '**(Player: '..playerIdentifier..' | ID: '..playerSource..')** Completed a garbage route. Received $'..utils:formatThousand(cashAwarded)..(rewards and ', '..rewards or '')
        utils:discordLog(Config.Logs.WebHook, 'Garbage Run Completed', 5763719, logString)
    end,

    ---@param playerSource number Player server id
    ---@param playerIdentifier string Player identifier (citizen id for qb / identifier for esx)
    --Player completed the run but did not drive the truck or turn in any bags (was not paid)
    NoWork = function(playerSource, playerIdentifier)
        local logString = '**(Player: '..playerIdentifier..' | ID: '..playerSource..')** Completed a garbage route without doing any work. No pay given.'
        utils:discordLog(Config.Logs.WebHook, 'Garbage Run Completed', 15548997, logString)
    end,

    ---@param playerSource number Player server id
    ---@param playerIdentifier string Player identifier (citizen id for qb / identifier for esx)
    --Player completed the run but did a total of less than half the driving and or turned in less garbage bags than there were stops (was not paid)
    NotEnoughWork = function(playerSource, playerIdentifier)
        local logString = '**(Player: '..playerIdentifier..' | ID: '..playerSource..')** Completed a garbage route without doing the minimum required work. No pay given.'
        utils:discordLog(Config.Logs.WebHook, 'Garbage Run Completed', 15105570, logString)
    end
}