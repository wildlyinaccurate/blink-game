class Map
  constructor: (@graphics) ->

  draw: (terrain, xOffset) ->
    i = 0
    tL = terrain.length

    while i < tL
      j = 0
      row = terrain[i]
      rL = row.length

      while j < rL
        tile = row[j]

        # Cartesian 2D co-ordinate
        x = j * tile.WIDTH
        y = i * tile.HEIGHT

        # Isometric co-ordinate
        isoX = x - y
        isoY = (x + y) / 2

        tile.render(@graphics, xOffset + isoX, isoY)

        j++

      i++
