import QtQuick 2.0
import QtQuick.Controls 2.0

RadioButton {
    property int icon_size: 16

    id: root
    width: 100
    height: 20
    clip: true
    checked: true
    text: qsTr("text")
    autoExclusive: true
    indicator: Rectangle {
        id: nest
        width: root.icon_size
        height: root.icon_size
        radius: width / 2
        anchors.left: parent.left
        anchors.leftMargin: (root.height - root.icon_size) / 2
        anchors.verticalCenter: parent.verticalCenter
        border.color: root.down ? "#151515" : "#303030"

        Rectangle {
            width: nest.width - 4
            height: width
            radius: width / 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            border.color: root.down ? "#151515" : "#303030"
            visible: root.checked
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#999999"
                }

                GradientStop {
                    position: 1
                    color: "#000000"
                }
            }
        }

    }
    contentItem: Text {
        text: root.text
        width: root.width - nest.width
        anchors.left: nest.right
        anchors.leftMargin: 3
        font: root.font
        opacity: enabled ? 1.0 : 0.3
            color: root.down ? "#151515" : "#303030"
            verticalAlignment: Text.AlignVCenter
        }
}
