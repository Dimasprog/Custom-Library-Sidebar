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
            spacing: 70
            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            model: 100
            clip: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            ScrollBar.vertical: ScrollBar {}

            delegate: ItemDelegate {
                Rectangle {
                    id: rectangle
                    width: 300
                    height: 100
                    color: "red"
                }
            }
        }
    }
}