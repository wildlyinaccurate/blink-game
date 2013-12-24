STAGE_WIDTH = document.body.clientWidth
STAGE_HEIGHT = document.body.clientHeight

SKEW_X_OFFSET = (STAGE_WIDTH / 2) - Tile::WIDTH
SKEW_Y_OFFSET = Tile::HEIGHT * 2

renderer = PIXI.autoDetectRenderer(STAGE_WIDTH, STAGE_HEIGHT)
graphics = new PIXI.Graphics()
loader = new PIXI.AssetLoader([Avatar::SPRITE_JSON_PATH])

stage = new PIXI.Stage(0xFFFFFF)
stage.addChild(graphics)

animate = ->
  kd.tick()

  requestAnimFrame(animate)
  renderer.render(stage)

loader.onComplete = ->
  requestAnimFrame(animate)

  document.body.appendChild(renderer.view)

  E = EMPTY = new Tile(0xFFFFFF, 0xFFFFFF)
  G = GRASS = new Tile(0x80CF5A, 0x339900)
  D = DIRT = new Tile(0x96712F, 0x403014)
  W = WATER = new Tile(0x85b9bb, 0x476263)

  terrain = [
    [G, G, G, W, G],
    [G, G, G, W, G],
    [G, G, G, W, G],
    [G, W, W, W, G],
    [G, W, G, G, G],
    [W, W, G, G, G],
  ]

  map = new Map(graphics, terrain)
  map.draw(STAGE_WIDTH / 2)

  avatar = new Avatar()
  avatar.setLocation(0, 0)

  controls = new AvatarControls(avatar)

  stage.addChild(avatar.getSprite())

loader.load()
