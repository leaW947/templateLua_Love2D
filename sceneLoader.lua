local SceneLoader={}

local gameplayService=require("gameplayService")
local assetManager=require("assetManager")

local sceneGame=require("sceneGame")

local gameState=""

function SceneLoader.load(pScreenWidth,pScreenHeight)
  
  gameplayService.setSizeScreen(pScreenWidth,pScreenHeight)
  
  ---add images and sounds
  
  gameplayService.setAssetManager(assetManager)
end

function SceneLoader.init(pGameState)
  gameState=pGameState
  
  if gameState=="menu" then 
  elseif gameState=="gameplay" then
    sceneGame.load(gameplayService,SceneLoader)
  elseif gameState=="gameover" then
  end
  
end

function SceneLoader.update(dt)
    
  if gameState=="menu" then
  elseif gameState=="gameplay" then
    sceneGame.update(dt)
  elseif gameState=="gameover" then
  end

end

function SceneLoader.draw()
  
  if gameState=="menu" then
  elseif gameState=="gameplay" then
    sceneGame.draw()
  elseif gameState=="gameover" then
  end

end


function SceneLoader.keypressed(key)
  
  if gameState=="menu" then
  elseif gameState=="gameplay" then
  elseif gameState=="gameover" then
  end

end

function SceneLoader.mousepressed(x,y,btn)
  
  if gameState=="menu" then
  elseif gameState=="gameplay" then
  elseif gameState=="gameover" then
  end

end

return SceneLoader