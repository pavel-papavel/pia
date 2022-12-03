import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls

import "qml/DebugWnd"
import "qml/Components"

import Core 1.0

Window {
    id: window

    property int paddingFromCenterMain: saveManager.intValue("paddingFromCenter", "[saveManager] Ошибка чтения данных")
    property string sourceImgMain: saveManager.stringValue("sourceImage", "[saveManager] Ошибка чтения данных")
    property int centerBoxSize: saveManager.intValue("centerBoxSize", "[saveManager] Ошибка чтения данных")
    property int imageSize: saveManager.intValue("imageSize", "[saveManager] Ошибка чтения данных")
    property bool lineEnabled: saveManager.boolValue("lineEnabled", "[saveManager] Ошибка чтения данных")
    property bool boxEnabled: saveManager.boolValue("boxEnabled", "[saveManager] Ошибка чтения данных")

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
                window.paddingFromCenterMain = paddingFromCenter
                saveManager.setValue("paddingFromCenter", paddingFromCenter)
            }
            onSourceImageChanged: {
                window.sourceImgMain = sourceImage
                saveManager.setValue("sourceImage", sourceImage)
            }
            onCenterBoxSizeChanged:
            {
                window.centerBoxSize = centerBoxSize
                saveManager.setValue("centerBoxSize", centerBoxSize)
            }
            onImageSizeChanged: {
                window.imageSize = imageSize
                saveManager.setValue("imageSize", imageSize)
            }
            onLineEnabledChanged: {
                window.lineEnabled = lineEnabled
                saveManager.setValue("lineEnabled", lineEnabled)
            }
            onBoxEnabledChanged: {
                window.boxEnabled = boxEnabled
                saveManager.setValue("boxEnabled", boxEnabled)
            }
        }
        onLoaded: {
            var paddingFromCenter = saveManager.intValue("paddingFromCenter", "[saveManager] Ошибка чтения данных")
            //var sourceImgMain = saveManager.value("sourceImage", "[saveManager] Ошибка чтения данных")
            var centerBoxSize = saveManager.intValue("centerBoxSize", "[saveManager] Ошибка чтения данных")
            var imageSize = saveManager.intValue("imageSize", "[saveManager] Ошибка чтения данных")
            var lineEnabled = saveManager.boolValue("lineEnabled", "[saveManager] Ошибка чтения данных")
            var boxEnabled = saveManager.boolValue("boxEnabled", "[saveManager] Ошибка чтения данных")
            item.setValues(paddingFromCenter, centerBoxSize, imageSize, lineEnabled, boxEnabled)
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
