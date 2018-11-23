import QtQuick 2.0
import QtQuick.Layouts 1.0

Item {
    property bool is_selected: false
    property string type: 'ТМС-03-Б'
    property string serial: '132-3456-В4'

    id: root
    width: 260
    height: 60

    states: State {
        when: is_selected
        PropertyChanges {
            target: tile
            border.width: 3
            border.color: '#f0f0f0'
        }
    }

    MouseArea {
        id: mouse_area
        width: root.width
        height: root.height
        anchors.centerIn: parent
        drag.target: tile

        onDoubleClicked:  {
            is_selected = !is_selected;
            //root.z = 10
//            root.height = is_selected ? 120 : 60;
        }
        onPressed: {
            root.z = 10;
            console.log('tms pressed');
        }
        onReleased: {
            if (tile.Drag.target !== null) {
                parent = tile.Drag.target;
                is_selected = false;
            } else {
                parent = root;
            }
        }

        Rectangle {
            id: tile
            width: root.width
            height: root.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            border.width: 1
            border.color: '#000000'
            color: '#909090'
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
