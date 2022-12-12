import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick
import QtQuick3D

import "qml/DebugWnd"
import "qml/Components"
import Core 1.0

Window {
    id: window

    property string typeProject: "3d"

    property bool multipleDisplayMode: core.getMultipleDisplayMode()
    property QtObject currentDisplay: Qt.application.screens[multipleDisplayMode === true ? 1 : 0]

    property int paddingFromCenterMain: saveManager.intValue("paddingFromCenter", "[saveManager] Ошибка чтения данных")
    property string sourceImgMain: saveManager.stringValue("sourceImage", "[saveManager] Ошибка чтения данных")
    property int centerBoxSize: saveManager.intValue("centerBoxSize", "[saveManager] Ошибка чтения данных")
    property int imageSize: saveManager.intValue("imageSize", "[saveManager] Ошибка чтения данных")
    property bool lineEnabled: saveManager.boolValue("lineEnabled", "[saveManager] Ошибка чтения данных")
    property bool boxEnabled: saveManager.boolValue("boxEnabled", "[saveManager] Ошибка чтения данных")

    property int paddingFromCenter3D: saveManager.intValue("paddingFromCenter3D", "[saveManager] Ошибка чтения данных")
    property int centerBoxSize3D: saveManager.intValue("centerBoxSize3D", "[saveManager] Ошибка чтения данных")
    property bool lineEnabled3D: saveManager.boolValue("lineEnabled3D", "[saveManager] Ошибка чтения данных")
    property bool boxEnabled3D: saveManager.boolValue("boxEnabled3D", "[saveManager] Ошибка чтения данных")
    property int viewSize3D: saveManager.intValue("viewSize3D", "[saveManager] Ошибка чтения данных")
    property int modelSize3D: saveManager.intValue("modelSize3D", "[saveManager] Ошибка чтения данных")
    property bool stopRotate3D: false

    width: 600
    height: 600
    visible: true
    title: qsTr("View window")
    color: "black"
    visibility: multipleDisplayMode === true ? "FullScreen" : "Windowed"
    screen: currentDisplay
    x: screen.virtualX
    y: screen.virtualY
    Component.onCompleted: {
         winld.active = true
        console.log(screen.width)
    }

    Core {
        id: core
    }

    Loader {
        id: winld
        active: false
        sourceComponent:
        {
            if (window.typeProject === "image")
            {
                return debugImageWindowComponent
            }
            else if (window.typeProject === "3d")
            {
                return debug3DWindowComponent
            }
        }
        onLoaded: {
            if (window.typeProject === "image")
            {
                var paddingFromCenter = saveManager.intValue("paddingFromCenter", "[saveManager] Ошибка чтения данных")
                var centerBoxSize = saveManager.intValue("centerBoxSize", "[saveManager] Ошибка чтения данных")
                var imageSize = saveManager.intValue("imageSize", "[saveManager] Ошибка чтения данных")
                var lineEnabled = saveManager.boolValue("lineEnabled", "[saveManager] Ошибка чтения данных")
                var boxEnabled = saveManager.boolValue("boxEnabled", "[saveManager] Ошибка чтения данных")
                item.setValues(paddingFromCenter, centerBoxSize, imageSize, lineEnabled, boxEnabled)
            }
            else if (window.typeProject === "3d")
            {
                var paddingFromCenter3D = saveManager.intValue("paddingFromCenter3D", "[saveManager] Ошибка чтения данных")
                var centerBoxSize3D = saveManager.intValue("centerBoxSize3D", "[saveManager] Ошибка чтения данных")
                var lineEnabled3D = saveManager.boolValue("lineEnabled3D", "[saveManager] Ошибка чтения данных")
                var boxEnabled3D = saveManager.boolValue("boxEnabled3D", "[saveManager] Ошибка чтения данных")
                var viewSize3D = saveManager.intValue("viewSize3D", "[saveManager] Ошибка чтения данных")
                var modelSize3D = saveManager.intValue("modelSize3D", "[saveManager] Ошибка чтения данных")

                item.setValues(paddingFromCenter3D, centerBoxSize3D, lineEnabled3D,
                               boxEnabled3D, viewSize3D, modelSize3D)
            }
        }
    }

    Item {
        id: viewItem
        width: Math.min(window.currentDisplay.width, window.currentDisplay.height)
        height: width
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Loader {
            anchors.fill: parent
            sourceComponent:
            {
                if (window.typeProject === "image")
                {
                    return piaimagecomponent
                }
                else if (window.typeProject === "3d")
                {
                    return pia3dcomponent
                }
            }
        }

        Component {
            id: debugImageWindowComponent

            DebugWindow {
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
        }

        Component {
            id: debug3DWindowComponent
            Debug3DWindow {
                onPaddingFromCenterChanged: {
                    window.paddingFromCenter3D = paddingFromCenter
                    saveManager.setValue("paddingFromCenter3D", paddingFromCenter)
                }
                onCenterBoxSizeChanged:
                {
                    window.centerBoxSize3D = centerBoxSize
                    saveManager.setValue("centerBoxSize3D", centerBoxSize)
                    console.log("12")
                }
                onLineEnabledChanged: {
                    window.lineEnabled3D = lineEnabled
                    saveManager.setValue("lineEnabled3D", lineEnabled)
                }
                onBoxEnabledChanged: {
                    window.boxEnabled3D = boxEnabled
                    saveManager.setValue("boxEnabled3D", boxEnabled)
                }
                onViewSizeChanged: {
                    window.viewSize3D = viewSize
                    saveManager.setValue("viewSize3D", viewSize)
                }
                onModelSizeChanged: {
                    window.modelSize3D = modelSize
                    saveManager.setValue("modelSize3D", modelSize)
                }
                onStopRotateChanged: {
                    window.stopRotate3D = stopRotate
                }
            }
        }

        Component {
            id: piaimagecomponent

            PIAImageComponent {
                anchors.fill: parent
            }
        }

        Component {
            id: pia3dcomponent
            PIA3DComponent {
                anchors.fill: parent
            }
        }
    }
}
