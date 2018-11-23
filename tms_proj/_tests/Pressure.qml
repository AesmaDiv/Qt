import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0
import '../_dnd'

Item {
    property bool is_connected: false
    property bool is_active: false
    property int cell_width: 100
    property int cell_height: 28

    id: root
    width: 320
    height: 260

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: 'grey'
        border.color: 'black'
        border.width: 1
        radius: 5

        Switch {
            id: switch_connect
            x: 0
            y: 5
            width: 152
            height: 30
            text: checked == false ? qsTr("Подключиться") : qsTr("Отключиться")
            checked: root.is_connected

            states: State {
                when: switch_connect.checked
                PropertyChanges { target: root; is_connected: true }
                PropertyChanges { target: busyIndicator; running: true }
            }
        }
        BusyIndicator {
            id: busyIndicator
            width: 40
            height: 40
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            running: root.is_connected

        }
        Rectangle {
            id: rectangle1
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.bottom: row_buttons.top
            anchors.top: switch_connect.bottom
            anchors.margins: 5
            color: 'transparent'
            clip: true

            GridLayout {
                property int cell_width: (parent.width - 6) / 3
                property int cell_height: 30

                id: grid
                width: parent.width
                height: 63
                anchors.verticalCenter: parent.verticalCenter
                rows: 2
                columns: 3
                columnSpacing: 3
                rowSpacing: 3

                Rectangle {
                    color: '#707070'
                    border.color: '#000000'
                    border.width: 1
                    Layout.column: 0
                    Layout.row: 0
                    width: cell_width
                    height: cell_height
                }
                Rectangle {
                    width: cell_width
                    height: cell_height
                    Layout.column: 1
                    Layout.row: 0
                    color: '#707070'
                    border.color: '#000000'
                    border.width: 1

                    Text {
                        text: qsTr("Образец")
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: cell_width
                    height: cell_height
                    Layout.column: 2
                    Layout.row: 0
                    color: '#707070'
                    border.color: '#000000'
                    border.width: 1

                    Text {
                        text: qsTr("ТМС")
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: cell_width
                    height: cell_height
                    Layout.column: 0
                    Layout.row: 1
                    color: '#707070'
                    border.color: '#000000'
                    border.width: 1

                    Text {
                        text: qsTr("Давление")
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: cell_width
                    height: cell_height
                    Layout.column: 1
                    Layout.row: 1
                    color: '#707070'
                    border.color: '#000000'
                    border.width: 1

                    Text {
                        text: qsTr("-.-")
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: cell_width
                    height: cell_height
                    Layout.column: 2
                    Layout.row: 1
                    color: '#707070'
                    border.color: '#000000'
                    border.width: 1

                    Text {
                        text: qsTr("-.-")
                        anchors.centerIn: parent
                    }
                }
            }

        }


        Column {
            id: row_buttons
            anchors.left: nest.left
            anchors.bottom: nest.top
            anchors.right: nest.right
            anchors.bottomMargin: 5
            spacing: 3
            Button {
                id: btn_read_vibr
                text: checked ? qsTr('Остановить') :qsTr('Замерить')
                checkable: true
                width: row_buttons.width
                height: 20
            }
            Button {
                id: btn_save_vibr
                text: qsTr("Сохранить")
                checked: false
                checkable: false
                width: row_buttons.width
                height: 20
                enabled: !btn_read_vibr.checked
            }
        }

        Nest {
            id: nest
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.margins: 8
        }
    }
}

/*##^## Designer {
    D{i:128;anchors_width:70}
}
 ##^##*/
