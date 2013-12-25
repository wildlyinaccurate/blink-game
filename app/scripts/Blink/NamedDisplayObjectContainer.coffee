class NamedDisplayObjectContainer extends PIXI.DisplayObjectContainer
  namedChildIndex: {}

  addNamedChild: (child, name) ->
    @addChild(child)
    @namedChildIndex[name] = @children.length - 1

  getNamedChild: (name) ->
    @getChildAt(@namedChildIndex[name])
