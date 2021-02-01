import QtQuick 2.0


Item {
    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered:  console.debug("timer");// time.text = Date().toString()
    }

//    Text { id: time }
}

/*

Rectangle {
    width: 100
    height: 62
}
*/
