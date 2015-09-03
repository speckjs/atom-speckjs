module.exports = {
  activate: function() {
    atom.workspaceView.command(function(){}, this.buildSpecs);
  },

  buildSpecs: function() {
    // var editor = atom.workspace.activePaneItem;
    // var selection = editor.getSelection();
    // var text = selection.getText();
    // var options;
    //
    // var speckjs = require('speckjs');
   }
 };
