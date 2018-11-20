import QtQuick 2.0

DropArea {
    id: drag_target
    width: 256
    height: 66
    z: 0

    Rectangle {
        id: drop_rect
        color: '#2a2a2a'
        anchors.fill: parent
        radius: 5

        states: State {
            when: drag_target.containsDrag
            PropertyChanges {
                target: drop_rect
                color: "#3f3f3f"
            }
        }
    }
}
