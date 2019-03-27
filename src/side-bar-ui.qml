import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Rectangle {
    id: main
    width: 280
    height: 600
    color: "#66b3ff"

    /*PROPERTIES*/
    property int teethModelsCount: 12

    /*SIGNALS*/
    signal newImage(string index)
    signal editImage(string index)
    signal deleteImage(string index)

    /*FUNCTIONS*/
    function imageSelection(index) {
        if (teethModelsCount == 8) {
            if (index == 0) { return "img/11.png"}
            if (index == 1) { return "img/12.png"}
            if (index == 2) { return "img/13.png"}
            if (index == 3) { return "img/14.png"}
            if (index == 4) { return "img/31.png"}
            if (index == 5) { return "img/32.png"}
            if (index == 6) { return "img/33.png"}
            if (index == 7) { return "img/34.png"}
        }
        if (teethModelsCount == 12) {
            if (index == 0) { return "img/11.png"}
            if (index == 1) { return "img/12.png"}
            if (index == 2) { return "img/13.png"}
            if (index == 3) { return "img/14.png"}
            if (index == 4) { return "img/15.png"}
            if (index == 5) { return "img/16.png"}
            if (index == 6) { return "img/31.png"}
            if (index == 7) { return "img/32.png"}
            if (index == 8) { return "img/33.png"}
            if (index == 9) { return "img/34.png"}
            if (index == 10) { return "img/35.png"}
            if (index == 11) { return "img/36.png"}
        }
    }

    ColumnLayout {
        anchors.fill: parent

        ListView {
            id: listView
            spacing: 5
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            model: teethModelsCount
            clip: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            ScrollBar.vertical: ScrollBar {

            }

            delegate: Rectangle {
                    id: rectangle
                    width: 290
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
                            cursorShape: Qt.PointingHandCursor
                        }
                    }

                    Label {
                        id: editLabel
                        font.pixelSize: 16
                        text: "Edit"
                        color: "black"

                        MouseArea {
                            anchors.fill: parent
                            onClicked: main.editImage(modelData)
                            onPressed: parent.color =  "white"
                            onReleased: parent.color = "black"
                            cursorShape: Qt.PointingHandCursor
                        }
                    }

                    Label {
                        id: deleteLabel
                        font.pixelSize: 16
                        text: "Delete"
                        color: "black"

                        MouseArea {
                            anchors.fill: parent
                            onClicked: main.deleteImage(modelData)
                            onPressed: parent.color =  "white"
                            onReleased: parent.color = "black"
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                }
            }
        }
    }
}