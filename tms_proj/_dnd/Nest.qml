import QtQuick 2.0

DropArea {
    property int default_width: 240
    property int default_height: 50

    id: drop_area
    width: default_width + 8
    height: default_height + 8

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
