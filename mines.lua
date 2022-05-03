powerupLib = require "powerups"

mineX = 0
mineY = 0
boolSpawn = false
randNumTest = 0
tempVar = 0
spawnPosList = {100, 300}

function getDistance(x1, y1, x2, y2)
	local dx = x1-x2
	local dy = y1-y2 
	return math.sqrt((dx * dx + dy * dy))
end

function minesInit()
    astSizeMultiplier = 2
    astSize = asteroid:getWidth() * 4
    aspos = {
        { y=-100, x={ love.math.random(0-(astSize/2), 170-astSize), love.math.random(170, 340-astSize), love.math.random(340, 510-(astSize/2)) } },
        { y=-550, x={ love.math.random(0-(astSize/2), 170-astSize), love.math.random(170, 340-astSize), love.math.random(340, 510-(astSize/2)) } }
    }
end

function minesUpdate()
    for _,asy in ipairs(aspos) do
        asy.y = asy.y + (2+bgMultiplier)
        if asy.y >= 700 then
            asy.y = -100
            asy.x = { love.math.random(0-(astSize/2), 170-astSize), love.math.random(170, 340-astSize), love.math.random(340, 510-(astSize/2)) }
            randNum = love.math.random(1)
            if randNum == 1 then
                if powerOnScreen() == true then
                    mineX = asy.x[love.math.random(3)]
                    mineY = asy.y
                    tempVar = spawnPosList[love.math.random(2)]
                    boolSpawn = true
                    randNum = randNumTest
                end
            end
            if powerOnScreen() == true then
                powerupType = love.math.random(1, 2)
            end
        end
        for _,asx in ipairs(asy.x) do
            if getDistance(asx+asteroid:getWidth(), asy.y+asteroid:getHeight(), px+player:getWidth()*2, py+player:getHeight()*2) < 45 then
                SSM.purge("game")
                SSM.add("death")
            end
        end
    end
end

function getCurrentY()
    return mineY
end

function getCurrentX()
    return mineX
end

function minesDraw()
    for _,asy in ipairs(aspos) do
        for _,asx in ipairs(asy.x) do
            love.graphics.draw(asteroid, asx, asy.y, nil, astSizeMultiplier)
        end
    end
end

function getRandNum()
    return randNumTest
end

function getPowerupType()
    return powerupType
end