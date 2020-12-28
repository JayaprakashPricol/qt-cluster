import QtQuick 2.1
import QtQuick.Window 2.0



Window
{
    id: root
    visible: true
    width: 800
    height: 480
    color: "#000000"
    //title: "QT-Testing"
    //flags: Qt.Window
    flags: Qt.FramelessWindowHint
    //flags: Qt.Dialog
    Component.onCompleted: {
        x = Screen.width / 2 - width / 2
        y = Screen.height / 2 - height / 2
    }

    Image
    {
        id: welcome
        x: 301
        y: 214//148
        opacity : valuetable.welcome_opac;
        antialiasing: true
        visible: valuetable.bars_visible
        source: "Welcome_Text.png"
    }


    Image {
        id: topbar
        x: 157
       // y: 30
        y: valuetable.topbar_y
        scale: 1
        antialiasing: true
         visible: valuetable.bars_visible
        source: "Top_Bar.png"
    }

    Image {
        id: bottombar
        x: 172
       // y: 385
        y:valuetable.bottombar_y
        antialiasing: true
        visible: valuetable.bars_visible
        source: "Bottom_Bar.png"
    }

    Image {
        id: rightring
       // x: 491
        y: 92//53
        x:valuetable.rightring_x
         visible : valuetable.global_visibility <= 13
        source: "Right_Ring.png"

        Image {
            id: speedoglow
            x: 16
            y: 11
            opacity: valuetable.speedoglow_opac
            source: "speedo_glow.png"

            Image {
                id: speedo_text
                x: 45
                y: 3
                visible: valuetable.glowtext_visible
                source: "Speedo_text.png"

                Image {
                    id: pointer_right
                    x: 61
                    y: 157
                    transformOrigin: Item.TopLeft
                    rotation: valuetable.ptr_right//-141
                    antialiasing: true
                    source: "Final_pointer.png"
                }
                Image {
                    id: black_circle_R
                    x: 0
                    y: 95
                    source: "centre_black.png"
                }
                TextInput {
                    id: textInput4
                    x: 26
                    y: 158
                    width: 91
                    height: 36
                    color: "#ffffff"
                    text: "km/h"
                    font.pixelSize: 36
                   // font.family: "Times New Roman"
                    z: 1
                    horizontalAlignment: Text.AlignHCenter
                }

                TextInput {
                    id: textInput3
                    x: 26
                    y: 124
                    width: 91
                    height: 36
                    color: "#ffffff"
                    text: valuetable.speedo_val
                    font.pixelSize: 36
                   // font.family: "Times New Roman"
                    z: 1
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }

    Image {
        id: leftring
        //x: 7
        y: 92//53
        x:valuetable.leftring_x
        visible : valuetable.global_visibility <= 13
        source: "Left_Ring.png"

        Image {
            id: tachoglow
            x: 36
            y: 30
            opacity: valuetable.tachoglow_opac
            source: "Tacho_glow.png"
        }
        Image {
            id: image17
            x: -5
            y: 12
            visible: valuetable.glowtext_visible
            source: "Tacho_text.png"

            Image {
                id: pointer_left
                x: 181
                y: 162
                antialiasing: true
                rotation: valuetable.ptr_left//258
                transformOrigin: Item.TopLeft
                source: "Final_pointer.png"
            }
            TextInput {
                id: textInput1
                x: 140
                y: 134
                width: 91
                height: 36
                color: "#ffffff"
                 z: 1
                text : valuetable.tacho_val
                horizontalAlignment: Text.AlignHCenter
                //font.family: "Times New Roman"
                font.pixelSize: 36
            }
            TextInput {
                id: textInput2
                x: 140
                y: 168
                width: 91
                height: 36
                color: "#ffffff"
                text: "rpm"
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 36
                //font.family: "Times New Roman"
                z: 1
            }

            Image {
                id: black_circle_L
                x: 115
                y: 96
                source: "centre_black.png"
            }
        }
    }

    Rectangle {
        id: rectangle1
        x: 243
        y: 145
        width: 310
        height: 242
        color: "#00000000"
        scale: valuetable.rectangle_scale

        Column {
            id: column1
            x: 8
            y: 6
            width: 63
            height: 231
            scale: 1
            spacing: -1

            Image {
                id: image1
                scale: 1
                source: "FG_glow_left.png"

                Image {
                    id: image2
                    x: 8
                    y: 118
                    z: 1
                    source: "FG_fil_left.png"
                }

                Image {
                    id: image18
                    x: 23
                    y: 26
                    z: 2
                    source: "FG_grad_left.png"
                }
            }
        }

        Column {
            id: column2
            x: 239//247
            y: 6//10
            width: 63
            height: 231
            scale: 1
            spacing: -1

            Image {
                id: image19
                source: "FG_glow_R.png"

                Image {
                    id: image20
                    x: 7
                    y: 117
                    z: 1
                    source: "FG_filling_R.png"
                }

                Image {
                    id: image21
                    x: 7
                    y: 25
                    z: 2
                    source: "FG_graduations_R.png"
                }
            }
        }

        Image {
            id: tg
            x: 223
            y: 11
            z: -1
            source: "TG.png"
        }

        Image {
            id: fg
            x: 20
            y: 13
            z: -1
            source: "FG.png"
        }

        Image {
            id: blue_arc
            x: 88
            y: 11
            source: "Blue_arc.png"

            TextInput {
                id: normal_odoname
                x: 29
                y: 57
                width: 80
                height: 20
                visible : valuetable.global_visibility < 5
                color: "#ffffff"
                text: qsTr("ODO")
                font.bold: true
                font.family: "Tahoma"
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 16
            }

            TextInput {
                id: normal_odoval
                x: 35
                y: 83
                width: 80
                height: 20
                visible : valuetable.global_visibility < 5
                color: "#ffffff"
                text: qsTr("888888 km")
                font.bold: true
                font.pixelSize: 17
            }

            TextInput {
                id: normal_trip
                x: 29
                y: 123
                width: 80
                height: 20
                visible : valuetable.global_visibility < 5
                color: "#ffffff"
                text: qsTr("TRIP")
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: 16
            }

            Image {
                id: normal_door
                x: 23
                y: 19
                visible : valuetable.global_visibility >= 6
                source: "Door ajar pic.png"
            }
        }

        TextInput {
            id: normal_tripval
            x: 123
            y: 158
            width: 80
            height: 20
            visible : valuetable.global_visibility < 5
            color: "#ffffff"
            text: qsTr("88888.8 km")
            font.bold: true
            font.pixelSize: 16
        }

        TextInput {
            id: normal_alert1
            x: 130
            y: 236
            width: 80
            height: 20
            visible : valuetable.global_visibility >= 6
            color: "#ffffff"
            text: qsTr("RIGHT FRONT")
            font.bold: true
            font.pixelSize: 16
        }
        Image {
            id: blue_arc2
            x: valuetable.rect_bluarc_x//197
            y: 11
            rotation: 180
            source: "Blue_arc.png"
        }

        TextInput {
            id: nomral_alert2
            x: 123
            y: 253
            width: 80
            height: 20
            visible : valuetable.global_visibility >= 6
            color: "#ffffff"
            text: qsTr("DOOR OPEN")
            font.bold: true
            font.pixelSize: 16
        }

    }

    Image {
        id: image4
        x: 46
        y: 65
        visible : valuetable.icon_visible

        source: "left_turn.png"
    }

    Image {
        id: image5
        x: 698
        y: 59
         visible : valuetable.icon_visible
        source: "right_turn.png"
    }

    Image {
        id: image6
        x: 78
        y: 21
         visible : valuetable.icon_visible
        source: "HI_beam.png"
    }

    Image {
        id: image7
        x: 140
        y: 21
         visible : valuetable.icon_visible
        source: "Airbag.png"
    }

    Image {
        id: image8
        x: 204
        y: 21
         visible : valuetable.icon_visible
        source: "PS_Failure.png"
    }

    Image {
        id: image9
        x: 259
        y: 7
         visible : valuetable.icon_visible
        source: "ABS.png"
    }

    Image {
        id: image10
        x: 328
        y: 24
         visible : valuetable.icon_visible
        source: "MIL.png"
    }

    Image {
        id: image11
        x: 391
        y: 27
         visible : valuetable.icon_visible
        source: "Headlamp.png"
    }

    Image {
        id: image12
        x: 434
        y: 7
         visible : valuetable.icon_visible
        source: "Cruise_control.png"
    }

    Image {
        id: image13
        x: 510
        y: 24
         visible : valuetable.icon_visible
        source: "Park_Brake.png"
    }

    Image {
        id: image14
        x: 563
        y: 9
         visible : valuetable.icon_visible
        source: "Battery.png"
    }

    Image {
        id: image15
        x: 652
        y: 20
         visible : valuetable.icon_visible
        source: "Seat_Belt.png"
    }

    Image {
        id: image16
        x: 343
        y: 113
        visible : valuetable.logo_visible
        source: "Pricol_logo.png"
    }

    Image {
        id: image26
        x: 222
        y: 89
        visible : valuetable.global_visibility === 10
        source: "Center_White.png"
    }

    Image {
        id: image27
        x: 216
        y: 83
        visible : valuetable.global_visibility === 11
        source: "Center_Pink.png"
    }
    Image {
        id: image28
        x: 173
        y: 47
        visible : valuetable.global_visibility === 12
        source: "Center_Large_2.png"
    }
    Image {
        id: image29
        x: 173
        y: 47
        visible : valuetable.global_visibility >= 13 && valuetable.global_visibility <= 15
        opacity: valuetable.centre_large_opac
        source: "Center_Large_3.png"
    }
    Image {
        id: image30
        x: 198
        y: 70

        visible : valuetable.global_visibility >= 14
        source: "Sport_Mode_ring.png"

        Image {
            id: image37
            x: 18
            y: 25
            z: -1
            visible : valuetable.global_visibility >= 20
            source: "Sports_graduation.png"
        }
        Image {
            id: image38
            x: 45
            y: 41
            z: -2
            opacity:valuetable.rpm_redglow_opac
            source: "rpm_red_glow.png"
        }

        Image {
            id: image39
            x: 39
            y: 38
            z:2
            visible : valuetable.global_visibility >= 21
            source: "sport_numbers.png"

            Image {
                id: sport_pointer
                x: 196
                y: 81
                rotation: 31
                source: "sport_speedo pointer.png"
            }
        }
        Image {
            id: image40
            x: valuetable.sports_redfg_x//167
            y: 63
            width: 324
            height: 269
            antialiasing: true
            z: -3
            rotation: valuetable.sports_redfg_rot//-19
            visible: valuetable.global_visibility >= 21
            source: "Sports_red_FG.png"

            Image {
                id: tg_graphics
                x: 177
                y: 121
                source: "TG_graphics.png"

                Image {
                    id: tgbar_1
                    x: 36
                    y: 119
                    source: "TG_bar 1.png"
                }

                Image {
                    id: tgbar_2
                    x: 46
                    y: 105
                    source: "TG_bar 2.png"
                }

                Image {
                    id: tgbar_3
                    x: 53
                    y: 92
                    source: "TG_bar 3.png"
                }

                Image {
                    id: tgbar_4
                    x: 58
                    y: 77
                    source: "TG_bar 4.png"
                }

                Image {
                    id: tgbar_5
                    x: 63
                    y: 62
                    source: "TG_bar 5.png"
                }

                Image {
                    id: tgbar_6
                    x: 68
                    y: 47
                    source: "TG_bar 6.png"
                }

                Image {
                    id: tgbar_7
                    x: 74
                    y: 36
                    source: "TG_bar 7.png"
                }

            }
        }

    }

    Image {
        id: image41
        x: valuetable.sports_redtg_x//111
        y: 133
        z:-1
        width: 324
        height: 269
        rotation: valuetable.sports_redtg_rot//19
        antialiasing: true
        visible: valuetable.global_visibility >= 21
        source: "Sports_red_TG.png"

        Image {
            id: fg_graphics
            x: 34
            y: 121
            source: "FG_graphics.png"

            Image {
                id: fgbar_1
                x: 57
                y: 120
                source: "FG_bar 1.png"
            }

            Image {
                id: fgbar_2
                x: 47
                y: 106
                source: "FG_bar 2.png"
            }

            Image {
                id: fgbar_3
                x: 40
                y: 92
                source: "FG_bar 3.png"
            }

            Image {
                id: fgbar_4
                x: 33
                y: 78
                source: "FG_bar 4.png"
            }

            Image {
                id: fgbar_6
                x: 16
                y: 46
                source: "FG_bar 6.png"

                Image {
                    id: fgbar_5
                    x: 9
                    y: 16
                    rotation: -40
                    source: "FG_bar 5.png"
                }
            }

            Image {
                id: fgbar_7
                x: 12
                y: 34
                source: "FG_bar 7.png"
            }

        }
    }

    Image {
        id: image31
        x: 312
        y: 180
        opacity:valuetable.sport_inner_opac
        source: "Sports_inner_ring.png"
        Image {
            id: image32
            x: 44
            y: 36
            visible:valuetable.global_visibility >=18
            source: "Sport_lines.png"

            Image {
                id: image33
                x: 20
                y: 0
                visible:valuetable.global_visibility >=18
                source: "Sport_text.png"
            }
        }
        Image {
            id: image34
            x: valuetable.sport_text_x//-62
            y: 12
            scale: valuetable.sport_text_scale//0.18
            visible:valuetable.global_visibility >=19
            source: "Sport_text_movement.png"
        }

        TextInput {
            id: odo_value
            x: 58
            y: 89
            width: 58
            height: 34
            color: "#ffffff"
            text: qsTr("99")
            font.bold: true
            font.family: "Courier"
            visible : valuetable.global_visibility >= 21
            font.pixelSize: 50
        }

        TextInput {
            id: odo_kmh
            x: 48
            y: 114
            width: 80
            height: 20
            color: "#ffffff"
            text: qsTr("km/h")
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            visible : valuetable.global_visibility >= 21
            font.pixelSize: 15
        }

        TextInput {
            id: rpmx
            x: 56
            y: 174
            width: 80
            height: 20
            color: "#ffffff"
            text: qsTr("x1000rpm")
            font.bold: true
            font.family: "Courier"
            visible : valuetable.global_visibility >= 21
            font.pixelSize: 20
        }
    }

    Image {
        id: image35
        x: 47//62
        y:  valuetable.sport_bottombar_y
        source: "Sports_Bottom.png"

        Image {
            id: image53
            x: 649
            y: 69
            visible : valuetable.global_visibility >= 21
            source: "Pricol_logo.png"
        }

        TextInput {
            id: time_am
            x: 6
            y: 72
            width: 80
            height: 20
            color: "#ffffff"
            text: qsTr("AM")
            font.bold: true
            font.family: "Courier"
            visible : valuetable.global_visibility >= 21
            font.pixelSize: 12
        }

        TextInput {
            id: odo_name
            x: 155
            y: 26
            width: 80
            height: 20
            color: "#ffffff"
            text: qsTr("ODO")
            font.bold: true
            visible : valuetable.global_visibility >= 21
            font.pixelSize: 14
        }

        TextInput {
            id: odo_values
            x: 164
            y: 52
            width: 80
            height: 20
            color: "#ffffff"
            text: qsTr("00000.0 km")
            font.family: "Courier"
            font.bold: true
            visible : valuetable.global_visibility >= 21
            font.pixelSize: 15
        }

        TextInput {
            id: prnd
            x: 339
            y: 41
            width: 80
            height: 20
            color: "#ffffff"
            text: qsTr("P R N D 1 2")
            font.bold: true
            font.family: "Courier"
            visible : valuetable.global_visibility >= 21
            font.pixelSize: 19
        }

        TextInput {
            id: trip_ab
            x: 457
            y: 26
            width: 80
            height: 20
            color: "#ffffff"
            text: qsTr("TRIP A B")
            font.family: "Courier"
            font.bold: true
            visible : valuetable.global_visibility >= 21
            font.pixelSize: 15
        }

        TextInput {
            id: trip_value
            x: 471
            y: 52
            width: 80
            height: 20
            color: "#ffffff"
            text: qsTr("00000.0 km")
            font.family: "Courier"
            font.bold: true
            visible : valuetable.global_visibility >= 21
            font.pixelSize: 15
        }
    }
    Image {
        id: image36
        x: 65
        y:  valuetable.sport_topbar_y//-60
        source: "Sports_topbar.png"
    }

    TextInput {
        id: time_value
        x: 12
        y: 454
        width: 80
        height: 20
        color: "#ffffff"
        text: qsTr("08:00")
        font.family: "Arial"
        font.bold: true
        font.pixelSize: 15
        visible : valuetable.global_visibility >= 21
        horizontalAlignment: Text.AlignLeft
    }



/*******************************     Value Table **************************************************/
    Item{
        id : valuetable
        property real welcome_opac: 0
        property real speedoglow_opac: 0.0
        property real tachoglow_opac: 0.0

        property real centre_large_opac: 1.0
        property real sport_inner_opac: 0.0

        property real rpm_redglow_opac: 0.0

        property real bottombar_y: 580
        property real topbar_y: -40
        property real leftring_x: -301
        property real rightring_x: 850//802
        property real rectangle_scale: 0.0

        property real sport_text_scale: 0.18

        property real ptr_right : 0.0
        property real ptr_left : 0.0

        property int tacho_val : 0
        property int speedo_val : 0

        property bool icon_visible : false
        property bool glowtext_visible : false
        property bool logo_visible : false
        property bool bars_visible : true

        property int global_visibility : 0

        property real sport_text_x: -62
        property real sport_bottombar_y: 580
        property real sport_topbar_y: -60

        property real sports_redfg_x: 144//167
        property real sports_redtg_x: 134//111

        property real sports_redfg_rot:-12
        property real sports_redtg_rot: 12

        property real rect_bluarc_x: 197


        property bool start: true

        SequentialAnimation {
            running: true
            loops: 1

            // We want a small pause at the beginning, but we only want it to happen once.
           /* PauseAnimation {
                duration: 2000
            }
*/
            PropertyAction {
                target: valuetable
                property: "start"
                value: false
            }

            SequentialAnimation {
                loops: Animation.Infinite

                ParallelAnimation {
                    NumberAnimation {
                        target: valuetable
                        property: "welcome_opac"
                        from: 0.0
                        to: 1.0
                        duration: 2000
                    }
                }
                PauseAnimation
                {
                    duration: 200
                }
                ParallelAnimation {
                    NumberAnimation {
                        target: valuetable
                        property: "welcome_opac"
                        from: 1.0
                        to: 0.0
                        duration: 1000
                    }

                    NumberAnimation {
                        target: valuetable
                        property: "bottombar_y"
                        from: 600
                        to: 424//385
                        duration: 1000
                    }
                    NumberAnimation {
                        target: valuetable
                        property: "topbar_y"
                        from: -180
                        to: 70//31
                        duration: 1000
                    }
                    NumberAnimation {
                        target: valuetable
                        property: "leftring_x"
                        from: -301
                        to: 5
                        duration: 1000
                    }
                    NumberAnimation {
                        target: valuetable
                        property: "rightring_x"
                        from: 850//802
                        to: 490
                        duration: 1000
                    }

                }
                ParallelAnimation {
                    NumberAnimation {
                        target: valuetable
                        property : "speedoglow_opac"
                        from: 0.0
                        to: 0.2
                        duration: 500
                    }
                    NumberAnimation {
                        target: valuetable
                        property : "tachoglow_opac"
                        from: 0.0
                        to: 0.2
                        duration: 500
                    }
                }

                PropertyAction {
                    target: valuetable
                    property: "icon_visible"
                    value: true
                }
               /* PropertyAction {
                    target: valuetable
                    property: "global_visibility"
                    value: 4
                }*/

                  PropertyAction {
                target: valuetable
                property: "logo_visible"
                value: true
                }
               /* PauseAnimation
                {
                    duration: 1000
                }*/

                ParallelAnimation {
                    NumberAnimation {
                        target: valuetable
                        property : "speedoglow_opac"
                        from: 0.2
                        to: 1.0
                        duration: 2000
                    }
                    NumberAnimation {
                        target: valuetable
                        property : "tachoglow_opac"
                        from: 0.2
                        to: 1.0
                        duration: 2000
                    }
                }
                PropertyAction {
                    target: valuetable
                    property: "icon_visible"
                    value: false
                }
                PropertyAction {
                    target: valuetable
                    property: "glowtext_visible"
                    value: true
                }

                ParallelAnimation {
                    NumberAnimation {
                        target: valuetable
                        property : "rectangle_scale"
                        from: 0.0
                        to: 1.0
                        duration: 2000
                    }
                    NumberAnimation {
                        target: valuetable
                        property : "ptr_right"
                        from: 76
                        to: -141
                        duration: 1500
                    }
                    NumberAnimation {
                        target: valuetable
                        property : "ptr_left"
                        from: 37
                        to: 258
                        duration: 1500
                    }
                    NumberAnimation {
                        target: valuetable
                        property : "tacho_val"
                        from: 0
                        to: 8000
                        duration: 1500
                    }
                    NumberAnimation {
                        target: valuetable
                        property : "speedo_val"
                        from: 0
                        to: 240
                        duration: 1500
                    }

                }
                 ParallelAnimation {
                     NumberAnimation {
                         target: valuetable
                         property : "ptr_right"
                         from: -141//76
                         to: 76//-141
                         duration: 1500
                     }
                     NumberAnimation {
                         target: valuetable
                         property : "ptr_left"
                         from: 258//37
                         to: 37//258
                         duration: 1500
                     }
                     NumberAnimation {
                         target: valuetable
                         property : "tacho_val"
                         from: 8000
                         to: 0
                         duration: 1500
                     }
                     NumberAnimation {
                         target: valuetable
                         property : "speedo_val"
                         from: 240
                         to: 0
                         duration: 1500
                     }
                 }



                 PropertyAction {
                     target: valuetable
                     property: "global_visibility"
                     value: 5
                 }

                 NumberAnimation {
                     target: valuetable
                     property : "rect_bluarc_x"
                     from: 197
                     to: 95
                     duration: 1500
                 }

                 NumberAnimation {
                     target: valuetable
                     property : "rect_bluarc_x"
                     from: 95
                     to: 197
                     duration: 1500
                 }
                 PropertyAction {
                     target: valuetable
                     property: "global_visibility"
                     value: 6
                 }

                 PauseAnimation {
                     running: false
                     duration: 2000
                 }

                      NumberAnimation {
                          target: valuetable
                          property : "rectangle_scale"
                          from: 1.0
                          to: 0
                          duration: 2000
                      }
                      PropertyAction {
                          target: valuetable
                          property: "glowtext_visible"
                          value: false
                      }

                      ParallelAnimation {
                      NumberAnimation {
                          target: valuetable
                          property : "tachoglow_opac"
                          from: 1.0
                          to: 0
                          duration: 1000
                      }
                      NumberAnimation {
                          target: valuetable
                          property : "speedoglow_opac"
                          from: 1.0
                          to: 0
                          duration: 1000
                      }}
                      PropertyAction {
                          target: valuetable
                          property: "bars_visible"
                          value: false
                      }
                      PropertyAction {
                          target: valuetable
                          property: "logo_visible"
                          value: false
                      }

                     ParallelAnimation {
                      NumberAnimation {
                          target: valuetable
                          property: "leftring_x"
                          from: 5
                          to: 222
                          duration: 1000
                      }
                      NumberAnimation {
                          target: valuetable
                          property: "rightring_x"
                          from: 490
                          to: 271
                          duration: 1000
                      }}
                    ParallelAnimation {
                      NumberAnimation {
                          target: valuetable
                          property: "global_visibility"
                          from: 10
                          to: 17
                          duration: 3000
                      }
                      NumberAnimation {
                          target: valuetable
                          property: "centre_large_opac"
                          from: 1.0
                          to: 0.0
                          duration: 3000
                      }}

                    NumberAnimation {
                        target: valuetable
                        property: "sport_inner_opac"
                        from: 0.0
                        to: 1.0
                        duration: 400
                    }

                    NumberAnimation {
                        target: valuetable
                        property: "global_visibility"
                        from: 18
                        to: 19
                        duration: 1000
                    }

                    NumberAnimation {
                        target: valuetable
                        property: "sport_text_scale"
                        from: 0.18
                        to: 1
                        duration: 500
                    }

                    PauseAnimation {
                        running: false
                        duration: 200
                    }

                    NumberAnimation {
                        target: valuetable
                        property: "sport_text_x"
                        from: -75
                        to: 550
                        duration: 500
                    }

                    NumberAnimation {
                        target: valuetable
                        property: "sport_bottombar_y"
                        from: 580
                        to: 384
                        duration: 1000
                    }
                    NumberAnimation {
                        target: valuetable
                        property: "sport_topbar_y"
                        from: -60
                        to: 0//15
                        duration: 200
                    }
                    PropertyAction {
                        target: valuetable
                        property: "global_visibility"
                        value: 20
                    }
                    NumberAnimation {
                        target: valuetable
                        property: "rpm_redglow_opac"
                        from: 0.0
                        to: 1.0
                        duration: 1000
                    }
                    NumberAnimation {
                        target: valuetable
                        property: "rpm_redglow_opac"
                        from: 1.0
                        to: 0.6
                        duration: 800
                    }
                    PropertyAction {
                        target: valuetable
                        property: "global_visibility"
                        value: 21
                    }

                    ParallelAnimation {
                    NumberAnimation {
                        target: valuetable
                        property: "sports_redfg_x"
                        from: 144//167
                        to: 266
                        duration: 500
                    }
                    NumberAnimation {
                        target: valuetable
                        property: "sports_redtg_x"
                        from: 134//111
                        to: 12
                        duration: 500
                    }
                    NumberAnimation {
                        target: valuetable
                        property: "sports_redfg_rot"
                        from: -12
                        to: -2
                        duration: 500
                    }
                    NumberAnimation {
                        target: valuetable
                        property: "sports_redtg_rot"
                        from: 12
                        to: 2
                        duration: 500
                    }
                   }


                PauseAnimation {
                    running: false
                    duration: 10000
                }


            /* clearing global values   */

                ParallelAnimation {
                PropertyAction {
                    target: valuetable
                    property: "welcome_opac"
                    value: false
                }
                PropertyAction {
                    target: valuetable
                    property: "speedoglow_opac"
                    value: 0
                }
                PropertyAction {
                    target: valuetable
                    property: "tachoglow_opac"
                    value: 0
                }
                PropertyAction {
                    target: valuetable
                    property: "centre_large_opac"
                    value: 1.0
                }
                PropertyAction {
                    target: valuetable
                    property: "sport_inner_opac"
                    value: 0.0
                }
                PropertyAction {
                    target: valuetable
                    property: "rpm_redglow_opac"
                    value: 0.0
                }
                PropertyAction {
                    target: valuetable
                    property: "bottombar_y"
                    value: 580//480
                }
                PropertyAction {
                    target: valuetable
                    property: "topbar_y"
                    value: -40
                }
                PropertyAction {
                    target: valuetable
                    property: "leftring_x"
                    value: -301
                }
                PropertyAction {
                    target: valuetable
                    property: "rightring_x"
                    value: 850//802
                }
                PropertyAction {
                    target: valuetable
                    property: "rectangle_scale"
                    value: 0.0
                }
                PropertyAction {
                    target: valuetable
                    property: "sport_text_scale"
                    value: 0.18
                }
                PropertyAction {
                    target: valuetable
                    property: "ptr_right"
                    value: 0.0
                }
                PropertyAction {
                    target: valuetable
                    property: "ptr_left"
                    value: 0.0
                }
                PropertyAction {
                    target: valuetable
                    property: "tacho_val"
                    value: 0.0
                }
                PropertyAction {
                    target: valuetable
                    property: "tacho_val"
                    value: 0.0
                }
                PropertyAction {
                    target: valuetable
                    property: "icon_visible"
                    value: false
                }
                PropertyAction {
                    target: valuetable
                    property: "glowtext_visible"
                    value: false
                }
                PropertyAction {
                    target: valuetable
                    property: "logo_visible"
                    value: false
                }
                PropertyAction {
                    target: valuetable
                    property: "bars_visible"
                    value: true
                }
                PropertyAction {
                    target: valuetable
                    property: "global_visibility"
                    value: 0
                }
                PropertyAction {
                    target: valuetable
                    property: "sport_text_x"
                    value: -62
                }
                PropertyAction {
                    target: valuetable
                    property: "sport_bottombar_y"
                    value: 580//480
                }
                PropertyAction {
                    target: valuetable
                    property: "sport_topbar_y"
                    value: -60
                }
                PropertyAction {
                    target: valuetable
                    property: "sports_redfg_x"
                    value: 144
                }
                PropertyAction {
                    target: valuetable
                    property: "sports_redtg_x"
                    value: 134
                }
                PropertyAction {
                    target: valuetable
                    property: "sports_redfg_rot"
                    value: -12
                }
                PropertyAction {
                    target: valuetable
                    property: "sports_redtg_rot"
                    value: 12
                }
                PropertyAction {
                    target: valuetable
                    property: "rect_bluarc_x"
                    value: 197
                }}

                PauseAnimation {
                    running: false
                    duration: 1000
                }

            }
        }

    }


}


/* Variable details */

/*

  Global_visibility = 10 -- Center_White.png visible

*/
