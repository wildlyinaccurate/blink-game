class AnimatedSprite extends NamedDisplayObjectContainer
  active: null

  addNamedChild: (child, name) ->
    child.visible = false

    super(child, name)

  setActive: (name, restart = true) ->
    if @active isnt null
      @active.visible = false
      @active.stop()

    child = @getNamedChild(name)
    child.visible = true
    @active = child

    if restart then child.gotoAndPlay(0) else child.play()
