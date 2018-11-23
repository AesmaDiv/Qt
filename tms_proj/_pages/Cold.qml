import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import "../_dnd"
import "../_tests"

Item {
    property int drop_width: 250
    property int drop_height: 60

    id: root
    width: 980
    height: 280
    Rectangle {
            id: rect_vibr
            x:0; y: 0;
            width: root.width
            height: root.height
            color: '#909090'
            radius: 5

            Nest {
                id: nest_vibro
                width: root.drop_width + 5
                height: root.drop_height + 5
                anchors.top: test_cold_hipot.bottom
                anchors.topMargin: 8
                anchors.left: parent.left
                anchors.leftMargin: 8
            }

            Pressure {
                id: test_cold_pressure
                x: 295
                y: 8
                width: 275
                height: 264

            }

            Vibro {
                id: test_cold_vibro
                x: 652
                y: 8
                width: 320
                height: 195
            }

            Hipot {
                id: test_cold_hipot
                width: 255
                height: 195
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.top: parent.top
                anchors.topMargin: 8
            }






    }

}


/*##^## Designer {
    D{i:21;anchors_y:209}D{i:20;anchors_height:230;anchors_x:8}
}
 ##^##*/
