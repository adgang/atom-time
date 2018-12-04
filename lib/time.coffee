DateFormatter = require './dateformat.js'
{CompositeDisposable} = require 'atom'

module.exports = Time =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-text-editor', 'time:insert': (event) ->
      if editor = atom.workspace.getActiveTextEditor()
        format = atom.config.get('insert-time.format')
        editor.insertText(DateFormatter(new Date(Date.now()), format))


  deactivate: ->
    @subscriptions.dispose()

  config: {
		format: {
			type: 'string',
			default: 'yyyy-MM-dd HH:mm:ss'
		}
  }
