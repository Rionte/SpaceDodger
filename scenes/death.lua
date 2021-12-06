local scene = {}
local deathGUI = suit.new()

function scene.load()
    width, height = love.window.getMode()
    love.window.setMode(510, 700)
    bg = love.graphics.newImage("images/bg.png")
    dimg = love.graphics.newImage("images/deathscreen.png")

    music:stop()
end

function scene.update()
    if deathGUI:Button("RESTART", 185, 350, 130, 60).hit then
        SSM.purge("death")
        SSM.add("game")
    end
    if deathGUI:Button("QUIT", 185, 430, 130, 60).hit then
        love.event.quit(0)
    end
end

function scene.draw()
    love.graphics.draw(bg)
    love.graphics.draw(dimg, 25, 200)
    deathGUI:draw()
end

return scene