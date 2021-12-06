local scene = {}
local introGUI = suit.new()

function scene.load()
    width, height = love.window.getMode()
    love.window.setMode(510, 700)
    bg = love.graphics.newImage("images/bg.png")
    titleIMG = love.graphics.newImage("images/titleimg.png")
end

function scene.update()
    if introGUI:Button("START", 185, 350, 130, 60).hit then
        SSM.purge("title")
        SSM.add("game")
    end
    if introGUI:Button("QUIT", 185, 430, 130, 60).hit then
        love.event.quit(0)
    end
end

function scene.draw()
    love.graphics.draw(bg)
    love.graphics.draw(titleIMG, 0, 200)
    introGUI:draw()
end

return scene