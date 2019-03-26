import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Rectangle {
    id: main
    width: 280
    height: 600
    color: "#66b3ff"

    ColumnLayout {
        anchors.fill: parent

        ListView {
            id: listView
            spacing: 30
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            model: 12
            clip: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            ScrollBar.vertical: ScrollBar {}

            delegate: ItemDelegate {
                Rectangle {
                    id: rectangle
                    width: 300
                    height: 60
                    color: "#66c9ff"
                    border.color: "blue"

                    RowLayout{
                        anchors.fill: parent
                        Rectangle {
                            width: rectangle.height - 1
                            height: rectangle.height - 1
                            color: "blue"
                        }

                        Label {
                            id: editLabel
                            font.pixelSize: 14
                            text: "Edit"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: console.log("edit")
                            }
                        }

                        Label {
                            id: deleteLabel
                            font.pixelSize: 14
                            text: "Delete"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: console.log("delete")
                            }
                        }
                    }
                }
            }
        }
    }
}