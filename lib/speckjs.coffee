{allowUnsafeEval} = require 'loophole'
speckjs = allowUnsafeEval -> require 'speckjs'

{CompositeDisposable} = require 'atom'

module.exports = Speckjs =
  speckjsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'speckjs:build': => @build()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  build: ->
    console.log 'Speckjs was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
