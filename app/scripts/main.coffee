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

createMovieClip = (clipName, frames, animationSpeed) ->
  textures = []
  textures.push(PIXI.Texture.fromFrame("#{clipName}-#{i}.png")) for i in [1..frames]

  clip = new PIXI.MovieClip(textures)
  clip.position.x = STAGE_WIDTH / 2
  clip.position.y = 100
  clip.anchor.x = 0.5
  clip.anchor.y = 0.5
  clip.animationSpeed = animationSpeed

  clip

sanji = new AnimatedSprite()

loader.onComplete = ->
  sanji.addNamedChild(
    createMovieClip('sanji-standing-right', 4, 0.1),
    'idleRight'
  )

  sanji.addNamedChild(
    createMovieClip('sanji-standing-left', 4, 0.1),
    'idleLeft'
  )

  sanji.addNamedChild(
    createMovieClip('sanji-running-right', 8, 0.22),
    'runningRight'
  )

  sanji.addNamedChild(
    createMovieClip('sanji-running-left', 8, 0.22),
    'runningLeft'
  )

  sanji.setActive('idleRight')
  stage.addChild(sanji)

  requestAnimFrame(animate)

loader.load()

# Keep track of whether the character is moving to prevent weird behaviour
# when pressing keys rapidly
activeKey = null

kd.RIGHT.press ->
  activeKey = kd.RIGHT
  sanji.setActive('runningRight')

kd.RIGHT.up ->
  sanji.setActive('idleRight') if activeKey is kd.RIGHT

kd.LEFT.press ->
  activeKey = kd.LEFT
  sanji.setActive('runningLeft')

kd.LEFT.up ->
  sanji.setActive('idleLeft') if activeKey is kd.LEFT
