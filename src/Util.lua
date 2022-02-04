function GenerateQuads(atlas, tilewidth, tileheight)
    local sheetWidth = atlas:getWidth() / tilewidth
    local sheetHeight = atlas:getHeight() / tileheight

    local sheetCounter = 1
    local spritesheet = {}

    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do
            spritesheet[sheetCounter] =
                love.graphics.newQuad(x * tilewidth, y * tileheight, tilewidth,
                tileheight, atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end
    end

    return spritesheet
end

function rotateAround(pointToRotate, centerPoint, angleInDegrees)

    local angleInRadians = angleInDegrees * (math.pi / 180)
    local cosTheta = math.cos(angleInRadians)
    local sinTheta = math.sin(angleInRadians)
    return (cosTheta * (pointToRotate.X - centerPoint.X) -
            sinTheta * (pointToRotate.Y - centerPoint.Y) + centerPoint.X),
            (sinTheta * (pointToRotate.X - centerPoint.X) +
            cosTheta * (pointToRotate.Y - centerPoint.Y) + centerPoint.Y)

end