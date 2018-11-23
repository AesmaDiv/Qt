import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0

Item {
    property bool is_connected: false
    property bool is_active: false
    property real hipot_u: 5012.31
    property real hipot_i: 2.6778
    property real hipot_r: calculare_r()

    function calculare_r(){ return (hipot_u / hipot_i).toFixed(2) }

    id: root
    width: 320
    height: 180

    onIs_connectedChanged: { console.log('Is connected = ' + is_connected) }
    onIs_activeChanged: { console.log('Is active = ' + is_active) }

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: 'grey'
        border.color: 'black'
        border.width: 1
        radius: 5

        Column {
            id: col_labels
            anchors.verticalCenterOffset: -10
            anchors.right: col_values.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            spacing: 5

            Text { text: qsTr('Напряжение, В:'); font.pointSize: 9; anchors.right: parent.right; }
            Text { text: qsTr('Ток, мкА:'); font.pointSize: 9; anchors.right: parent.right; }
            Text { text: qsTr('Сопротивление изоляции, МОм:'); font.pointSize: 9; anchors.right: parent.right; }
        }
        Column {
            id: col_values
            height: 52
            anchors.verticalCenterOffset: -10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            spacing: 5

            Text { id: txt_u; text: root.hipot_u; font.pointSize: 9 }
            Text { id: txt_i; text: root.hipot_i; font.pointSize: 9 }
            Text { id: txt_r; text: root.hipot_r; font.pointSize: 9 }
        }
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

        Column {
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            spacing: 3
            Button {
                id: btn_start
                width: parent.width
                height: 20
                text: checked == false ? qsTr('Замерить') : qsTr('Остановить')
                checkable: true
                checked: root.is_active
            }
            Button {
                id: btn_save
                width: parent.width
                height: 20
                enabled: !btn_start.checked
                text: qsTr('Сохранить')
            }
        }
    }
}
