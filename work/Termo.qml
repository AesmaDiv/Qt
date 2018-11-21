import QtQuick 2.0

Item {
    property int drop_width: 250

    id: root
    width: 700
    height: 355
    Rectangle {
        id: rect_termo
        anchors.fill: parent
        color: '#909090'
//        border.color: 'black'
//        border.width: 0
        radius: 5
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0


        Text {
            x: 10
            y: 10
            text: 'Термошкаф'
            font.bold: false
            font.pointSize: 12
        }

        Nest {
            id: nest_termo_0
            width: drop_width + 10
            height: 70
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            anchors.left: parent.left
            anchors.leftMargin: 5

        }

        Nest {
            id: nest_termo_1
            width: drop_width + 10
            height: 70
            anchors.left: parent.left
            anchors.leftMargin: drop_width + 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            y: 70
        }
        Nest {
            id: nest_termo_2
            width: drop_width + 10
            height: 70
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5

        }
        Nest {
            id: nest_termo_3
            width: drop_width + 10
            height: 70
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: drop_width + 20

        }
    }

}
