powerupLib = require "powerups"

mineY = 0
boolSpawn = false
spawnPosList = {100, 300}
lazerEffect = love.audio.newSource("sound/lazer.mp3", "stream")
mineShot = false

function getDistance(x1, y1, x2, y2)
	local dx = x1-x2
	local dy = y1-y2 
	return math.sqrt((dx * dx + dy * dy))
end

function minesInit()
    astSizeMultiplier = 3
    astSize = asteroid:getWidth() * 4
    --[[aspos = {
        { y=-100, x={ love.math.random(0-(astSize/2), 170-astSize), love.math.random(170, 340-astSize), love.math.random(340, 510-(astSize/2)) } },
        { y=-550, x={ love.math.random(0-(astSize/2), 170-astSize), love.math.random(170, 340-astSize), love.math.random(340, 510-(astSize/2)) } }
    }--]]
    rand1 = love.math.random(0-(astSize/2), 170-astSize)
    rand2 = love.math.random(170, 340-astSize)
    rand3 = spawnPosList[love.math.random(2)]
    rand4 = love.math.random(340, 510-(astSize/2))
    rand1shot = false
    rand2shot = false
    rand3shot = false
    rand4shot = false
    aspos2 = {
        { y=-100, x={ rand1, rand2, 100, rand4 } },
        { y=-550, x={ rand1, rand2, 300, rand4 } }
    }
end

function love.keypressed(key)
    if key == "space" and canShoot == true then
        if px > rand2 and px < rand2+asteroid:getWidth()*2 then
            lazerEffect = love.audio.newSource("sound/lazer.mp3", "stream")
            lazerEffect:play()
        end
    end
end

function minesUpdate()
    for _,asy in ipairs(aspos2) do
        asy.y = asy.y + (2+bgMultiplier)
        if asy.y >= 700 then
            asy.y = -100
            rand1 = love.math.random(0-(astSize/2), 170-astSize)
            rand2 = love.math.random(170, 340-astSize)
            rand3 = spawnPosList[love.math.random(2)]
            rand4 = love.math.random(340, 510-(astSize/2))
            asy.x = { rand1, rand2, rand3, rand4 }
            rand1shot = false
            rand2shot = false
            rand3shot = false
            rand4shot = false
            randNum = love.math.random(1)
            if randNum == 1 and isOnTop() and powerTimer == 5 then
                mineY = asy.y
                start = true
            end
        end
        for _,asx in ipairs(asy.x) do
            if getDistance(asx+asteroid:getWidth(), asy.y+asteroid:getHeight(), px+player:getWidth()*2, py+player:getHeight()*2) < 40 then
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
    for _,asy in ipairs(aspos2) do
        for _,asx in ipairs(asy.x) do
            if notShot == false then
                love.graphics.draw(asteroid, asx, asy.y, nil, astSizeMultiplier)
            end
        end
    end
end