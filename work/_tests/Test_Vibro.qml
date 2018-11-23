import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    property bool is_connected: false
    property bool is_active: false
    property int cell_width: 100
    property int cell_height: 28

    id: root
    width: 321
    height: 180

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

        Grid {
            id: grid
            anchors.bottom: row_buttons.top
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 5
            spacing: 3
            rows: 4
            columns: 3


            Rectangle {
                width: root.cell_width
                height: root.cell_height
                Layout.column: 0
                Layout.row: 0
                Layout.fillWidth: false
                Layout.fillHeight: false
                color: '#707070'
                border.color: '#000000'
                border.width: 1
            }
            Rectangle {
                width: root.cell_width
                height: root.cell_height
                Layout.column: 1
                Layout.row: 0
                Layout.fillWidth: false
                Layout.fillHeight: false
                color: '#707070'
                border.color: '#000000'
                border.width: 1

                RadioButton {
                    text: qsTr("ось X")
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: root.cell_width
                height: root.cell_height
                Layout.column: 2
                Layout.row: 0
                Layout.fillWidth: false
                Layout.fillHeight: false
                color: '#707070'
                border.color: '#000000'
                border.width: 1

                Text {
                    text: qsTr("ось Y")
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                width: root.cell_width
                height: root.cell_height
                Layout.column: 0
                Layout.row: 1
                Layout.fillWidth: false
                Layout.fillHeight: false
                color: '#707070'
                border.color: '#000000'
                border.width: 1

                Text {
                    text: qsTr("Стенд")
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: root.cell_width
                height: root.cell_height
                Layout.column: 1
                Layout.row: 1
                Layout.fillWidth: false
                Layout.fillHeight: false
                color: '#707070'
                border.color: '#000000'
                border.width: 1

                Text {
                    text: qsTr("-.-")
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: root.cell_width
                height: root.cell_height
                Layout.column: 2
                Layout.row: 1
                Layout.fillWidth: false
                Layout.fillHeight: false
                color: '#707070'
                border.color: '#000000'
                border.width: 1

                Text {
                    text: qsTr("-.-")
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                width: root.cell_width
                height: root.cell_height
                Layout.column: 0
                Layout.row: 2
                Layout.fillWidth: false
                Layout.fillHeight: false
                color: '#707070'
                border.color: '#000000'
                border.width: 1

                Text {
                    text: qsTr("ТМС")
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: root.cell_width
                height: root.cell_height
                Layout.column: 1
                Layout.row: 2
                Layout.fillWidth: false
                Layout.fillHeight: false
                color: '#707070'
                border.color: '#000000'
                border.width: 1

                Text {
                    text: qsTr("-.-")
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: root.cell_width
                height: root.cell_height
                Layout.column: 2
                Layout.row: 2
                Layout.fillWidth: false
                Layout.fillHeight: false
                color: '#707070'
                border.color: '#000000'
                border.width: 1

                Text {
                    text: qsTr("-.-")
                    anchors.centerIn: parent
                }
            }
        }

        Row {
            id: row_buttons
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            spacing: 4
            Button {
                id: btn_me
                text: qsTr("замерить")
                checkable: true
                width: root.cell_width
                height: 20
            }
            Button {
                text: qsTr("замерить")
                checkable: true
                width: root.cell_width - 1
                height: 20
            }
        }

        RadioButton {
            id: radioButton
            x: 166
            y: 16
            height: 20
            text: qsTr("Radio Button")
            clip: false
            indicator: Rectangle { width: 18; height: 18; radius: 18 }
        }


    }
}
