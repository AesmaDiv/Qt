import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Rectangle {
        width: 256
        color: '#101010'
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        Column {
            id: colB
            spacing: 10

            Repeater {
                model: 5
                delegate: DropTile {}
            }
        }
    }
    Rectangle {
        width: 250
        color: '#202020'
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        Column {
            id: colA
            spacing: 10

            Repeater {
                model: 5
                delegate: DragTile {}
            }
        }
    }
}
