local Sprite={}

local lstSprite={}

function Sprite.create(pImg,pX,pY)
  local mySprite={}
  
  mySprite.img=pImg
  
  mySprite.x=pX
  mySprite.y=pY
  
  mySprite.vx=0
  mySprite.vy=0
  
  mySprite.scaleX=1
  mySprite.scaleY=1
  
  mySprite.width=mySprite.img:getWidth()
  mySprite.height=mySprite.img:getHeight()
  
  mySprite.rotation=0
  
  mySprite.bIsTilesheet=false
  
  mySprite.lstAnimation={}
  mySprite.lstImage={}
  
  mySprite.currentAnimation=nil
  mySprite.currentFrame=1
  
  mySprite.timer=0
  
  mySprite.setScale=function(pScaleX,pScaleY)
    mySprite.scaleX=pScaleX
    mySprite.scaleY=pScaleY
    
    mySprite.width=mySprite.img:getWidth()*mySprite.scaleX
    mySprite.height=mySprite.img:getHeight()*mySprite.scaleY
  end
  
  mySprite.setRotation=function(pRotation)
    mySprite.rotation=pRotation
  end
  
  mySprite.addAnimation=function(pNameAnim,pWFrame,pHFrame,pLstFrame,pSpeed,pLoop)
    
    mySprite.bIsTilesheet=true
    
    mySprite.width=pWFrame*mySprite.scaleX
    mySprite.height=pHFrame*mySprite.scaleY
    
    local nbCol=math.floor(mySprite.img:getWidth()/pWFrame)
      
    for n=1,#pLstFrame do
      
      local l=math.floor((pLstFrame[n]-1)/nbCol)+1
      local c=math.floor(pLstFrame[n]-((l-1)*nbCol))
      
      local x=(c-1)*pWFrame
      local y=(l-1)*pHFrame
      
      mySprite.lstImage[n]=love.graphics.newQuad(x,y,pWFrame,pHFrame,mySprite.img:getWidth(),mySprite.img:getHeight())
    end

    local animation={}
    animation.name=pNameAnim
    animation.lstFrame=pLstFrame
    animation.bLoop=pLoop
    animation.speed=pSpeed
    animation.lstImage=mySprite.lstImage
    animation.bIsFinish=false
    
    table.insert(mySprite.lstAnimation,animation)
 
  end

  mySprite.startAnimation=function(pNameAnim)
    
    if mySprite.currentAnimation~=nil then
      if mySprite.currentAnimation.name==pNameAnim then
        return
      end
    end
    
    if mySprite.bIsTilesheet then
      
      for n=1,#mySprite.lstAnimation do
        local anim=mySprite.lstAnimation[n]
        
        if anim.name==pNameAnim then
          mySprite.currentAnimation=anim
          mySprite.currentFrame=1
          mySprite.currentAnimation.bIsFinish=false
        end
      end
    end
    
  end
  
  table.insert(lstSprite,mySprite)
  return mySprite
end


function Sprite.update(dt)
  
  for k,v in pairs(lstSprite) do
    
    if v.currentAnimation~=nil then
      v.timer=v.timer+dt
   
      if v.timer>=v.currentAnimation.speed then
        v.timer=0
        v.currentFrame=v.currentFrame+1
        
        if v.currentFrame>=#v.currentAnimation.lstFrame+1 then
        
          if v.currentAnimation.bLoop then
            v.currentFrame=1
          else
            v.currentFrame=#v.currentAnimation.lstFrame
            v.currentAnimation.bIsFinish=true
          end
        
        end
      end
    end
  
  end

end


function Sprite.draw()
  
  for k,s in pairs(lstSprite) do
    
    if s.bIsTilesheet then
      love.graphics.draw(s.img,s.currentAnimation.lstImage[math.floor(s.currentFrame)],s.x,s.y,s.rotation,s.scaleX,s.scaleY)      
    else
      love.graphics.draw(s.img,s.x,s.y,s.rotation,s.scaleX,s.scaleY)
    end
  
  end
  
end

return Sprite