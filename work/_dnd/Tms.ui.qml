import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1

Item {
    id: tms_main
    property string name: 'new'
    property string type: 'none'
    property string serial: '000-0000000'
    property color colorCode: 'red'
    width: 300
    height: 50
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        drag.target: tile

        onReleased: parent = tile.Drag.target !== null ? tile.Drag.target : root
    }

    Rectangle {
        id: tile
        anchors.fill: parent
        color: colorCode
        Drag.active: mouseArea.drag.active
        Drag.keys: [colorCode]
        Drag.hotSpot: 10
        Drag.hotSpot: 10

        Rectangle {
            id: icon
            width: 40
            height: 40
            color: black
            anchors.verticalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
        }

        GridLayout {
            id: grid
            rows: 2
            columns: 2
            height: 40
            anchors.rightMargin: 5
            anchors.bottomMargin: 5
            anchors.topMargin: 5
            anchors.left: icon.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.leftMargin: 5

            Text {
                Layout.column: 0
                Layout.row: 0
                Layout.fillWidth: false
                Layout.fillHeight: false
                text: qsTr("Тип: ")
                font.pixelSize: 12
            }
            Text {
                Layout.column: 0
                Layout.row: 1
                Layout.fillWidth: false
                Layout.fillHeight: false
                text: qsTr("Серийный номер: ")
                font.pixelSize: 12
            }

            TextEdit {
                id: txt_type
                Layout.row: 0
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: false
                text: tms_main.type
            }
            TextEdit {
                id: txt_serial
                Layout.row: 1
                Layout.column: 1
                Layout.fillWidth: true
                Layout.fillHeight: false
                text: tms_main.serial
                mouseSelectionMode: TextEdit.SelectCharacters
                cursorVisible: true
                selectByMouse: true
            }
        }
    }


}
