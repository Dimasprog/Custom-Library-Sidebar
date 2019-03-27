import QtQuick 2.12
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Rectangle {
    id: main
    width: 280
    height: 600
    color: "#66b3ff"

    /*SIGNALS*/
    signal newImage(string index)
    signal editImage(string index)
    signal deleteImage(string index)

    /*FUNCTIONS*/
    function imageSelection(index) {
        if (index == 0) { return "img/11.png"}
        if (index == 1) { return "img/12.png"}
        if (index == 2) { return "img/13.png"}
        if (index == 3) { return "img/14.png"}
        if (index == 4) { return "img/31.png"}
        if (index == 5) { return "img/32.png"}
        if (index == 6) { return "img/33.png"}
        if (index == 7) { return "img/34.png"}
    }

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
                    height: 65
                    color: "#66c9ff"
                    border.color: "blue"

                    RowLayout{
                        spacing: 40
                        Rectangle {
                            border.color: "blue"
                            width: rectangle.height
                            height: rectangle.height
                            color: "blue"

                            Image {
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                source: imageSelection(modelData)
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: newImage(modelData)
                                onPressed: parent.color = "white"
                                onReleased: parent.color = "blue"
                            }
                        }

                        Label {
                            id: editLabel
                            font.pixelSize: 16
                            text: "Edit"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: main.editImage(modelData)
                                onPressed: parent.color =  "white"
                                onReleased: parent.color = "black"
                            }
                        }

                        Label {
                            id: deleteLabel
                            font.pixelSize: 16
                            text: "Delete"

                            MouseArea {
                                anchors.fill: parent
                                onClicked: main.deleteImage(modelData)
                                onPressed: parent.color =  "white"
                                onReleased: parent.color = "black"
                            }
                        }
                    }
                }
            }
        }
    }
}