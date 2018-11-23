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
    height: 210
    Rectangle {
            id: rect_vibr
            x:0; y: 0;
            width: root.width
            height: root.height
            color: '#909090'
            radius: 5

            Nest {
                id: nest_vibro
                width: root.drop_width + 4
                height: root.drop_height + 4
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
            }

            Hipot {
                id: test_Hipot
                x: 694
                width: 280
                height: 180
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
                anchors.right: parent.right
                anchors.rightMargin: 8
            }

            Vibro {
                id: test_vibro
                width: 320
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
                anchors.right: test_Hipot.left
                anchors.rightMargin: 8
            }

            Pressure {

            }


    }

}

