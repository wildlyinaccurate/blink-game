WIDTH = document.body.clientWidth
HEIGHT = document.body.clientHeight

renderer = PIXI.autoDetectRenderer(WIDTH, HEIGHT)
graphics = new PIXI.Graphics()

stage = new PIXI.Stage(0xFFFFFF)
stage.addChild(graphics)

document.body.appendChild(renderer.view)

E = EMPTY = () ->
G = GRASS = new Tile(0x80CF5A, 0x339900)
D = DIRT = new Tile(0x96712F, 0x403014)
W = WATER = new Tile(0x85b9bb, 0x476263)

terrain = [
  [D, D, D, W, G],
  [D, D, G, W, G],
  [G, G, G, W, G],
  [G, W, W, W, G],
  [G, W, D, D, G],
  [W, W, D, D, D],
]

map = new Map(graphics)
map.draw(terrain, WIDTH / 2)

animate = ->
  renderer.render(stage)

requestAnimFrame(animate)
