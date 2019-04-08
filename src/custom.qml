import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Rectangle {
    property string activeColor: "blue"
    property string backgroundColor: "red"
    property string hoverColor: "purple"
    property int paddingSizeBetweenDelegates: 14

    id: main
    width: 280
    height: 600
    color: "#66b3ff"

    VisualItemModel {
        id: itemModel

        Item {
            id: parentForListViewTeeth
            width: parent.width
            y: 60

            Rectangle {
                id: availableLibrariesSection
                z: 1
                width: parent.width
                height: 40
                color: backgroundColor

                Text {
                    z:2
                    x: 20; y: 10
                    color: "white"
                    text: qsTr("Available Libraries:")
                    font.pointSize: 15
                }
            }

            Rectangle {
                id:libraryView
                gradient: Gradient {
                          GradientStop { position: 0.3; color: backgroundColor }
                          GradientStop { position: 1.0; color: hoverColor }
                }
                width: parent.width
                height: parent.height
                anchors.top: availableLibrariesSection.bottom

                VisualDataModel {
                    id: libraryVisualDataModel
                    model: 2
                    delegate: Item {
                        width: 300
                        height: 147

                        Rectangle {
                            id: libBack
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: 300
                            height: parent.height + 15
                            opacity: 0.01
                        }
                        Column {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter

                            Text {
                                text: qsTr("Muli")
                                color: "white"
                                font.pointSize: 11
                            }

                            Rectangle {
                               z: 100
                               width: 273
                               height: 132
                               color: "black"
                            }
                        }
                        MouseArea{
                            anchors.fill: parent
                            onEntered:{libBack.opacity = 1.0; libBack.color= activeColor;}
                            onExited: {libBack.opacity = 0.01;}
                            hoverEnabled: true
                            onClicked: teethLibraryListView.currentIndex = index
                        }
                    }
                }

                ListView {
                    id:teethLibraryListView
                    spacing: paddingSizeBetweenDelegates
                    anchors.fill: parent
                    flickableDirection: Flickable.VerticalFlick
                    boundsBehavior: Flickable.StopAtBounds
                    model: libraryVisualDataModel
                    highlightMoveVelocity : 1500


                    highlight: Rectangle {
                        radius: 5
                        z: 10
                        color: activeColor
                        opacity: 0.3
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    ScrollBar.vertical: ScrollBar {
                        id: scrollBar
                        contentItem: Rectangle {
                            implicitWidth: paddingSizeBetweenDelegates - 4
                            color: "white"
                            opacity: scrollBar.pressed ? 1 : 0.5
                            radius: width / 2
                        }
                    }
                }
            }
        }

        Item {
            id: firstItem
            width: view.width
            height: view.height

            Rectangle {
                id: me
                width: 20
                height: 20
                color: "green"
            }
        }
    }

    ListView {
        id: view
        anchors { fill: parent; topMargin: 60}
        model: itemModel
        interactive: false
        highlightMoveVelocity : 2000
        preferredHighlightBegin: 0
        preferredHighlightEnd: 0
        highlightRangeMode: ListView.StrictlyEnforceRange
        orientation: ListView.Vertical
        snapMode: ListView.SnapOneItem
    }

    Rectangle {
        id: parentForTabs
        width: 300
        anchors { top: parent.top; bottom: view.top }
        color: activeColor

        Column {
            anchors.centerIn: parent
            Repeater {
                model: itemModel.count

                Rectangle {
                    width: 301
                    height: 30
                    border.color: "white"
                    color: view.currentIndex == index ? activeColor : backgroundColor

                    Rectangle {
                        id: hover
                        anchors.fill: parent
                        opacity: 0
                        color: hoverColor
                        border.color: "white"

                    }
                    Text {
                        z: 1
                        id: tabName
                        anchors.centerIn: parent
                        text: index == 0 ? qsTr("Libraries") : qsTr("Custom Library")
                        font.pointSize: 12
                        color: "white"
                        font.family: fontStyle
                    }
                    MouseArea {
                        anchors.fill: parent
                        anchors.centerIn: parent
                        onClicked: { /*main.eventSelectedTab(index); */hover.opacity = 0 }
                        onEntered: { view.currentIndex == index ? hover.opacity = 0 : hover.opacity = 1 }
                        onExited:{ hover.opacity = 0 }
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
        }
    }
}
