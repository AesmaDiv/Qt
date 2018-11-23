import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    property int drop_width: 250
    property int drop_height: 60

    width: 980
    height: 190
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
            anchors.top: parent.top
            anchors.topMargin: 121
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
        }

        Test_Hipot {
            id: test_Hipot
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
        }
        Test_Vibro {
            id: test_Vibro
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: test_Hipot.left
            anchors.rightMargin: 5

        }


    }

}

/*##^## Designer {
    D{i:34;anchors_height:64}
}
 ##^##*/
