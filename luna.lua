--[[


    PLEASE NOTE:

    Documentation for animationPal is provided within the animationPal file itself.


]]

-- Run code on level start
function onStart()
    --lights.enabled = false	
end

xxx = 0
yyy = 0

local square = Graphics.loadImage("square.png")
local square1 = Graphics.loadImage("square1.png")
local square2 = Graphics.loadImage("square2.png")
local square3 = Graphics.loadImage("square3.png")
local square4 = Graphics.loadImage("square4.png")
FROMX_left = -1
TOX_left = 0
FROMY_left = 0
TOY_left = 30

FROMX_right = 27
TOX_right = 27
FROMY_right = 0
TOY_right = 30

FROMX_TOP = 0
TOX_TOP = 27
FROMY_TOP = -1
TOY_TOP = 0

FROMX_test = 27
TOX_test = 27
FROMY_test = 30
TOY_test = 30

FROMX_test2 = 0
TOX_test2 = 0
FROMY_test2 = 0
TOY_test2 = 30

FROMX_test3 = 27
TOX_test3 = 27
FROMY_test3 = 30
TOY_test3 = 30

FROMX_test4 = 27
TOX_test4 = 27
FROMY_test4 = 30
TOY_test4 = 30


state = false
stack_leftup = false
stack_leftdown = false
function onTick()
    if #Block.getIntersecting(player.x+27, player.y+15, player.x+27, player.y+0) < 1 then 
        if #Block.getIntersecting(player.x+0, player.y+31, player.x+15, player.y+31) < 1 then
            if #Block.getIntersecting(player.x+0, player.y-1, player.x+27, player.y-1) < 1 then
                if #Block.getIntersecting(player.x-1, player.y+0, player.x-1, player.y+30) < 1 then 
                    if player.direction == -1 then
                        stack_leftdown = false
                        --stack_rightdown = false
                        --stack_rightup = false
                        stack_leftup = true
                        Text.print("stack_leftup", 100, 400)  
                    end
                end
            end
        end      
    end

    if #Block.getIntersecting(player.x+0, player.y+0, player.x+15, player.y+0) < 1 then 
        Text.print("stack_leftdown_reach", 100, 400) 
        if #Block.getIntersecting(player.x+27, player.y+30, player.x+27, player.y+15) < 1 then
            Text.print("stack_leftdown_reach", 100, 420) 
            if #Block.getIntersecting(player.x+0, player.y+31, player.x+27, player.y+31) < 1 then
                Text.print("stack_leftdown_reach", 100, 440) 
                if #Block.getIntersecting(player.x-1, player.y+0, player.x-1, player.y+30) < 1 then 
                    Text.print("stack_leftdown_reach", 100, 460) 
                    stack_leftdown = true
                    --stack_rightdown = false
                    --stack_rightup = false
                    stack_leftup = false
                    Text.print("stack_leftdown", 100, 400) 
                end
            end
        end      
    end

    
    Defines.gravity = 12
    
    
    
    if not stack_leftup then
        stackx_leftup = player.x-12
    end
    if stack_leftup then
        player.x = stackx_leftup
        Text.print(stack_leftup, 100, 500)
        Defines.gravity = 0
        if player.keys.left == KEYS_DOWN then
            Text.print("dddd", 100, 350)
            player.y = player.y + 1
        end
    end



    if not stack_leftdown then
        stacky_leftdown = player.x
        Text.print("rrrrrreeeeacccchhh", 200, 100)
    end
    if stack_leftdown then
        player.y = player.y+1
        player.x = stacky_leftdown
        Text.print(stack_leftdown, 100, 500)
        Defines.gravity = 0
        if player.keys.left == KEYS_DOWN then
            Text.print("dddd", 100, 350)
            player.y = player.y + 1
        end
    end











    Graphics.drawLine{x1 = player.x+27, y1 = player.y+15, x2 = player.x+27, y2 = player.y+0, priority = 2000, color = {255,0,0}, sceneCoords = true}; --half right
    Graphics.drawLine{x1 = player.x+0, y1 = player.y+30, x2 = player.x+15, y2 = player.y+30, priority = 2000, color = {255,0,0}, sceneCoords = true}; --half down
    Graphics.drawLine{x1 = player.x+0, y1 = player.y+0, x2 = player.x+27, y2 = player.y+0, priority = 2000, color = {255,0,0}, sceneCoords = true}; --top
    Graphics.drawLine{x1 = player.x+0, y1 = player.y+0, x2 = player.x+0, y2 = player.y+30, priority = 2000, color = {255,0,0}, sceneCoords = true};	--leftbase

    Graphics.drawLine{x1 = player.x+0, y1 = player.y+0, x2 = player.x+15, y2 = player.y+0, priority = 2000, color = {0,255,0}, sceneCoords = true}; --half top
    Graphics.drawLine{x1 = player.x+27, y1 = player.y+30, x2 = player.x+27, y2 = player.y+15, priority = 2000, color = {0,255,0}, sceneCoords = true}; -- half right
    Graphics.drawLine{x1 = player.x+0, y1 = player.y+30, x2 = player.x+27, y2 = player.y+30, priority = 2000, color = {0,255,0}, sceneCoords = true}; --ground
    Graphics.drawLine{x1 = player.x+0, y1 = player.y+0, x2 = player.x+0, y2 = player.y+30, priority = 2000, color = {0,255,0}, sceneCoords = true};	--leftbase
    if #Block.getIntersecting(player.x+FROMX_test, player.y+FROMY_test, player.x+TOX_test, player.y+TOY_test) > 0 then
        Text.print("touch" ,100, 140)
    end


    Text.print("blocks" .. #Block.getIntersecting(player.x-1, player.y, player.x, player.y), 100, 160)

    if player.keys.left == KEYS_PRESSED then
        player.speedX = -0.5
    elseif player.keys.right == KEYS_PRESSED then
        player.speedX = 0.5
    end

    if #Block.getIntersecting(player.x+FROMX_left, player.y+FROMY_left, player.x+TOX_left, player.y+TOY_left) > 0 then
        if player.keys.left == KEYS_DOWN then
            player.speedY = -2
        end
        if player.keys.jump == KEYS_PRESSED then
            player.speedX = 1
        end
        Text.print("left", 100, 120)
        --Defines.gravity = 0
    end
    if #Block.getIntersecting(player.x+FROMX_right, player.y+FROMY_right, player.x+TOX_right, player.y+TOY_right) > 0 then
        if player.keys.right == KEYS_DOWN then
            player.speedY = -2
        end
        if player.keys.jump == KEYS_PRESSED then
            player.speedX = -1
        end
        Text.print(Block.getIntersecting(player.x, player.y, player.x+25, player.y-48)[1], 100, 120)
        
        --Defines.gravity = 0
    end
    Text.print(#Block.getIntersecting(player.x+FROMX_TOP, player.y+FROMY_TOP, player.x+TOX_TOP, player.y+TOY_TOP) ,100, 200)
    if #Block.getIntersecting(player.x+FROMX_TOP, player.y+FROMY_TOP, player.x+TOX_TOP, player.y+TOY_TOP) > 0 then
        Defines.gravity = 0
        state = true
    end
    if state and #Block.getIntersecting(player.x+FROMX_TOP, player.y+FROMY_TOP, player.x+TOX_TOP, player.y+TOY_TOP) < 1 then
        player.speedY = -5
        state = false
    end
    
    if player:mem(0x146,FIELD_WORD) == 2 and player.keys.jump == KEYS_PRESSED then
        player.speedY = -6
    end
end

local animationPal = require("animationPal")

-- Turn the player into Mario, disable any costumes
Player.setCostume(CHARACTER_MARIO,nil,true)
player:transform(CHARACTER_MARIO)
player.powerup = PLAYER_BIG

-- Register Mario to use animationPal's player system

-- Creates the set of animations to use. The numbers represent which frames to use.

local animationSet = {
    idle = {1,3,1,2, defaultFrameX = 3, frameDelay = 20},
    walk = {1,2, defaultFrameX = 1, frameDelay = 3},
    jump = {1,2,3,4,5,5,4,3,2,1,6, defaultFrameX = 2, frameDelay = 1, loops = false},
    fall = {2, defaultFrameX = 2},
    crouch = {1,2,3,4,5, defaultFrameX = 2,frameDelay = 2,loops = false},
    endcrouch = {4,3,2,1, defaultFrameX = 2,frameDelay = 2,loops = false},
    claimleft = {1,2,3,4,5, defaultFrameX = 4, frameDelay = 3, loops = false},

    holdingIdle = {1, defaultFrameX = 3},
    holdingWalk = {2,3,4, defaultFrameX = 3,frameDelay = 6},
    holdingJump = {1, defaultFrameX = 4},
    holdingFall = {2, defaultFrameX = 4},

    duck = {1, defaultFrameX = 5},
    slide = {2, defaultFrameX = 5},
    pluck = {3,4, defaultFrameX = 5,frameDelay = 6,loops = false},

    front = {1, defaultFrameX = 6},
    back = {2, defaultFrameX = 6},

    climb = {1,2, defaultFrameX = 7,frameDelay = 8},

    skid = {1, defaultFrameX = 8},

    swimIdle = {1, defaultFrameX = 9},
    swimStroke = {2,3,3, defaultFrameX = 9,frameDelay = 4,loops = false},

    yoshi = {1, defaultFrameX = 10},
    yoshiDuck = {2, defaultFrameX = 10},
}

local function getWalkAnimationSpeed(p)
    return math.max(0.35,math.abs(p.speedX)/Defines.player_walkspeed)
end
anime = "S"
test = 2
local function findAnimation(p,animator)
    anime = animator

    if rotateMode then
        return "yoshi"
    end

    if p.mount == MOUNT_YOSHI then
        -- Yoshi
        if p:mem(0x12E,FIELD_BOOL) then -- ducking
            return "yoshiDuck"
        end

        return "yoshi"
    elseif p.mount ~= MOUNT_NONE then
        -- Boot / clown car
        return "idle"
    end

    if player:mem(0x148,FIELD_BOOL) then
        return "claimleft"
    end

    -- Pipes
    if p.forcedState == FORCEDSTATE_PIPE then
        local direction = animationPal.utils.getPipeDirection(p)

        if direction == 2 or direction == 4 then
            -- Sideways pipe
			return "walk",0.5
        else
            -- Vertical pipe
            return "front"
		end
    end

    -- Doors
    if p.forcedState == FORCEDSTATE_DOOR then
        return "back"
    end

    -- Other forced states
    if p.forcedState ~= FORCEDSTATE_NONE then
        return "idle"
    end


    -- Climbing
    if p.climbing then
        local speedX,speedY = animationPal.utils.getClimbingSpeed(p)

        if speedX ~= 0 or speedY < -0.1 then
            return "climb",1
        else
            return "climb",0
        end
    end

    -- Holding something
    if p.holdingNPC ~= nil then
        if not animationPal.utils.isOnGroundAnimation(p) then -- in the air/swimming
            if p.speedY < 0 then -- rising
                return "holdingJump"
            else -- falling
                return "holdingFall"
            end
        end

        -- Walking
        if p.speedX ~= 0 and not animationPal.utils.isSlidingOnIce(p) then
            return "holdingWalk",getWalkAnimationSpeed(p)
        end

        return "holdingIdle"
    end


    -- Spin jumping
    if p:mem(0x50,FIELD_BOOL) or p:mem(0x4A,FIELD_BOOL) then
        if p:mem(0x52,FIELD_WORD) < 3 then
            return "idle"
        elseif p:mem(0x52,FIELD_WORD) < 6 then
            return "back"
        elseif p:mem(0x52,FIELD_WORD) < 9 then
            return "idle"
        else
            return "front"
        end
    end


    if p:mem(0x26,FIELD_WORD) > 0 then -- plucking something from the ground
        return "pluck"
    elseif p:mem(0x12E,FIELD_BOOL) then -- ducking
        return "crouch"
    end


    if p:mem(0x3C,FIELD_BOOL) then -- sliding
        return "slide"
    end


    if animationPal.utils.isOnGroundAnimation(p) then
        -- GROUNDED ANIMATIONS --

        -- Skidding
        if animationPal.utils.isSkidding(p) then
            return "skid"
        end

        -- Walking
        if p.speedX ~= 0 and not animationPal.utils.isSlidingOnIce(p) then
            return "walk",getWalkAnimationSpeed(p)
        end


        return "idle"
    elseif p:mem(0x34,FIELD_WORD) > 0 and p:mem(0x06,FIELD_WORD) == 0 then
        -- WATER ANIMATIONS --

        if p:mem(0x38,FIELD_WORD) == 15 then
            return "swimStroke",1,true
        end

        if animator.currentAnimation == "swimStroke" and not animator.animationFinished then
            return "swimStroke"
        end

        return "swimIdle"
    else
        -- AIR ANIMATIONS --

        if p.speedY < 0 then -- rising
            return "jump"
        else -- falling
            return "fall"
        end
    end
end


animationPal.registerCharacter(CHARACTER_MARIO,{
    findAnimationFunc = findAnimation,
    animationSet = animationSet,

    imageDirection = DIR_RIGHT,
    frameWidth = 26,
    frameHeight = 19,
    offset = vector(0,0),
    scale = vector(2,2),

    imagePathFormat = "marioExample.png",
})
