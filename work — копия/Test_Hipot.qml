import QtQuick 2.6
import QtQuick.Controls 2.1

Item {
    property bool is_connected: false
    property bool is_active: false

    id: root
    width:250
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

        Text { x: 73; y: 56; text: qsTr('Напряжение, В:') }
        Text { x: 106; y: 75; text: qsTr('Ток, мкА:') }
        Text { x: 8; y: 94; text: qsTr('Сопротивление изоляции, В:') }

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
