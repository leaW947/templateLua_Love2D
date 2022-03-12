local GameplayService={}

GameplayService.screenWidth=0
GameplayService.screenHeight=0

GameplayService.assetManager=nil


function GameplayService.setSizeScreen(pWidth,pHeight)
  GameplayService.screenWidth=pWidth
  GameplayService.screenHeigth=pHeight
end

function GameplayService.setAssetManager(pAssetManager)
  GameplayService.assetManager=pAssetManager
end


return GameplayService