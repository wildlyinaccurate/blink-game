class Coordinates
  # Convert 2D co-ordinates to tile co-ordinates by taking into account anchor
  # placement and thickness of tile
  ddToTile: (x, y) ->
    iso = @ddToIso(x, y)

    x: iso.x + SKEW_X_OFFSET + Tile::WIDTH
    y: iso.y + SKEW_Y_OFFSET - Tile::WIDTH - Tile::THICKNESS

  # Offset a 2D point, keeping the point within the boundaries of the map
  ddOffset: (point, byX, byY) ->
    point.x = Math.max(0, Math.min(point.x + byX, Map::WIDTH))
    point.y = Math.max(0, Math.min(point.y + byY, Map::HEIGHT))

  # Take avatar's depth into account
  ddToAvatar: (x, y) ->
    x = Math.min(Map::WIDTH - 10, Math.max(0, x))
    y = Math.min(Map::HEIGHT - 10, Math.max(0, y))

    tile = @ddToTile(x, y)

    x: tile.x - Avatar::WIDTH / 2
    y: tile.y + Avatar::HEIGHT

  # Converts 2D co-ordinates to isometric
  ddToIso: (x, y) ->
    x: x - y
    y: (x + y) / 2
