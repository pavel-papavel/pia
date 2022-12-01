import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import "qml/DebugWnd"
import Core 1.0

Window {
    property int paddingWidthMain: 0
    property int paddingHeightMain: 0

    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("View window")
    Component.onCompleted: {
         winld.active = true
    }
    Loader {
        id: winld
        active: false
        sourceComponent: DebugWindow {
            onPaddingWidthChanged: {
                paddingWidthMain = paddingWidth
            }
            onPaddingHeightChanged: {
                paddingHeightMain = paddingHeight
            }
        }
    }
    Column
    {
        spacing: 10
        Text {
            text: paddingWidthMain
        }
        Text {
            text: paddingHeightMain
        }
    }
}
