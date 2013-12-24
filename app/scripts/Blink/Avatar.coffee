class Avatar
  MOVE_SPEED: 2
  BLINK_DISTANCE: 0.2

  WIDTH: 60
  HEIGHT: 90

  X_OFFSET: Avatar::WIDTH / 2
  Y_OFFSET: Avatar::HEIGHT / 2

  TEXTURE_PATH = '/images/wizard.png'

  constructor: ->
    frame = new PIXI.Rectangle(0, 0, @WIDTH, @HEIGHT)

    @texture = new PIXI.Texture.fromImage(TEXTURE_PATH)
    @texture.setFrame(frame)
    @texture.noFrame = false

    @sprite = new PIXI.Sprite(@texture)
    @sprite.anchor.x = 0
    @sprite.anchor.y = 2.5

  setLocation: (x, y) ->
    point = Coordinates::ddToAvatar(x, y)

    @sprite.location = new PIXI.Point(x, y)
    @sprite.position.x = point.x
    @sprite.position.y = point.y

  getSprite: ->
    @sprite
