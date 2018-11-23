import QtQuick 2.0
import QtQuick.Layouts 1.0

Item {
    property int default_width: 240
    property int default_height: 50
    property bool is_selected: false
    property string type: 'ТМС-03-Б'
    property string serial: '123-4567-890AB'


    id: root
    width: default_width
    height: default_height

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
//            root.z = 10
//            root.height = is_selected ? 120 : 60;
        }
        onPressed: {
            root.z = 10;
            root.width = default_width
            root.height = default_height
            console.log('tms pressed');
        }
        onReleased: {
            if (tile.Drag.target !== null) {
                parent = tile.Drag.target;
                is_selected = false;
                root.width = parent.width - 4
                root.height = parent.height - 4
            } else {
                parent = root;
                root.width = default_width
                root.height = default_height
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
                width: parent.width - 10
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.leftMargin: 5
                rowSpacing: 0
                rows: 2
                columns: 3
                anchors.margins: 10

                Rectangle {
                    id: icon
                    width: 20
                    height: 40
                    color: 'black'
                    radius: 5
                    Layout.column: 0
                    Layout.row: 0
                    Layout.rowSpan: 2
                    Layout.fillWidth: false
                    Layout.fillHeight: false
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

/*##^## Designer {
    D{i:8;anchors_width:250}
}
 ##^##*/
