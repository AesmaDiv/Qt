import QtQuick 2.9
import QtQuick.Controls 2.0
import "_pages"
import "_dnd"

ApplicationWindow {
    id: applicationWindow
        visible: true
        flags: Qt.FramelessWindowHint
        width: 1280
        height: 1000
        color: 'black'
        title: qsTr("Hello World")
        property int item_width: 240
        property int item_height: 50

        header: Rectangle {
            id: rect_header
            height: 70
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            color: white

            MouseArea {
                property variant pos: "1,1"
                id: marea
                anchors.fill: parent
                drag.target: applicationWindow
                onPressed: {
                    pos = Qt.point(mouse.x, mouse.y)
                }
                onPositionChanged: {
                    var delta = Qt.point(mouse.x - pos.x, mouse.y - pos.y);
                    applicationWindow.x += delta.x
                    applicationWindow.y += delta.y
                }
            }

            Rectangle {
                id: btn_exit

                width: 25
                height: 25
                anchors.right: parent.right
                anchors.top: parent.top
                color: "#eeeeee"

                Text {
                    text: 'X'
                    font.pointSize: 12
                    anchors.centerIn: parent
                }

                MouseArea {
                    id: mouse_btn_exit
                    anchors.fill: btn_exit
                    onClicked:
                    {
                        console.log('clicked exit')
                        Qt.quit()
                    }
                    hoverEnabled: true
                    onEntered: btn_exit.color = "#a0a0a0"
                    onExited: btn_exit.color = "#eeeeee"
                }
            }
        }

        Rectangle {
            id: rect_work
            color: "#606060"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: list_area.right
            anchors.leftMargin: 5
            clip: true

            SwipeView {
                id: swipeView
                currentIndex: tabBar.currentIndex
                anchors.bottomMargin: 40
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.topMargin: 0

                Item {
                    Rectangle {
                        id: rectangle1
                        width: 200
                        height: 200
                        color: "#28dd1e"
                    }
                }

                Item {
                    Column {
                        id: column
                        spacing: 5
                        anchors.fill: parent
                        anchors.margins: 5

                        Cold {}
                        Hot {}

    //                    Vibro { width: 995; height: 200; drop_width: applicationWindow.item_width; drop_height: applicationWindow.item_height }
    //                    Hydro { width: 995; height: 200; drop_width: applicationWindow.item_width; drop_height: applicationWindow.item_height }
    //                    Termo { width: 995; drop_width: applicationWindow.item_width; drop_height: applicationWindow.item_height }
                    }
                }
            }


        }

        footer: Row {
            id: root_status
            height: 40

            Rectangle {
                id: rect_status
                width: 270
                height: root_status.height
                color: 'black'

            }

            TabBar {
                id: tabBar
                width: parent.width - rect_status.width - 5
                currentIndex: swipeView.currentIndex

                TabButton {
                    id: tab_info
                    text: 'Информация'
                }
                TabButton {
                    id: tab_test
                    text: 'Испытание'
                }
            }
        }

        Rectangle {
            id: list_area
            width: item_width + 10
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
            color: '#606060'

            Rectangle {
                id: rect_search_area
                height: 40
                radius: 5
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.margins: 5
                color: '#505050'

                Rectangle {
                    id: bnt_search
                    width: 30
                    height: 30
                    radius: 5
                    anchors.verticalCenterOffset: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter


                }
            }

            Column {
                anchors.top: rect_search_area.bottom
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.margins: 5
                spacing: 5

                Repeater {
                    model: 5
                    delegate: Tms { width: applicationWindow.item_width }
                }
            }
        }
    }
