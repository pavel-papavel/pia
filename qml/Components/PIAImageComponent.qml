import QtQuick 2.15

Item {
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
        width: 200 + window.imageSize
        height: width
        fillMode: Image.PreserveAspectFit
        rotation: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: centerBox.top
        anchors.bottomMargin: paddingFromCenterMain
    }

    //нижняя
    Image {
        source: window.sourceImgMain
        width: 200 + window.imageSize
        height: width
        fillMode: Image.PreserveAspectFit
        rotation: 180
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: centerBox.bottom
        anchors.topMargin: paddingFromCenterMain
    }
    // правая
    Image {
        source: window.sourceImgMain
        width: 200 + window.imageSize
        height: width
        fillMode: Image.PreserveAspectFit
        rotation: -90
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: centerBox.left
        anchors.rightMargin: paddingFromCenterMain
    }
    // левая
    Image {
        source: window.sourceImgMain
        width: 200 + window.imageSize
        height: width
        fillMode: Image.PreserveAspectFit
        rotation: 90
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: centerBox.right
        anchors.leftMargin: paddingFromCenterMain
    }
}
