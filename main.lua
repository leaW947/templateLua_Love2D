--trace consol
io.stdout:setvbuf('no')

-- pixel art
love.graphics.setDefaultFilter("nearest")

--debug
if arg[#arg] == "-debug" then require("mobdebug").start() end

local sceneLoader=require("sceneLoader")

function love.load()
  screenWidth=love.graphics.getWidth()
  screenHeight=love.graphics.getHeight()
  
  sceneLoader.load(screenWidth,screenHeight)
  sceneLoader.init("gameplay")
end

function love.update(dt)
  sceneLoader.update(dt)
end

function love.draw()
  sceneLoader.draw()
end

function love.keypressed(key)
  
  if key=="escape" then
    love.event.quit()
  end
  
  sceneLoader.keypressed(key)
end

function love.mousepressed(x,y,btn)
  sceneLoader.mousepressed(x,y,btn)
end