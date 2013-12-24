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
    @move(-@avatar.MOVE_SPEED, -@avatar.MOVE_SPEED)

  moveDown: =>
    @move(@avatar.MOVE_SPEED, @avatar.MOVE_SPEED)

  moveLeft: =>
    @move(-@avatar.MOVE_SPEED, @avatar.MOVE_SPEED)

  moveRight: =>
    @move(@avatar.MOVE_SPEED, -@avatar.MOVE_SPEED)
