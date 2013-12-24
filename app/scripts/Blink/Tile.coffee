class Tile
  WIDTH: 60
  HEIGHT: 60
  HEIGHT_2: Tile::HEIGHT / 2

  constructor: (@backgroundColor, @borderColor) ->

  render: (graphics, x, y) ->
    graphics.beginFill(@backgroundColor)
    graphics.lineStyle(1, @borderColor, 1)
    graphics.moveTo(x, y)
    graphics.lineTo(x + @WIDTH, y + @HEIGHT_2)
    graphics.lineTo(x, y + @HEIGHT)
    graphics.lineTo(x - @WIDTH, y + @HEIGHT_2)
    graphics.lineTo(x, y)
    graphics.endFill()
