import QtQuick 2.15

Item {
    id: root
    visible: false
    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx1 = getContext("2d")
            ctx1.strokeStyle = "red"
            ctx1.beginPath()
            ctx1.moveTo(0,0)
            ctx1.lineTo(centerBox.x,centerBox.y)
            ctx1.stroke()
        }
    }

    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx2 = getContext("2d")
            ctx2.strokeStyle = "red"
            ctx2.beginPath()
            ctx2.moveTo(window.width,0)
            ctx2.lineTo(centerBox.x + centerBox.width,centerBox.y)
            ctx2.stroke()
        }
    }

    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx3 = getContext("2d")
            ctx3.strokeStyle = "red"
            ctx3.beginPath()
            ctx3.moveTo(window.width,window.height)
            ctx3.lineTo(centerBox.x + centerBox.width,centerBox.y + centerBox.height)
            ctx3.stroke()
        }
    }

    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx4 = getContext("2d")
            ctx4.strokeStyle = "red"
            ctx4.beginPath()
            ctx4.moveTo(0,window.height)
            ctx4.lineTo(centerBox.x,centerBox.y + centerBox.height)
            ctx4.stroke()
        }
    }
}
