import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    id: applicationWindow
    visible: true
    flags: Qt.FramelessWindowHint
    width: 1024
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: rect_header
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        //        anchors.left: parent.left
        //        anchors.leftMargin: 5
        //        anchors.top: parent.top
        //        anchors.topMargin: 0
        //        anchors.right: parent.right
        //        anchors.rightMargin: 5
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
        id: rect_list
        width: 300
        color: "#e2dddd"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.top: rect_header.bottom
        anchors.topMargin: 5
        clip: true

        Rectangle {
            id: rect_search
            height: 24
            color: "#000000"
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5

            Button {
                id: btn_search
                x: 2
                y: 2
                width: 20
                height: 20
                text: qsTr("Button")
            }

            TextInput {
                id: textInput
                color: "#ffffff"
                text: qsTr("Text Input")
                leftPadding: 5
                topPadding: 3
                anchors.rightMargin: 2
                anchors.topMargin: 2
                anchors.bottomMargin: 2
                anchors.left: btn_search.right
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                anchors.leftMargin: 2
                font.pixelSize: 12
                selectByMouse: true
            }
        }

        ScrollView {
            id: scrollView
            anchors.topMargin: 5
            anchors.bottomMargin: 5
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            anchors.top: rect_search.bottom
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.left: parent.left

            Rectangle {
                id: rect_add
                color: 'gray'
                width: 250
                height: 50
                radius: 5

                MouseArea {
                    anchors.fill: parent

                    onClicked:
                    {
                        console.log('clicked add')
                        flow1.add_new()
                    }
                    hoverEnabled: true
                    onEntered: parent.color = "#f0ffffff"
                    onExited: parent.color = 'gray'
                }
            }

            Rectangle {
                anchors.top: rect_add.bottom
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.topMargin: 5
                color: "#000000"
                clip:true

                Component {
                    id: dnd_delegate
                    Item {
                        id: wrapper
                        UIListForm {
                            id: list_item
                            Rectangle {
                                id: list_item_border
                                anchors.fill: parent
                                color: 'transparent'
                                border.color: '#ffffff'
                                border.width: 6
                                opacity: 0
                            }
                        }
                        states: [
                            State {
                                name: "inDrag"
                                when: index == dnd_grid.dragged_item_index
                                PropertyChanges {
                                    target: list_item_border
                                    opacity: 1
                                }
                                PropertyChanges {
                                    target: list_item
                                    parent: dnd_container
                                }
                                PropertyChanges {
                                    target: list_item
                                    anchors.centerIn: undefined
                                }
                                PropertyChanges {
                                    target: list_item
                                    x: coords.mouseX - list_item.width / 2
                                }
                                PropertyChanges {
                                    target: list_item
                                    y: coords.mouseY - list_item.height / 2
                                }
                            }
                        ]
                    }
                }

                ListModel {
                    id: dnd_model

                    ListElement {

                    }
                    ListElement {

                    }
                    ListElement {

                    }
                    ListElement {

                    }
                }

                GridView {
                    id: dnd_grid
                    anchors.fill: parent
                    cellWidth: 256
                    cellHeight: 56
                    model: dnd_model
                    delegate: dnd_delegate

                    property int dragged_item_index: -1
                    interactive: false

                    Item {
                        id: dnd_container
                        anchors.fill: parent
                    }
                    MouseArea {
                        id: coords
                        anchors.fill: parent
                        onReleased: {
                            if (dnd_grid.dragged_item_index != -1) {
                                var draggedIndex = dnd_grid.dragged_item_index
                                dnd_grid.dragged_item_index = -1
                                dnd_model.move(draggedIndex,dnd_grid.indexAt(mouseX, mouseY),1)
                            }
                        }
                        onPressed: {
                            dnd_grid.dragged_item_index = dnd_grid.indexAt(mouseX, mouseY)
                        }
                    }



                }
            }

//            Flow {
//                id: flow1
//                spacing: 5
//                flow: Flow.LeftToRight
//                anchors.top: rect_add.bottom
//                anchors.right: parent.right
//                anchors.bottom: parent.bottom
//                anchors.left: parent.left
//                anchors.topMargin: 5

//                property int item_count: 0
//                function add_new() {
//                    var count = flow1.item_count;
//                    var component = Qt.createComponent("UIList.qml")
//                    if (component.status === Component.Ready)
//                    {
//                        var item = component.createObject(flow1,  {});
//                        if (item === null)
//                            console.log("Error finishing creation");
//                    }
//                }

//                DropArea {
//                    id: drag_target_list
//                    property string colorKey
//                    property alias drop_proxy: drag_target_list
//                    anchors.fill: parent
//                    keys: [colorKey]

//                    Rectangle {
//                        id: drop_rectangle_list
//                        anchors.fill: parent
//                        color: colorKey

//                        states: [
//                            State {
//                                when: drag_target_list.containsDrag
//                                PropertyChanges {
//                                    target: drop_rectangle_list
//                                    color: "grey"
//                                }
//                            }
//                        ]
//                    }

//                    UIListForm { }
//                }

//            }

        }

    }

    Rectangle {
        id: rect_work
        color: "#d7bfbf"
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.left: rect_list.right
        anchors.leftMargin: 5
        anchors.top: rect_header.bottom
        anchors.topMargin: 5
        clip: true

        SwipeView {
            id: swipeView
            anchors.bottomMargin: 40
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: 0
            currentIndex: tabBar.currentIndex

            Item {
                id: item1
                Rectangle {
                    id: rectangle1
                    width: 200
                    height: 200
                    color: "#f41d1d"

                    DropArea {
                        id: drag_target
                        property string colorKey
                        property alias drop_proxy: drag_target
                        width: 200
                        height: 200
                        keys: [colorKey]

                        Rectangle {
                            id: drop_rectangle
                            anchors.fill: parent
                            color: colorKey

                            states: [
                                State {
                                    when: drag_target.containsDrag
                                    PropertyChanges {
                                        target: drop_rectangle
                                        color: "grey"
                                    }
                                }
                            ]
                        }
                    }
                }
            }

            Item {
                Rectangle {
                    id: rectangle2
                    width: 200
                    height: 200
                    color: "#193cea"
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

}
