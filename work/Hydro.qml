import QtQuick 2.0

Item {
    property int drop_width: 250
    property int drop_height: 60

    id: root
    width: 450
    height: 155

    Rectangle {
        id: rect_hydro
        anchors.fill: parent
        color: '#909090'
//        border.color: 'black'
//        border.width: 0
        radius: 5


        Text {
            x: 10
            y: 10
            text: 'Гидроиспытание'
            font.bold: false
            font.pointSize: 12
        }

        Nest {
            id: nest_hydro
            width: drop_width + 4
            height: drop_height + 4
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
        }
    }
}
