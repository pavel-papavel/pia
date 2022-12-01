import QtQuick 2.15
import QtQuick.Controls

Item {
    id: root

    property int paddingWidth: sliderWidth.value
    property int paddingHeight: sliderHeight.value

    Window {
        title: qsTr("Debug window")
        width: 300
        height: 300
        visible: true
        Column {
            width: parent.width / 2
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            spacing: 20
            Row {
                spacing: 20
                Text {
                    text: "Отступ по ширине"
                }
                Slider {
                    id: sliderWidth
                    from: 0
                    to: 100
                }
            }
            Row {
                spacing: 20
                Text {
                    text: "Отступ по высоте"
                }
                Slider {
                    id: sliderHeight
                    from: 0
                    to: 100
                }
            }
        }
    }
}
