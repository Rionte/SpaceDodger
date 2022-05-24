powerupLib = require "powerups"

mineY = 0
boolSpawn = false
spawnPosList = {100, 300}
getY = false
extraMineY = 0
extraMineX = 0
extraMineY2 = 0
extraMineX2 = 0

function getDistance(x1, y1, x2, y2)
	local dx = x1-x2
	local dy = y1-y2 
	return math.sqrt((dx * dx + dy * dy))
end

function minesInit()
    astSizeMultiplier = 3
    astSize = asteroid:getWidth() * 4
    aspos = {
        { y=-100, x={ love.math.random(0-(astSize/2), 170-astSize), love.math.random(170, 340-astSize), love.math.random(340, 510-(astSize/2)) } },
        { y=-550, x={ love.math.random(0-(astSize/2), 170-astSize), love.math.random(170, 340-astSize), love.math.random(340, 510-(astSize/2)) } }
    }
end

function minesUpdate()
    for _,asy in ipairs(aspos) do
        asy.y = asy.y + (2+bgMultiplier)
        extraMineY = asy.y
        if asy.y >= 700 then
            extraMineX = spawnPosList[love.math.random(2)]
            asy.y = -100
            asy.x = { love.math.random(0-(astSize/2), 170-astSize), love.math.random(170, 340-astSize), love.math.random(340, 510-(astSize/2)) }
            randNum = love.math.random(1)
            astRandNum = love.math.random(1)
            if randNum == 1 and isOnTop() and powerTimer == 5 then
                mineY = asy.y
                start = true
            end
            if astRandNum == 1 then
                extraMineY = asy.y
            end
        end
        for _,asx in ipairs(asy.x) do
            if getDistance(asx+asteroid:getWidth(), asy.y+asteroid:getHeight(), px+player:getWidth()*2, py+player:getHeight()*2) < 70 then
                SSM.purge("game")
                SSM.add("death")
            end
        end
        if astRandNum == 1 then    
            if getDistance(extraMineX+asteroid:getWidth(), extraMineY+asteroid:getHeight(), px+player:getWidth()*2, py+player:getHeight()*2) < 70 then
                SSM.purge("game")
                SSM.add("death")
            end
        end
    end
end

function getCurrentY()
    return mineY
end

function minesDraw()
    for _,asy in ipairs(aspos) do
        for _,asx in ipairs(asy.x) do
            love.graphics.draw(asteroid, asx, asy.y, nil, astSizeMultiplier)
        end
    end

    love.graphics.draw(asteroid, extraMineX, extraMineY, nil, astSizeMultiplier)
    love.graphics.draw(asteroid, extraMineX2, extraMineY2, nil, astSizeMultiplier)
end