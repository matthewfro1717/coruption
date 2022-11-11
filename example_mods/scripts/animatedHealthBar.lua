function onCreatePost()
    if hideHud then
        close()
    end
    addLuaSprite('healthBarWithAnim', true)
    makeAnimatedLuaSprite('healthBarWithAnim', 'healthBarAnimated', 340, 640)
    addAnimationByPrefix('healthBarWithAnim', 'healthBarAnimated', 'Health Bar Animated', 24, true)

    if downscroll then
        setProperty('healthBarWithAnim.y', 80)
    end

    setObjectCamera('healthBarWithAnim', 'camHUD')
    setProperty('healthBarBG.visible', false)
    setObjectOrder('healthBarWithAnim', getObjectOrder('healthBar') + 1)
    setProperty('camGame.visible', true)
end
