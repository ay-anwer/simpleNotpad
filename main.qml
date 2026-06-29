import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import App.Backend 1.0                                                                                                                                          // Calling the Python module

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 600
    title: qsTr("Text Editor")

    EditorBridge {                                                                                                                                                           // Calling the binding object with Python
        id: bridge
        
        onTextLoaded: function(content) {                                                                                                            // Receiving a signal that the file was successfully opened and the text was read
            gui.textArea.text = content
        }
    }

    Gui {                                                                                                                                                                              // Calling the design file
        id: gui
        anchors.fill: parent
    }

    FileDialog {                                                                                                                                                                // File selection window to open
        id: openDialog
        title: "Open File"
        fileMode: FileDialog.OpenFile
        onAccepted: {
            bridge.requestOpenFile(openDialog.selectedFile)
        }
    }

    FileDialog {                                                                                                                                                                // Save path selection window
        id: saveDialog
        title: "Save File"
        fileMode: FileDialog.SaveFile
        onAccepted: {
            bridge.requestSaveFile(saveDialog.selectedFile, gui.textArea.text)
        }
    }

                                                                                                                                                                                            // Linking the menu buttons to events
    Connections {
        target: gui.openAction
        function onTriggered() {
            openDialog.open()
        }
    }

    Connections {
        target: gui.saveAction
        function onTriggered() {
            saveDialog.open()
        }
    }

    Connections {
        target: gui.undoAction
        function onTriggered() {
            gui.textArea.undo()
        }
    }

    Connections {
        target: gui.cutAction
        function onTriggered() {
            gui.textArea.cut()
        }
    }

    Connections {
        target: gui.copyAction
        function onTriggered() {
            gui.textArea.copy()
        }
    }

    Connections {
        target: gui.pasteAction
        function onTriggered() {
            gui.textArea.paste()
        }
    }
    Connections {
        target: gui.exitAction
        function onTriggered() {
            Qt.quit()                                                                                                                                                             // This command tells the QML engine to exit the program
        }
    }

}

