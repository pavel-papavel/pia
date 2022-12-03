import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Dialogs

Item {
    id: root

    property int paddingFromCenter: sliderCenter.value
    property string sourceImage: ""
    property int centerBoxSize: sliderCenterSize.value
    property int imageSize: sliderImageSize.value
    property bool lineEnabled: checkBoxLineEnabled.checked
    property bool boxEnabled: checkBoxBoxEnabled.checked

    function setValues(centerBoxPadding, centerBoxSize, imageSize, lineEnabled, boxEnabled)
    {
        sliderCenter.value = centerBoxPadding
        sliderCenterSize.value = centerBoxSize
        sliderImageSize.value = imageSize
        checkBoxBoxEnabled.checked = lineEnabled
        checkBoxBoxEnabled.checked = boxEnabled
    }

    Window {
        title: qsTr("Debug window")
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
                id: checkBoxLineEnabled
                text: "Включить линии"
                checked: lineEnabled
            }
            CheckBox {
                id: checkBoxBoxEnabled
                text: "Включить квадрат"
                checked: boxEnabled
            }
            Row {
                spacing: 20
                Text {
                    text: "Размер изображений"
                }
                Slider {
                    id: sliderImageSize
                    from: 0
                    to: 500
                }
            }
            Row {
                spacing: 20

                Button {
                    text: "Выбрать изображение"
                    onClicked: {
                        fileDialog.open()
                    }
                }

                FileDialog {
                    id: fileDialog
                    nameFilters: "*.png"
                    fileMode: FileDialog.OpenFile
                    currentFolder: "file:///C:/Users/pasha/Documents/ProjectImage"
                    onAccepted: {
                        root.sourceImage = selectedFile
                    }
                }
            }
        }
    }
}
