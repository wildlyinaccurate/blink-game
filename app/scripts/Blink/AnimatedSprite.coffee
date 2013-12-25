class AnimatedSprite extends NamedDisplayObjectContainer
  active: null

  addNamedChild: (child, name) ->
    child.visible = false

    super(child, name)

  setActive: (name) ->
    @active.visible = false if @active isnt null

    child = @getNamedChild(name)
    child.visible = true
    @active = child
