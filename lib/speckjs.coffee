SpeckjsView = require './speckjs-view'
{CompositeDisposable} = require 'atom'

module.exports = Speckjs =
  speckjsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @speckjsView = new SpeckjsView(state.speckjsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @speckjsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'speckjs:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @speckjsView.destroy()

  serialize: ->
    speckjsViewState: @speckjsView.serialize()

  toggle: ->
    console.log 'Speckjs was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
