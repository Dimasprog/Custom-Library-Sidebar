import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.1


Item {

    id: main
    width: 220

    /* SIGNALS */

    /* DESIGN */
    Rectangle {
        id: menu
        width: parent.width
        height: parent.height
        color: "#b6c6ed"

        ColumnLayout {
            id: col
            anchors.horizontalCenter: main.horizontalCenter

//            ScrollView {
//
//                ListView {
//                    model: 20
//                    spacing: 5
//                    delegate: Rectangle {
//                        id: rect
//                        width: 220
//                        height: 25
//                        color: "black"
//                    }
//                }
//            }
            Rectangle {
                id: frame
                clip: true
                width: 220
                height: 500 - 2
                border.color: "black"
                anchors.centerIn: parent

//              Text {
//                  id: content
//                  text: "ABC"
//                  font.pixelSize: 1000
//                  x: -hbar.position * width
//                  y: -vbar.position * height
//              }

                ScrollView {

                    ListView {
                        model: 8
                        spacing: 10

                        Rectangle {
                            id: content
                            height: parent.height / 8
                            color: "yellow"
                        }
                    }
                }

                ScrollBar {
                    id: vbar
                    hoverEnabled: true
                    active: hovered || pressed
                    orientation: Qt.Vertical
                    size: frame.height / content.height
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                }

            }
        }
    }
}