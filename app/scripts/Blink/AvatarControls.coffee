class AvatarControls
  constructor: (@avatar) ->
    kd.UP.down(@moveUp)
    kd.DOWN.down(@moveDown)
    kd.LEFT.down(@moveLeft)
    kd.RIGHT.down(@moveRight)

  move: (byX, byY) =>
    sprite = @avatar.sprite

    Coordinates::ddOffset(sprite.location, byX, byY)

    point = Coordinates::ddToAvatar(sprite.location.x, sprite.location.y)

    sprite.position.x = point.x
    sprite.position.y = point.y

  moveUp: =>
    @move(0, @avatar.MOVE_SPEED)

  moveDown: =>
    @move(0, -@avatar.MOVE_SPEED)

  moveLeft: =>
    @move(@avatar.MOVE_SPEED, 0)

  moveRight: =>
    @move(-@avatar.MOVE_SPEED, 0)
