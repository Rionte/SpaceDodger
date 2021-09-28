suit = require 'lib.suit'
SSM = require 'lib.ssm'

function love.load()
    width, height = love.window.getMode()
    love.window.setMode(500, 700)
    love.window.setTitle("Space Dodger")

    bg = love.graphics.newImage("images/bg.png")
    x = 0
    y = -5
    y2 = -5
end

function love.update(dt)
    -- Scroll Background --
    y = y + 5
    y2 = y2 + 5

    if y >= 100 then
        y = 0
    end

    if y2 >= 100 then
        y2 = 0
    end
end

function love.draw()
    -- Draw Background --
    love.graphics.draw(bg, x, y-5)
    love.graphics.draw(bg, x, y2-505)
end
