import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.1


Item {
    id: main
    width: 280

    /*SIGNALS*/

    /* DESIGN */
    Rectangle {
        id: customLibraryView
        width: parent.width
        height: parent.height
        color: "#b6c6ed"

        VisualDataModel {
            id: visualDataModel
            model: visualModel
            delegate: Item {
                width: main.width * 0.9
                height: main.height / 2.5

                Column {
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.horizontalCenter: parent.horizontalCenter

                    Rectangle {
                        z: 100
                        width: main.width * 0.9
                        height: main.height / 2.5
                    }
                }
            }
        }

        ListView {
            id: listView
            anchors.fill: parent
            boundsBehavior : Flickable.StopAtBounds
            model: visualDataModel
            highlight: Rectangle {
                radius: 5
                z: 10
                highlightMoveVelocity: 1000
            }

            states: State {
                name: "HideScrollBar"
                when: teethLibraryListView.visibleArea.heightRatio==1.0
                PropertyChanges { target: verticalScrollBarTeethLibrary; opacity: 0 }
            }
        }
    }
}