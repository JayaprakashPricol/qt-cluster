import QtQuick 2.2

Rectangle {
    id: indication
    width: 1786
    height: 695
    visible: valuetable.fuel_temp_view ? true : false
    color:"Transparent"
    z:15

    property bool blink_phone: true

   /* Image {
        id: reference
        x: 0
        y: 1
        z: -2
        source:  "image/Reference_main.png"//"image/Reference.png"
    }*/

    Rectangle {
        id: left_ind
        x: valuetable.ind_l_x  // first mode : 383 second mode : 450
        y: valuetable.ind_l_y   // first mode : 123 second mode : 87
        width: 250
        height: 100
        color: "Transparent"

        Image {
            id: left_turn
            x: 153
            y: 6
            opacity: 1.0
            visible : true

            source: "Telltales/left_turn.png"
        }

        Image {
            id: hi_beam
            x: 89
            y: 16
            opacity: 1.0
            visible : true
            source: "Telltales/HI_beam.png"
        }

        Image {
            id: airbag
            x: 89
            y: 66
            opacity: 1.0
            visible : true
            source: "Telltales/Airbag.png"
        }

        Image {
            id: ps_fail
            x: 140
            y: 66
            opacity: 1.0
            visible : true
            source: "Telltales/PS_Failure.png"
        }

        Image {
            id: abs
            x: 188
            y: 54
            opacity: 1.0
            visible : true
            source: "Telltales/ABS.png"
        }

        Image {
            id: btry
            x: 28
            y: 54
            width: 61
            height: 40
            opacity: 1.0
            visible : true
            source: "Telltales/Battery.png"
        }
    }

    Rectangle {
        id: right_ind
        x: valuetable.ind_r_x  // first mode : 1207 second mode : 1127
        y: valuetable.ind_r_y   // first mode : 129 second mode : 87
        width: 200
        height: 100
        color: "Transparent"

        Image {
            id: ryt_turn
            x: 48
            y: 12
            opacity: 1.0
            visible : true
            source: "Telltales/right_turn.png"

        }

        Image {
            id: mil
            x: 4
            y: 69
            opacity: 1.0
            visible : true
            source: "Telltales/MIL.png"
        }

        Image {
            id: bluetooth
            x: 98
            y: 12
            source: valuetable.bt_paired ? "Telltales/Bluetooth symbl_full.png" : "Telltales/Bluetooth symbl_half.png"
            }


        Image {
            id: seat_blt
            x: 169
            y: 63
            opacity: 1.0
            visible : true
            source: "Telltales/Seat_Belt.png"
        }

        Image {
            id: park_brk
            x: 59
            y: 67
            opacity: 1.0
            visible : true
            source: "Telltales/Park_Brake.png"
        }

        Image {
            id: headlamp
            x: 114
            y: 73
            opacity: 1.0
            visible : true
            source: "Telltales/Headlamp.png"
        }
		
		MouseArea 
		{
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
			anchors.fill: parent
			onClicked:{
				 Qt.quit();
			}
         }
    }
    Text {
        id: incoming_txt
        x: 349
        y: ( valuetable.ind_r_y >= 100 ) ? 231 : 192
        z: 1
        width: 500
        height: 30
        color: "#ffffff"
        text: valuetable.incoming_mob_number //"Incoming Call From "+valuetable.incoming_mob_number
        font.pixelSize: 30
        font.bold: true
        font.family:"Nexa Bold"
        visible:valuetable.show_income_call_alert
}
    Image {
        id: id_ph_icon
        x: 299
        y: ( valuetable.ind_r_y >= 100 ) ? 231 : 192
        source: "Telltales/phone.png"
        visible: valuetable.show_income_call_alert && blink_phone
        SequentialAnimation
        {
           loops: Animation.Infinite
           PropertyAction {
               target: indication
               property: "blink_phone"
               value: false
           }
           PauseAnimation {
               duration: 200
           }
           PropertyAction {
               target: indication
               property: "blink_phone"
               value: true
           }
           PauseAnimation {
               duration: 200
           }
           onStopped:
           {
               blink_phone = true
           }
           running:  valuetable.show_income_call_alert ? true : false
       }
    }
}
