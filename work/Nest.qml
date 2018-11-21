import QtQuick 2.0

DropArea {
    id: drop_area
    width: 260
    height: 60

    Rectangle {
        id: drop_rect
        anchors.fill: parent
        radius: 5
        color: '#555555'
        border.color: '#000000'
        border.width: 1
    }

    states: State {
        when: drop_area.containsDrag
        PropertyChanges {
            target: drop_rect
            color: '#444444'
            border.width: 3
        }
    }
}
