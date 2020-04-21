screenWidth, screenHeight = guiGetScreenSize()

function isCursorOnElement(posX, posY, width, height)
    if isCursorShowing() then
        local mouseX, mouseY = getCursorPosition()
        local mouseX, mouseY = mouseX * screenWidth, mouseY * screenHeight
        if mouseX > posX and mouseX < (posX + width) and mouseY > posY and mouseY < (posY + height) then
            return true
        end
    end
    return false
end