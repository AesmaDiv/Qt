import QtQuick 2.0
import QtQuick.Layouts 1.0

Item {
    property string type: 'ТМС-03-Б'
    property string serial: '132-3456-В4'

    id: root
    width: 250
    height: 60


    MouseArea {
        id: mouse_area
        width: root.width
        height: root.height
        anchors.centerIn: parent
        drag.target: tile

        onReleased: { parent = tile.Drag.target !== null ? tile.Drag.target : root }

        Rectangle {
            id: tile
            width: root.width
            height: root.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#0a0a0a"
                }
                GradientStop {
                    position: 0.5
                    color: "#a0a0a0"
                }
            }
            radius: 5
            Drag.active: mouse_area.drag.active
            Drag.hotSpot.x: 125
            Drag.hotSpot.y: 30

            GridLayout {
                width: root.width
                height: root.height
                rowSpacing: 0
                rows: 2
                columns: 3
                anchors.fill: parent
                anchors.margins: 10

                Rectangle {
                    id: icon
                    width: 40
                    height: 40
                    color: 'black'
                    radius: 5
                    Layout.column: 0
                    Layout.row: 0
                    Layout.rowSpan: 2
                }
                Text {
                    text: 'Тип: '
                    Layout.column: 1
                    Layout.row: 0
                    Layout.fillWidth: false
                    Layout.fillHeight: false
                }
                Text {
                    text: 'Заводской номер: '
                    Layout.column: 1
                    Layout.row: 1
                    Layout.fillWidth: false
                    Layout.fillHeight: false
                }
                Text {
                    id: txtType
                    text: root.type
                    Layout.column: 2
                    Layout.row: 0
                    Layout.fillWidth: true
                    Layout.fillHeight: false
                }
                Text {
                    id: txtSerial
                    text: root.serial
                    Layout.column: 2
                    Layout.row: 1
                    Layout.fillWidth: true
                    Layout.fillHeight: false
                }
            }

            states: State {
                when: mouse_area.drag.active
                PropertyChanges {
                    target: tile
                    parent: root
                }
                AnchorChanges {
                    target: tile
                    anchors.verticalCenter: undefined
                    anchors.horizontalCenter: undefined
                }
            }
        }
    }
}
