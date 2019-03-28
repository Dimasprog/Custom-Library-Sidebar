import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: main
    width: 400
    height: 300
    visible: true

    ColumnLayout {
        anchors.fill: parent


        ListView {
            id: listView
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            model: 100
            clip: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            ScrollBar.vertical: ScrollBar {}

            delegate: Rectangle {
//                anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                height: 65
                color: "black"
                border.color: "white"
            }
        }
    }
}