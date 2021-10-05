local scene = {}
local gameGUI = suit.new()

function scene.load()
    require "mines"
    require "death"
    
    width, height = love.window.getMode()
    love.window.setMode(500, 700)
    love.window.setTitle("Space Dodger")

    player = love.graphics.newImage('images/rocket.png')
    px = 215
    py = height+15

    bg = love.graphics.newImage("images/bg.png")
    x = 0
    y = -5
    y2 = -5
    bgMultiplier = 1

    asteroid = love.graphics.newImage("images/asteroid.png")
    -- 1st Pair of asteroids
    asy = -100
    as2y = -550
    asx = love.math.random(-15, 500)
    as2x = love.math.random(-15, 500)
    as3x = love.math.random(-15, 500)

    -- 2nd Pair of asteroids
    as4x = love.math.random(-15, 500)
    as5x = love.math.random(-15, 500)
    as6x = love.math.random(-15, 500)

    timer = 0
    count = 1

    music = love.audio.newSource('sound/bgSong.mp3', 'stream')
    music:seek('27', 'seconds')
    music:play()

    test = false
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
        count = count + 1
        timer = 0
    end

    -- Collisions
end

function scene.draw()
    -- Draw Background --
    love.graphics.draw(bg, x, y-5)
    love.graphics.draw(bg, x, y2-505)

    genMine()
    drawMine()

    love.graphics.draw(player, px, py, nil, 4)
        
    love.graphics.line(asx+10, asy+20, asx+asteroid:getWidth()*3.7, asy+20)
    love.graphics.line(asx+10, asy+asteroid:getHeight()*3.7, asx+asteroid:getWidth()*3.7, asy+asteroid:getHeight()*3.7)
    love.graphics.line(asx+10, asy+20, asx+10, asy+asteroid:getHeight()*3.7)
    love.graphics.line(asx+asteroid:getWidth()*3.7, asy+20, asx+asteroid:getWidth()*3.7, asy+asteroid:getHeight()*3.7)

    love.graphics.line(px+15, py+5, px+player:getWidth()*2.8, py+5)
    love.graphics.line(px+15, py+player:getHeight()*4, px+player:getWidth()*2.8, py+player:getHeight()*4)
    love.graphics.line(px+15, py+5, px+15, py+player:getHeight()*4)
    love.graphics.line(px+player:getWidth()*2.8, py+5, px+player:getWidth()*2.8, py+player:getHeight()*4)

    gameGUI:draw()

    if test == true then
        Death()
    end
end

return scene