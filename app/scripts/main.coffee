STAGE_WIDTH = document.body.clientWidth
STAGE_HEIGHT = document.body.clientHeight

renderer = PIXI.autoDetectRenderer(STAGE_WIDTH, STAGE_HEIGHT)
loader = new PIXI.AssetLoader(['images/sanji.json'])

stage = new PIXI.Stage(0xFFFFFF)

document.body.appendChild(renderer.view)

animate = ->
  kd.tick()

  requestAnimFrame(animate)
  renderer.render(stage)

loader.onComplete = ->
  textures = []

  textures.push(PIXI.Texture.fromFrame("sanji-standing-right-#{i}.png")) for i in [1..2]

  sanji = new PIXI.MovieClip(textures)
  sanji.animationSpeed = 0.03
  sanji.position.x = STAGE_WIDTH / 2
  sanji.position.y = 100
  sanji.anchor.x = 0.5
  sanji.anchor.y = 0.5

  sanji.play()

  stage.addChild(sanji)

  requestAnimFrame(animate)

loader.load()
