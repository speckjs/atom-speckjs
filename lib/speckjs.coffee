{allowUnsafeEval} = require 'loophole'
speckjs = allowUnsafeEval -> require 'speckjs'

{CompositeDisposable} = require 'atom'

supportedFWS =
  tape: true
  jasmine: true

module.exports = Speckjs =
  config:
    testFramework:
      type: 'string'
      default: 'tape'
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

    editor = atom.workspace.getActivePaneItem()
    file = editor?.buffer.file

    file.read().then (res) ->
      file =
        name: file.path
        content: res
      options =
        testFW: atom.config.get('speckjs.testFramework')

      if not supportedFWS[options.testFW]
        atom.notifications.addError(options.testFW + " not supported")
      else
        build = speckjs.build(file, options)
        atom.workspace.open()
        .then (editor) ->
          editor.setGrammar( atom.grammars.grammarForScopeName('source.js') )
          editor.setText(build)
          atom.notifications.addSuccess("Boom! Your " + options.testFW + " spec file is ready")
