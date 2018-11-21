import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    property int drop_width: 250
    property int drop_height: 60

    width: 980
    height: 155
    Rectangle {
        id: rect_vibr
        anchors.fill: parent
        color: '#909090'
        radius: 5

        Text {
            x: 10
            y: 10
            text: 'Вибростол'
            font.bold: false
            font.pointSize: 12
        }

        Nest {
            id: nest_vibro
            width: drop_width + 4
            height: drop_height + 4
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
        }

        GridLayout {
            property int cell_width: 100
            property int cell_height: 30

            id: grid
            x: 326
            y: 10
            width: 321
            height: 140


            Rectangle {
                width: grid.cell_width
                height: grid.cell_height
                Layout.column: 0
                Layout.row: 0
                Layout.fillWidth: false
                Layout.fillHeight: false
                color: '#707070'
                border.color: '#000000'
                border.width: 1
            }
            Rectangle {
                width: grid.cell_width
                height: grid.cell_height
                Layout.column: 1
                Layout.row: 0
                Layout.fillWidth: false
                Layout.fillHeight: false
                color: '#707070'
                border.color: '#000000'
                border.width: 1

                Text {
                    text: qsTr("ось X")
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: grid.cell_width
                height: grid.cell_height
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
                width: grid.cell_width
                height: grid.cell_height
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
                width: grid.cell_width
                height: grid.cell_height
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
                width: grid.cell_width
                height: grid.cell_height
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
                width: grid.cell_width
                height: grid.cell_height
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
                width: grid.cell_width
                height: grid.cell_height
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
                width: grid.cell_width
                height: grid.cell_height
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

            Rectangle {
                width: grid.cell_width
                height: grid.cell_height
                Layout.column: 1
                Layout.row: 3
                Layout.fillWidth: false
                Layout.fillHeight: false
                border.color: '#000000'
                border.width: 1

                Button {
                    text: qsTr("замерить")
                    anchors.fill: parent
                }
            }
            Rectangle {
                width: grid.cell_width
                height: grid.cell_height
                Layout.column: 2
                Layout.row: 3
                Layout.fillWidth: false
                Layout.fillHeight: false
                border.color: '#000000'
                border.width: 1

                Button {
                    text: qsTr("замерить")
                    anchors.fill: parent
                }
            }


        }

    }

}
