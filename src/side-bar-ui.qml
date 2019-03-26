import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Rectangle {
    /*SIGNALS*/
    signal newImage(string index)
    signal editImage(string index)
    signal deleteImage(string index)

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

                            MouseArea {
                                anchors.fill: parent
                                onClicked: newImage(modelData)
                            }
                        }
                        Button {
                            id: editBtn
                            text: "Edit"
                            style: ButtonStyle {
                                background: Rectangle {
                                    implicitWidth: 100
                                    implicitHeight: 25
                                    border.width: control.activeFocus ? 2 : 1
                                    border.color: "#888"
                                    radius: 4
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: editImage(modelData)
                            }
                        }

                        Label {
                            id: deleteLabel
                            font.pixelSize: 14
                            text: "Delete"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: deleteImage(modelData)
                            }
                        }
                    }
                }
            }
        }
    }
}