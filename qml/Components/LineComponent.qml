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
            ctx2.moveTo(viewItem.width,0)
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
            ctx3.moveTo(viewItem.width,viewItem.height)
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
            ctx4.moveTo(0,viewItem.height)
            ctx4.lineTo(centerBox.x,centerBox.y + centerBox.height)
            ctx4.stroke()
        }
    }

    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx5 = getContext("2d")
            ctx5.strokeStyle = "red"
            ctx5.beginPath()
            ctx5.moveTo(0,0)
            ctx5.lineTo(0, viewItem.height)
            ctx5.stroke()
        }
    }

    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx6 = getContext("2d")
            ctx6.strokeStyle = "red"
            ctx6.beginPath()
            ctx6.moveTo(viewItem.width,0)
            ctx6.lineTo(viewItem.width,viewItem.height)
            ctx6.stroke()
        }
    }
}
