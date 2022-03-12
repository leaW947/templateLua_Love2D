local SceneGame={}

local gameplayService=nil
local sceneLoader=nil

function SceneGame.load(pGameplayService,pSceneLoader)
  gameplayService=pGameplayService
  sceneLoader=pSceneLoader
end



function SceneGame.update(dt)
end



function SceneGame.draw()
end



return SceneGame