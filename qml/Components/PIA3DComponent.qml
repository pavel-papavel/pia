import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick3D
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../qml/Model"

Rectangle {
    id: control

    color: "black"

    LineComponent {
        anchors.fill: parent
        visible: window.lineEnabled3D
    }

    Rectangle {
        id: centerBox
        width: 50 + window.centerBoxSize3D
        height: width
        color: "white"
        visible: window.boxEnabled3D
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Node {
        id: stand_alone_scene

        DirectionalLight {
            ambientColor: Qt.rgba(1.0, 1.0, 1.0, 1.0)
        }

        Node12 {
            scale.x: window.modelSize3D
            scale.y: window.modelSize3D
            scale.z: window.modelSize3D
            //scale: Qt.vector3d(5, 5, 5)
            PropertyAnimation on eulerRotation.y {
                loops: Animation.Infinite
                duration: 5000
                to: 0
                from: -360
            }
        }

        OrthographicCamera {
            id: camera_perspective_ry
            z: -500
            eulerRotation.y: 180
        }

        OrthographicCamera {
            id: camera_orthographic_top
            x: 600
            eulerRotation.y: 90
        }

        OrthographicCamera {
            id: camera_orthographic_front
            z: 500
        }

        OrthographicCamera {
            id: camera_orthographic_left
            x: -9000
            eulerRotation.y: -90
        }
    }

        View3D {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: centerBox.top
            anchors.bottomMargin: window.paddingFromCenter3D
            width: 100 + window.viewSize3D
            height: width
            importScene: stand_alone_scene
            camera: camera_orthographic_front
        }

        View3D {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: centerBox.bottom
            anchors.topMargin: window.paddingFromCenter3D
            width: 100 + window.viewSize3D
            height: width
            importScene: stand_alone_scene
            camera: camera_orthographic_top
        }

        View3D {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: centerBox.left
            anchors.rightMargin: window.paddingFromCenter3D
            width: 100 + window.viewSize3D
            height: width
            importScene: stand_alone_scene
            camera: camera_orthographic_left
            rotation: -90
        }

        View3D {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: centerBox.right
            anchors.leftMargin: window.paddingFromCenter3D
            width: 100 + window.viewSize3D
            height: width
            camera: camera_perspective_ry
            importScene: stand_alone_scene
            rotation: 90
        }
}
