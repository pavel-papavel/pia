import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Dialogs

Item {
    id: root

    property int paddingFromCenter: sliderCenter.value
    property int centerBoxSize: sliderCenterSize.value
    property bool lineEnabled: cbLineEnabled.checked
    property bool boxEnabled: cbBoxEnabled.checked
    property int viewSize: sliderViewSize.value
    property int modelSize: sliderModelSize.value


    function setValues(cameraPositionX, cameraPositionY, cameraPositionZ,
                       cameraAngleX, cameraAngleY, cameraAngleZ)
    {

    }

    Window {
        title: qsTr("Debug 3D window")
        width: 300
        height: 300
        visible: true
        screen: Qt.application.screens[0]
        x: screen.virtualX
        y: screen.virtualY
        Column {
            width: parent.width / 2
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            spacing: 20
            Row {
                spacing: 20
                Text {
                    text: "Отступ от центра"
                }
                Slider {
                    id: sliderCenter
                    value: paddingFromCenter
                    from: 0
                    to: 500
                }
            }
            Row {
                spacing: 20
                Text {
                    text: "Размер центрального квадрата"
                }
                Slider {
                    id: sliderCenterSize
                    from: 0
                    to: 500
                }
            }
            CheckBox {
                id: cbLineEnabled
                text: "Включить линии"
                checked: root.lineEnabled
            }
            CheckBox {
                id: cbBoxEnabled
                text: "Включить квадрат"
                checked: root.boxEnabled
            }
            Row {
                spacing: 20
                Text {
                    text: "Размер блока рендера"
                }
                Slider {
                    id: sliderViewSize
                    from: 0
                    to: 500
                }
            }
            Row {
                spacing: 20
                Text {
                    text: "Размер модели"
                }
                Slider {
                    id: sliderModelSize
                    from: 0
                    to: 50
                }
            }
        }
    }
}
