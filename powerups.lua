function powerupInit()
    powerY = getCurrentY()
    scoreMult = love.graphics.newImage("images/doublescore.png")
    shootAst = love.graphics.newImage("images/shoot.png")
    powerupList = {scoreMult, scoreMult}
    start = false
    spawn = true
    changeColorVar = false
    canShoot = false
    currentPower = 0
    powerCollected = false
    powerX = spawnPosList[love.math.random(1, 2)]
    powerTimer = 5
    powerClock = cron.every(60, function() 
        love.graphics.print(powerTimer, 450, 0)
        powerTimer = powerTimer - 1
    end)
end

function updatePowerup()
    powerY = powerY + (2+bgMultiplier)
    if startPowerTimer == true and currentPower == "scoreMult" then
        scoreMultNum = 2
        changeColorVar = true
    elseif startPowerTimer == true and currentPower == "shootAst" then
        canShoot = true
    else
        scoreMultNum = 1
        changeColorVar = false
        canShoot = false
    end
    if isBelow() and start == true and powerType == scoreMult then
        powerY = 0
        spawn = true
        start = false
        startPowerTimer = true
        currentPower = "scoreMult"
        powerCollected = true
    end
    if isBelow() and start == true and powerType == shootAst then
        powerY = 0
        spawn = true
        start = false
        startPowerTimer = true
        currentPower = "shootAst"
        powerCollected = true
    end
    if getDistance(powerX, powerY, px+player:getWidth()*2, py+player:getHeight()*2) < 55 then
        powerY = 1000
    end
end

function updateTimer()
    if startPowerTimer == true then
        powerClock:update(1)
        if powerTimer == 0 then
            startPowerTimer = false
            powerCollected = false
            powerTimer = 5
        end
    end
end

function isOnTop()
    return powerY <= 0
end

function powerOnScreen()
    if powerY > 0 then
        if powerY <= 700 then
            return true
        end
        return false
    else
        return false
    end
end

function isBelow()
    return powerY > 700
end

function spawnPowerup()
    if spawn == true then
        powerType = powerupList[love.math.random(1, 2)]
        if rand3 == 100 then
            powerX = 300
        elseif rand3 == 300 then
            powerX = 100
        end
    end
    spawn = false
    
    love.graphics.draw(powerType, powerX, powerY, nil, 0.7)
end

function getPowerX()
    return powerX
end