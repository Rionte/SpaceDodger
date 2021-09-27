suit = require 'lib.suit'
SSM = require 'lib.ssm'

function love.load()
    bg = love.graphics.newImage("images/bg.png")
    x = 0
    y = -5
    y2 = -5
    width, height = love.window.getMode()
    love.window.setMode(500, 700)
end

function love.update(dt)
    y = y + 10
    y2 = y2 + 10

    if y == -700 then
        y = 0
    end

    if y2 == -700 then
        y2 = 0
    end
end

function love.draw()
    love.graphics.draw(bg, x, y-505)
    love.graphics.draw(bg, x, y2-505)
end