import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls

import "qml/DebugWnd"
import "qml/Components"

import Core 1.0

Window {
    id: window

    property int paddingFromCenterMain: 0
    property string sourceImgMain: "file:///C:/Users/pasha/Documents/ProjectImage/cat1.png"
    property int centerBoxSize: 0
    property int imageSize: 0
    property bool lineEnabled: true
    property bool boxEnabled: true

    width: 600
    height: 600
    visible: true
    title: qsTr("View window")
    color: "black"
    Component.onCompleted: {
         winld.active = true
    }
    Loader {
        id: winld
        active: false
        sourceComponent: DebugWindow {
            onPaddingFromCenterChanged: {
                paddingFromCenterMain = paddingFromCenter
            }
            onSourceImageChanged: {
                window.sourceImgMain = sourceImage
            }
            onCenterBoxSizeChanged:
            {
                window.centerBoxSize = centerBoxSize
            }
            onImageSizeChanged: {
                window.imageSize = imageSize
            }
            onLineEnabledChanged: {
                window.lineEnabled = lineEnabled
            }
            onBoxEnabledChanged: {
                window.boxEnabled = boxEnabled
            }
        }
    }

    LineComponent {
        anchors.fill: parent
        visible: window.lineEnabled
    }

    Rectangle {
        id: centerBox
        width: 50 + centerBoxSize
        height: width
        color: "white"
        visible: window.boxEnabled
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    // верхняя
    Image {
        source: window.sourceImgMain
        width: 100 + window.imageSize
        fillMode: Image.PreserveAspectFit
        rotation: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: centerBox.top
        anchors.bottomMargin: paddingFromCenterMain
    }

    //нижняя
    Image {
        source: window.sourceImgMain
        width: 100 + window.imageSize
        fillMode: Image.PreserveAspectFit
        rotation: 180
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: centerBox.bottom
        anchors.topMargin: paddingFromCenterMain
    }
    // правая
    Image {
        source: window.sourceImgMain
        width: 100 + window.imageSize
        fillMode: Image.PreserveAspectFit
        rotation: -90
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: centerBox.left
        anchors.rightMargin: paddingFromCenterMain
    }
    // левая
    Image {
        source: window.sourceImgMain
        width: 100 + window.imageSize
        fillMode: Image.PreserveAspectFit
        rotation: 90
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: centerBox.right
        anchors.leftMargin: paddingFromCenterMain
    }
}
