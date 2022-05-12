local GameplayService={}

GameplayService.screenWidth=0
GameplayService.screenHeight=0

GameplayService.assetManager=nil
GameplayService.utils=nil


function GameplayService.setSizeScreen(pWidth,pHeight)
  GameplayService.screenWidth=pWidth
  GameplayService.screenHeight=pHeight
end

function GameplayService.setAssetManager(pAssetManager)
  GameplayService.assetManager=pAssetManager
end

function GameplayService.setUtils(pUtils)
  GameplayService.utils=pUtils
end


return GameplayService