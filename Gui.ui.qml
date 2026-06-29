import QtQuick
import QtQuick.Controls

Item {
    id: root
    width: 800
    height: 600

    property alias textArea: textArea                                                                                                                      //refernces all parameters we need to send him to .qml file to start event
    property alias openAction: openAction
    property alias saveAction: saveAction
    property alias undoAction: undoAction
    property alias cutAction: cutAction
    property alias copyAction: copyAction
    property alias pasteAction: pasteAction
    property alias exitAction: exitAction

    MenuBar {
        id: menuBar
        width: parent.width
        
         Menu {
            title: qsTr("File")
            MenuItem { id: openAction; text: qsTr("Open...") }
            MenuItem { id: saveAction; text: qsTr("Save...") }
            MenuSeparator {}
            MenuItem { id: exitAction; text: qsTr("Exit") }

        }


            Menu {
                title: qsTr("Edit")
                MenuItem { id: undoAction; text: qsTr("Undo\tCtrl+Z") }
                MenuItem { id: cutAction; text: qsTr("Cut\tCtrl+X") }
                MenuItem { id: copyAction; text: qsTr("Copy\tCtrl+C") }
                MenuItem { id: pasteAction; text: qsTr("Paste\tCtrl+V") }
            }
        }

    ScrollView {
        anchors.top: menuBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        TextArea {
            id: textArea
            placeholderText: qsTr("Start Typing Here...")
            font.pixelSize: 16
            selectionColor: "yellow"
            selectedTextColor: "black"
            wrapMode: TextEdit.Wrap
        }
    }
}
