local scene = {}
local gameGUI = suit.new()

function scene.load()
    require "mines"
    require "powerups"
    
    width, height = love.window.getMode()
    love.window.setMode(510, 700)
    love.window.setTitle("Space Dodger")

    player = love.graphics.newImage('images/rocket.png')
    px = 215
    py = height-80

    bg = love.graphics.newImage("images/bg.png")
    x = 0
    y = -5
    y2 = -5
    bgMultiplier = 1

    asteroid = love.graphics.newImage("images/asteroid.png")

    scoreMult = love.graphics.newImage("images/doublescore.png")

    minesInit()
    powerupInit()

    timer = 0
    count = 1
    secondsTimer = 1

    music = love.audio.newSource('sound/bgSong.mp3', 'stream')
    music:seek('27', 'seconds')
    music:play()
end

function scene.update(dt)

    -- Scroll Background --
    y = y + (bgMultiplier+2)
    y2 = y2 + (bgMultiplier+2)

    if y >= 100 then
        y = 0
    end

    if y2 >= 100 then
        y2 = 0
    end

    -- Player Movement
    if px >= -14 and px <= 459 then
        if love.keyboard.isDown('a') then
            px = px - (5 + bgMultiplier/2)
        end
        if love.keyboard.isDown('d') then
            px = px + (5 + bgMultiplier/2)
        end
    else
        if px <= -14 then
            px = px + 3
        end
        if px >= 459 then
            px = px - 3
        end
    end

    bgMultiplier = bgMultiplier + 0.001

    -- Timer
    timer = timer + 1
    if timer >= 60 then
        secondsTimer = secondsTimer + 1
        if count <= 10000 then
            count = count + count/3
            timer = 0
        else
            count = count + count/10
            timer = 0
        end
    end

    minesUpdate()
    updatePowerup()
end

function scene.draw()
    -- Draw Background --
    love.graphics.draw(bg, x, y-5)
    love.graphics.draw(bg, x, y2-505)

    minesDraw()

    love.graphics.draw(player, px, py, nil, 4)

    love.graphics.setNewFont(25)
    love.graphics.print("SCORE: " .. math.floor(count), 0, 0)
    love.graphics.draw(scoreMult, 100, 100, 0, 0.5)
    --love.graphics.print(secondsTimer, 0, 100)

    if boolSpawn == true then
        spawnPowerup()
    end

    gameGUI:draw()
end

return scene