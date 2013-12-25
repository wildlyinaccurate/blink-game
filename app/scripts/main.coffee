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

createMovieClip = (textures) ->
  clip = new PIXI.MovieClip(textures)
  clip.animationSpeed = 0.03
  clip.position.x = STAGE_WIDTH / 2
  clip.position.y = 100
  clip.anchor.x = 0.5
  clip.anchor.y = 0.5
  clip.play()

  clip

sanji = new AnimatedSprite()

loader.onComplete = ->
  idleTextures = []
  idleTextures.push(PIXI.Texture.fromFrame("sanji-standing-right-#{i}.png")) for i in [1..2]
  idleClip = createMovieClip(idleTextures)
  sanji.addNamedChild(idleClip, 'idleRight')

  runningRightTextures = []
  runningRightTextures.push(PIXI.Texture.fromFrame("sanji-running-right-#{i}.png")) for i in [1..1]
  sanji.addNamedChild(createMovieClip(runningRightTextures), 'runningRight')

  sanji.setActive('idleRight')
  stage.addChild(sanji)

  requestAnimFrame(animate)

loader.load()

kd.RIGHT.down ->
  sanji.setActive('runningRight')

kd.RIGHT.up ->
  sanji.setActive('idleRight')
