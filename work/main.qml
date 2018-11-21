import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    id: applicationWindow
    visible: true
    flags: Qt.FramelessWindowHint
    width: 1280
    height: 720
    color: 'black'
    title: qsTr("Hello World")
    property int item_width: 250

    header: Rectangle {
        id: rect_header
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#ffffff"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
        }

        Row {
            id: row_buttons
            x: 0
            width: 70
            height: 25
            spacing: 5
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0

            Rectangle {
                id: btn_min
                x: 0
                width: 20
                height: 20
                color: "#10ffffff"
                border.color: 'black'

                Text {
                    text: '_'
                    anchors.centerIn: parent
                }

                MouseArea {
                    id: mouse_btn_min
                    anchors.fill: parent
                    onClicked:
                    {
                        console.log('clicked min')

                    }
                    hoverEnabled: true
                    onEntered: parent.color = "#f0ffffff"
                    onExited: parent.color = "#10ffffff"
                }
            }

            Rectangle {
                id: btn_max
                x: 0
                width: 20
                height: 20
                color: "#10ffffff"
                border.color: 'black'

                Text {
                    text: 'o'
                    anchors.centerIn: parent
                }

                MouseArea {
                    id: mouse_btn_max
                    anchors.fill: parent
                    onClicked:
                    {
                        console.log('clicked max')

                    }
                    hoverEnabled: true
                    onEntered: parent.color = "#f0ffffff"
                    onExited: parent.color = "#10ffffff"
                }
            }
            Rectangle {
                id: btn_exit
                x: 0
                width: 20
                height: 20
                color: "#10ffffff"
                border.color: 'black'

                Text {
                    text: 'x'
                    anchors.centerIn: parent
                }

                MouseArea {
                    id: mouse_btn_exit
                    anchors.fill: parent
                    onClicked:
                    {
                        console.log('clicked exit')
                        Qt.quit()
                    }
                    hoverEnabled: true
                    onEntered: parent.color = "#f0ffffff"
                    onExited: parent.color = "#10ffffff"
                }
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

                    Vibro { width: 995; drop_width: 250 }
                    Hydro { width: 995; drop_width: 250 }
                    Termo { width: 995; drop_width: 250 }
                }
            }

            Item {
                Rectangle {
                    id: rectangle3
                    width: 200
                    height: 200
                    color: "#28dd1e"
                }
            }
        }

        TabBar {
            id: tabBar
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: swipeView.bottom
            anchors.bottomMargin: 0
            currentIndex: swipeView.currentIndex

            TabButton {
                id: tab_info
                text: 'Информация'
            }
            TabButton {
                id: tab_test
                text: 'Испытание'
            }
            TabButton {
                id: tab_else
                text: 'Остальное'
            }


        }
    }

    Rectangle {
        id: list_area
        width: 260
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
