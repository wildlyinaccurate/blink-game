class Map
  WIDTH: 0
  HEIGHT: 0

  constructor: (@graphics, @terrain) ->
    Map::WIDTH = @terrain[0].length * Tile::WIDTH
    Map::HEIGHT = @terrain.length * Tile::HEIGHT

  draw: (xOffset) ->
    i = 0
    tL = @terrain.length

    while i < tL
      j = 0
      row = @terrain[i]
      rL = row.length

      while j < rL
        tile = row[j]

        # Cartesian 2D co-ordinate
        x = j * tile.WIDTH
        y = i * tile.HEIGHT

        # Isometric co-ordinate
        iso = Coordinates::ddToIso(x, y)

        tile.render(@graphics, xOffset + iso.x, iso.y)

        j++

      i++
