import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

Item {
    property bool is_connected: false
    property bool is_active: false
    property int cell_width: 100
    property int cell_height: 28

    id: root
    width: 320
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
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.bottom: row_buttons.top
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 5
            spacing: 3
            rows: 4
            columns: 2
            columnSpacing: 7


            Rectangle {
                width: root.cell_width
                height: root.cell_height
                color: '#707070'
                border.color: '#000000'
                border.width: 1
            }
            Rectangle {
                id: rectangle1
                width: root.cell_width * 2 + 3
                height: root.cell_height
                color: '#707070'
                border.color: '#000000'
                border.width: 1
                GridLayout {
                    id: row
                    anchors.topMargin: -2
                    columnSpacing: 0
                    rowSpacing: 0
                    columns: 2
                    anchors.fill: parent

                    XRadio{
                        id: rb_vibr_x
                        width: 100
                        height: 18
                        text: qsTr('ось X')
                        font.pointSize: 12
                        checked: true
                        Layout.fillWidth: true
                        Layout.leftMargin: 20
                    }
                    XRadio {
                        id: rb_vibr_y
                        width: 100
                        height: 28
                        text: qsTr('ось Y')
                        font.pointSize: 12
                        checked: false
                        Layout.fillWidth: true
                    }
                }
            }

            Rectangle {
                width: root.cell_width
                height: root.cell_height
                color: '#707070'
                border.color: '#000000'
                border.width: 1

                Text {
                    text: qsTr("Образец")
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: root.cell_width * 2 + 3
                height: root.cell_height
                color: 'transparent'

                Row {
                    spacing: 3
                    Rectangle {
                        width: root.cell_width
                        height: root.cell_height
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

            Rectangle {
                width: root.cell_width
                height: root.cell_height
                color: '#707070'
                border.color: '#000000'
                border.width: 1

                Text {
                    text: qsTr("ТМС")
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: root.cell_width * 2 + 3
                height: root.cell_height
                color: 'transparent'

                Row {
                    spacing: 3
                    Rectangle {
                        width: root.cell_width
                        height: root.cell_height
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
        }

        Column {
            id: row_buttons
            width: grid.width
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
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



    }
}
