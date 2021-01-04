import QtQuick 2.0
//import QtQuick.Window 2.2
import QtQuick.Window 2.0


Item
{
 id: item1

 Timer {
     id: textTimer
     interval: 50
     repeat: true
     running: true
     triggeredOnStart: true
     onTriggered:
     {
         basewindow.qSig_Self_chk_Gauges(valuetable.speed,valuetable.tach
                                          ,valuetable.fuel,valuetable.temp);


         valuetable.speed_dig = basewindow.speed_digit / 10;

         valuetable.tach_dig = (basewindow.tach_digit/1000) * 2;

         valuetable.fuel_dig = basewindow.fuel_digit / 10;

         valuetable.temp_dig = basewindow.temp_digit / 10;

   //      basewindow.qSig_Menus(valuetable.auto_demo,valuetable.main_menu_no,valuetable.sub_menu_no
     //                                     ,valuetable.ent_menu_no,valuetable.esc_menu_no);

  //       console.debug("values:",valuetable.speed,valuetable.tach,
      //                           valuetable.fuel,valuetable.temp);
   //      console.debug("interpolate:",valuetable.speed,valuetable.spd_fill_x,valuetable.spd_fill_y,valuetable.spd_fill_angle,
    //                             valuetable.tach,valuetable.tach_fill_x,valuetable.tach_fill_y,valuetable.tach_fill_angle,
    //                             valuetable.fuel,valuetable.temp);

     //    console.debug("menu no:",valuetable.main_menu_no,valuetable.theme_sub_menu_no,valuetable.tmp_sub_menu_no,
     //                             valuetable.ent_menu_no,valuetable.esc_menu_no);

     }
 }


Window {

    objectName: "base_window"
    id: basewindow
    flags: /*Qt.Window |*/ Qt.FramelessWindowHint
    x: 0
    y: 0
    width: 1920
    height: 720
    color: "#000000"
    visible: true


    property int speed_digit:0
    property int tach_digit:0
    property int fuel_digit:200
    property int temp_digit:200

    signal qSig_Main_Menu(string msg)
    signal qSig_Sub_Menu(string msg)
    signal qSig_Ent_Menu(string msg)
    signal qSig_Esc_Menu(string msg)

    signal qSig_Self_chk_Gauges(string msg1,string msg2,
                                string msg3,string msg4)

    signal qSig_Menus(string msg0,string msg1,string msg2,
                      string msg3,string msg4)
    signal qSig_Selfchk_completed(string slf_chk)

	
	function main_menu( value2 )
            {
                if((valuetable.sub_menu_no < 1) ||  (valuetable.sub_menu_no > 3))
                {
                    valuetable.sub_menu_no = 1;
                }
                else
                {
                    if((value2 < 1) ||  (value2 > 3))
                    {
                        valuetable.sub_menu_no = 1;
                    }
                    else
                    {
                        valuetable.sub_menu_no = value2;
                    }
                }
            }

            function func_menu( value2 )
            {
                if((valuetable.func_sub_menu_no < 1) ||  (valuetable.func_sub_menu_no > 4))
                {
                    valuetable.func_sub_menu_no = 1;
                }
                else
                {
                    if((value2 < 1) ||  (value2 > 4))
                    {
                        valuetable.func_sub_menu_no = 1;
                    }
                    else
                    {
                        valuetable.func_sub_menu_no = value2;
                    }
                }
            }

            function theme_menu( value2 )
            {
                if((valuetable.theme_sub_menu_no < 1) ||  (valuetable.theme_sub_menu_no > 3))
                {
                    valuetable.theme_sub_menu_no = 1;
                }
                else
                {
                    if((value2 < 1) ||  (value2 > 3))
                    {
                        valuetable.theme_sub_menu_no = 1;
                    }
                    else
                    {
                        valuetable.theme_sub_menu_no = value2;
                    }
                }
            }

            function set_menu( value2 )
            {
                if((valuetable.set_sub_menu_no < 1) ||  (valuetable.set_sub_menu_no > 2))
                {
                    valuetable.set_sub_menu_no = 1;
                }
                else
                {
                    if((value2 < 1) ||  (value2 > 2))
                    {
                        valuetable.set_sub_menu_no = 1;
                    }
                    else
                    {
                        valuetable.set_sub_menu_no = value2;
                    }
                }
            }

    function qml_slot(val_spd,val_tach,val_fuel,val_temp,value1,value2,value3,value4,value5,value6,value7,value8,
                      value9,value10,value11,value12)
    {
        // console.debug("values:",value1,value2,value3,value4,value5,value6)


        speed_digit = val_spd;
        tach_digit = val_tach;
        fuel_digit = val_fuel;
        temp_digit = val_temp;

        valuetable.spd_fill_angle = value1/10;
        valuetable.spd_fill_x = value2;
        valuetable.spd_fill_y = value3;

        valuetable.tach_fill_angle = value4/10;
        valuetable.tach_fill_x = value5;
        valuetable.tach_fill_y = value6;

        valuetable.fuel_fill_y = value7;

        valuetable.temp_fill_y = value8;



               if( valuetable.auto_demo == 0)
               {
            if(valuetable.main_menu_no == 0 && value9 )
            {
                valuetable.main_menu_reenter = 1;
            }
                 valuetable.main_menu_no = value9;
            valuetable.ent_menu_no = value11;
            valuetable.esc_menu_no = value12;

            if(valuetable.main_menu_no == 1)
            {
                main_menu(value10);
            }
            else if(valuetable.main_menu_no == 2)
            {
                func_menu(value10);
            }
            else if(valuetable.main_menu_no == 3)
            {
                theme_menu(value10);
            }
            else if(valuetable.main_menu_no == 4)
            {
                set_menu(value10);
            }
                }
        //  console.debug("values:",low_line_x,low_line_clip_x,low_line_clip_y);//valuetable.main_menu_no,valuetable.ent_menu_no,valuetable.esc_menu_no,valuetable.tmp_sub_menu_no);
        //  console.debug("values:",valuetable.logo_y,valuetable.self_chk === 1,valuetable.logo_scale,valuetable.logo_deg_x);
        //         console.debug("values:",valuetable.speed);
    }

    function qml_bluetoothdata(rx_call_number,pair_status)
    {
        console.debug("got indication from bluetooth");
        if(rx_call_number == "")
        {
            if(pair_status)
            {
                valuetable.bt_paired = true;
                valuetable.show_income_call_alert = false;
            }
            else
            {
                valuetable.bt_paired = false;
                valuetable.show_income_call_alert = false;
            }
        }
        else
        {
            valuetable.incoming_mob_number = rx_call_number;
            valuetable.show_income_call_alert = true;
        }

    }

    function setGears( gear, enable_rpas )
    {
        valuetable.gear_input = gear;
        console.debug("got Gear from CAN");

        switch(gear)
        {
        case 0:
            valuetable.gear_input = "P";
            break;
        case 1:
            valuetable.gear_input = "R";
            break
        case 2:
            valuetable.gear_input = "N";
            break;
        case 3:
            valuetable.gear_input = "D";
            break;
        case 4:
            valuetable.gear_input = "1";
            break;
        case 5:
            valuetable.gear_input = "2";
            break;
        default:
            break;
        }

        if(enable_rpas)
        {
            // enable Rpas screen
        }
    }

    function setCompass(compass_ip, reset_control, can_deact_status)
    {
       // console.debug("got RESET request from CAN");
        compass_ip = 2;

        switch(compass_ip)
        {

        case 1:
            valuetable.compassdir = "E"
            break;
        case 2:
            valuetable.compassdir = "SE"
            break;
        case 3:
            valuetable.compassdir = "S"
            break;
        case 4:
            valuetable.compassdir = "SW"
            break;
        case 5:
            valuetable.compassdir = "W"
            break;
        case 6:
            valuetable.compassdir = "NW"
            break;
        case 7:
            valuetable.compassdir = "N"
            break;
        case 8:
            valuetable.compassdir = "NE"
            break;
        default:
            break;
        }

        if(reset_control)
        {
            // Do reset
			valuetable.var_init();
			valuetable.ip_mode_control = false	// to disable auto demo
            console.debug("got RESET request from CAN");
			valuetable.self_chk = true;
        }
		else if(can_deact_status)
		{
			valuetable.var_init();
			
			valuetable.ip_mode_control = true;	// to enable auto demo
			valuetable.self_chk = true;
		}
    }

    Rectangle
    {

            objectName: "base_rect"
            id: baserect
             x: 83//67
            y: 12
            width: 1786
            height: 695
            color: "#000000"
            visible: true

         Indications
            {
                id: indication
                width: 1786
                height: 695
            }

            Valuetable
            {
                id: valuetable
            }

            /************************************* Self check task start *****************************/
            Rectangle {

                id: id_Menu
                width: 1786
                height: 695
                color: "transparent"
                visible: true
                transformOrigin: Item.Left
                scale : 1
                clip: true
                z: 0

                Image {
                    id: id_logo
                    x: 400
                    y: valuetable.logo_y
                    z:25
                    antialiasing: true
                    source: "image/main/pricol_logo.png"
                    visible:valuetable.self_chk === 1 ? true : false
                    scale:valuetable.logo_scale
                    transform: Rotation { origin.x: 493; origin.y: 141; axis { x: 1; y: 0; z: 0 } angle: valuetable.logo_deg_x }

                }


                /************************************* Speed task start *****************************/
                Rectangle {
                    id: id_Speed
                    x: 42
                    y: 41
                    width: 693
                    height: 614
                    color: "transparent"
                    visible:valuetable.centre_blk_view ? true : false
                    transformOrigin: Item.Left
                    scale : 1
                    clip: true
                    z: 1


                    Image {
                        id: id_Spd_bg_Techno_Blue
                        x: 0
                        y: 0
                        z: 1
                        antialiasing: true
                        visible: valuetable.theme_sub_menu_no === 1 &&
                                 basewindow.speed_digit < valuetable.over_speed + 1
                                 ? true : false
                        source: "image/speed/Spd_bg_Techno_Blue.png"
                    }


                    Image {
                        id: id_Spd_bg_Tangerine
                        x: 0
                        y: 0
                        z: 1
                        antialiasing: true
                        visible: valuetable.theme_sub_menu_no === 2 &&
                                 basewindow.speed_digit < valuetable.over_speed + 1
                                 ? true : false
                        source: "image/speed/Spd_bg_Tangerine.png"
                    }

                    Image {
                        id: id_Spd_bg_Deep_Azure
                        x: 0
                        y: 0
                        z: 1
                        antialiasing: true
                        visible: valuetable.theme_sub_menu_no === 3 &&
                                 basewindow.speed_digit < valuetable.over_speed + 1
                                 ? true : false
                        source: "image/speed/Spd_bg_Deep_Azure.png"
                    }

                    Image {
                        id: id_Spd_bg_Over_Spd
                        x: 0
                        y: 0
                        z: 1
                        antialiasing: true
                        visible: basewindow.speed_digit > valuetable.over_speed ? true : false
                        source: "image/speed/Spd_bg_Over_Spd.png"
                    }

                    Image {
                        id: id_Spd_fill
                        x: valuetable.spd_fill_x
                        y: valuetable.spd_fill_y
                        z: 2
                        rotation: valuetable.spd_fill_angle
                        transformOrigin: Item.TopLeft
                        source: "image/speed/Spd_fill.png"
                        visible:true
                    }

                    Image {
                        id: id_Spd_grad
                        x: 0
                        y: 0
                        z: 3
                        antialiasing: true
                        source: "image/speed/Spd_grad.png"
                        visible:valuetable.fuel_temp_view ? true : false
                    }

                }
                /************************************* Tach task start *****************************/
                Rectangle {
                    id: id_Tacho
                    x: 1049
                    y: 41
                    width: 695
                    height: 613
                    color: "transparent"
                    visible:valuetable.centre_blk_view ? true : false
                    transformOrigin: Item.Left
                    scale : 1
                    clip: true
                    z: 1



                    Image {
                        id: id_Tach_bg_Techno_Blue
                        x: 0
                        y: 0
                        z: 0
                        antialiasing: true
                        visible: valuetable.theme_sub_menu_no === 1 &&
                                 basewindow.tach_digit < valuetable.over_tach + 1
                                 ? true : false
                        source: "image/tach/Tach_bg_Techno_Blue.png"
                    }


                    Image {
                        id: id_Tach_bg_Tangerine
                        x: 0
                        y: 0
                        z: 0
                        antialiasing: true
                        visible: valuetable.theme_sub_menu_no === 2 &&
                                 basewindow.tach_digit < valuetable.over_tach + 1
                                 ? true : false
                        source: "image/tach/Tach_bg_Tangerine.png"
                    }

                    Image {
                        id: id_Tach_bg_Deep_Azure
                        x: 0
                        y: 0
                        z: 0
                        antialiasing: true
                        visible: valuetable.theme_sub_menu_no === 3 &&
                                 basewindow.tach_digit < valuetable.over_tach + 1
                                 ? true : false
                        source: "image/tach/Tach_bg_Deep_Azure.png"
                    }

                    Image {
                        id: id_Tach_bg_Over_Spd
                        x: 0
                        y: 0
                        z: 0
                        antialiasing: true
                        visible: basewindow.tach_digit > valuetable.over_tach ? true : false
                        source: "image/tach/Tach_bg_Over_Spd.png"
                    }


        /*            Image {
                        id: id_Tach_bg
                        x: 0
                        y: 0
                        z:0
                        antialiasing: true
                        source: "image/tach/Tach_bg.png"
                    }*/

                    Image {
                        id: id_Tach_fill
                        x: valuetable.tach_fill_x
                        y: valuetable.tach_fill_y
                        rotation: valuetable.tach_fill_angle
                        transformOrigin: Item.TopLeft
                        source: "image/tach/Tach_fill.png"
                        visible:true
                    }

                    Image {
                        id: id_Tach_grad
                        x: 41
                        y: 0
                        antialiasing: true
                        source: "image/tach/Tach_grad.png"
                        visible:valuetable.fuel_temp_view ? true : false
                    }
                }

                /************************************* Speed Tach mask start *****************************/
                Image {
                    id: id_Main_spd_tach_mask
                    x: 0
                    y: 0
                    z: 5
                    source: "image/main/Main_spd_tach_mask.png"


                    Image {
                        id: id_centre_blk
                        x: 105
                        y: 22
                        z: 3
                        antialiasing: true
                        scale: valuetable.centre_scale
                        visible: valuetable.centre_blk_view ? true : false
                        source: "image/main/Main_ctr_blk.png"
                    }

                    Image {
                        id: id_centre_blue
                        x: 523
                        y: 203
                        z: 4
                        antialiasing: true
                        scale: valuetable.centre_blue_scale
                        visible: valuetable.centre_blk_view ? true : false
                        source: "image/main/Main_ctr_blue.png"
                    }

                    TextEdit {
                        id: id_Spd_Digital
                        x: 174
                        y: 295
                        z: 5
                        width: 205
                        height: 90
                        color: "#ffffff"
                        text: valuetable.speed_dig
                        visible: valuetable.fuel_temp_view ? true : false
                        scale : 1
                        antialiasing: true
                        transformOrigin: Item.TopLeft
                        font.pixelSize: valuetable.sp_th_fontscale * 135
                        font.family: "Sony Sketch EF"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight

                        TextEdit {
                            id: label_Speed
                            x: 77
                            y: (valuetable.sp_th_fontscale) * 93
                            width: 71
                            height: 25
                            text: qsTr("km/h")
                            antialiasing: true
                            font.bold: true
                            font.pixelSize: valuetable.sp_th_fontscale * 26
                            font.family: "Nexa Bold"
                            visible: true
                            color: "#ffffff"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.Center
                        }
                    }

                    TextEdit {
                        id: id_Tach_Digital
                        x: 1350//1370
                        y: 294
                        z: 5
                        width: 180
                        height: 90
                        color: "#ffffff"
                        text: valuetable.tach_dig.toFixed(1)
                        visible: valuetable.fuel_temp_view ? true : false
                        antialiasing: true
                        transformOrigin: Item.TopRight
                        scale: 1
                        font.pixelSize: valuetable.sp_th_fontscale * 135
                        font.family: "Sony Sketch EF"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight

                        TextEdit {
                            id: label_Tach
                            x: 28
                            y: (valuetable.sp_th_fontscale) * 99
                            width: 114
                            height: 25
                            text: qsTr("x1000")
                            font.pixelSize: valuetable.sp_th_fontscale * 35
                            antialiasing: true
                            font.family: "Sony Sketch EF"
                            visible: true
                            color: "#ffffff"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.Center
                        }

                        TextEdit {
                            id: label_Tach_rpm
                            x: 52
                            y: (valuetable.sp_th_fontscale) * 121
                            width: 63
                            height: 25
                            text: qsTr("rpm")
                            antialiasing: true
                            font.bold: true
                            font.pixelSize: valuetable.sp_th_fontscale * 24
                            font.family: "Nexa Bold"
                            visible: true
                            color: "#ffffff"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.Center
                        }
                    }
                    TextEdit {
                        id: id_Odo_value
                        x: 70//120
                        y: 510
                        width: 313
                        height: 37
                        color: "#ffffff"
                        text: "12345.6"
                        scale : 0.8
                        visible: valuetable.main_menu_no === 0 ? false : true//valuetable.fuel_temp_view ? true : false
                        z: 5
                        font.pixelSize: 60
                        font.family: "Sony Sketch EF"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignRight


                        TextEdit {
                            id: label_odo
                            x: 100//84
                            y: -35
                            width: 93
                            height: 25
                            color: "#ffffff"
                            text: qsTr("ODO")
                            font.bold: false
                            visible: true
                            font.pixelSize: 45
                            font.family: "Sony Sketch EF"
                            horizontalAlignment: Text.Center
                            verticalAlignment: Text.AlignVCenter
                        }

                        TextEdit {
                            id: label_odo_km
                            x: 321
                            y: 5
                            width: 56
                            height: 40
                            color: "#ffffff"
                            text: qsTr("km")
                            font.bold: true
                            font.family: "Nexa Bold"
                            visible: true
                            font.pointSize: 30
                        }
                    }

                }

                /*********************************** Hiline ***************************/
                Rectangle {
                    id: id_hi_line
                    x: valuetable.hi_line_clip_x
                    y: valuetable.hi_line_clip_y
                    width: valuetable.hi_line_siz_x
                    height: valuetable.hi_line_siz_y
                    color: "transparent"
                    visible: valuetable.line_view ||
                             valuetable.fuel_temp_view ? true : false
                    transformOrigin: Item.Center | Item.Bottom
                    scale : 1
                    clip: valuetable.hi_line_clip
                    z: 5

                    Image {
                        id: id_img_hi_line
                        x: valuetable.hi_line_x
                        y: valuetable.hi_line_y
                        visible: valuetable.centre_blk_view ? true : false
                        z: 0
                        transformOrigin: Item.Center
                        antialiasing: true
                        scale: 1
                        source: "image/main/up_line.png"
                    }

                    Image {
                        id: id_img_hi_chrome
                        x: 0
                        y: 1
                        visible: valuetable.chrome_view ? true : false
                        z: 1
                        transformOrigin: Item.Center
                        antialiasing: true
                        opacity : valuetable.chrome_opac
                        scale: 1
                        source: "image/main/up_chrome.png"
                    }

                    Rectangle {
                        id: id_hiline_values
                        x: 0
                        y: -20
                        width: 675
                        height: 124
                        color: "transparent"
                        z: 0
                        visible: valuetable.fuel_temp_view ? true : false


                        TextEdit {
                            id: id_hiline_Odo_value
                            x: 160//203
                            y: 56
                            width: 286
                            height: 34
                            color: "#ffffff"
                            text: "12345.6"
                            visible: true
                            z: 10
                            font.pixelSize: 45
                            font.family: "Sony Sketch EF"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignRight


                            TextEdit {
                                id: label_hiline_odo
                                x: 110//100
                                y: -32
                                width: 93
                                height: 25
                                color: "#ffffff"
                                text: qsTr("ODO")
                                z: 0
                                font.bold: false
                                visible: true
                                font.pixelSize: 30
                                font.family: "Sony Sketch EF"
                                horizontalAlignment: Text.Center
                                verticalAlignment: Text.AlignVCenter
                            }

                            TextEdit {
                                id: label_hiline_odo_km
                                x: 297
                                y: 10
                                width: 38
                                height: 32
                                color: "#ffffff"
                                text: qsTr("km")
                                font.bold: true
                                font.family: "Nexa Bold"
                                visible: true
                                font.pointSize: 20
                            }
                        }


                        TextEdit {
                            id: label_hiline_OAT_temp_Digital
                            x: 95//55
                            y: 3
                            z: 1
                            width: 48
                            height: 25
                            text: qsTr("32")
                            font.pixelSize: 35
                            font.family: "Sony Sketch EF"
                            visible: true
                            color: "#ffffff"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.Center
                        }

                        TextEdit {
                            id: label_hiline_time_Digital
                            x: 495
                            y: 6
                            z: 1
                            width: 118
                            height: 25
                            text: qsTr("13:08")
                            font.pixelSize: 34
                            font.family: "Sony Sketch EF"
                            visible: true
                            color: "#ffffff"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.Center
                        }

                        TextEdit {
                            id: label_hiline_dir_Digital
                            x: 190//150
                            y: 59
                            z: 1
                            width: 29
                            height: 22
                            text: valuetable.compassdir//qsTr("TY")
                            font.pixelSize: (valuetable.compassdir === ( "N" || "S" || "W" || "E" )) ? 30 : 27
                            font.family: "Sony Sketch EF"
                            visible: true
                            color: "#ffffff"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.Center
                        }

                        Image {
                            id: id_img_hiline_compass
                            x: 142//102
                            y: 3
                            source: "image/main/hiline_compass.png"
                        }

                    }

                }

                /*********************************** Lowline ***************************/
                Rectangle {
                    id: id_low_line
                    x: valuetable.low_line_clip_x
                    y: valuetable.low_line_clip_y//523
                    width: valuetable.low_line_siz_x
                    height: valuetable.low_line_siz_y
                    color: "transparent"
                    visible: valuetable.line_view ? true : false
                    transformOrigin: Item.Center
                    scale : 1
                    clip: true
                    z: 5

                    Image {
                        id: id_img_low_line
                        x: valuetable.low_line_x
                        y: 0
                        z: 0
                        transformOrigin: Item.Center
                        antialiasing: true
                        scale: 1
                        visible: valuetable.centre_blk_view ? true : false
                        source: "image/main/low_line.png"
                    }

                    Image {
                        id: id_img_low_chrome
                        x: 0
                        y: 1
                        z: 1
                        transformOrigin: Item.Center
                        antialiasing: true
                        opacity : valuetable.chrome_opac
                        scale: 1
                        visible: valuetable.chrome_view ? true : false
                        source: "image/main/low_chrome.png"
                    }

                }

                /********************************** Fuel Temp task **************************/
                Rectangle {
                    id: id_Fuel_Temp
                    x:474
                    y:valuetable.low_line_clip_y//520
                    width: 838
                    height: 152
                    color: "transparent"
                    visible: valuetable.fuel_temp_view ? true : false
                    //     transformOrigin: Item.Center
                    scale : 1
                    clip: true
                    z: 6

                    Image {
                        id: id_img_fuel_bg
                        x: 71
                        y: 39
                        z: 0
                        transformOrigin: Item.Center
                        antialiasing: true
                        scale: 1
                        visible:( valuetable.fuel > valuetable.fuel_low - 1 ) ? true : false
                        source: "image/fuel/Fuel_bg.png"
                    }

                    Image {
                        id: id_img_fuel_red_bg
                        x: 71
                        y: 39
                        z: 0
                        transformOrigin: Item.Center
                        antialiasing: true
                        scale: 1
                        visible: valuetable.fuel < valuetable.fuel_low ? true : false
                        source: "image/fuel/Fuel_Red_bg.png"
                    }


                    Image {
                        id: id_img_fuel_fill
                        x: 72
                        y: valuetable.fuel_fill_y
                        z: 2
                        width:232
                        height:111
                        transformOrigin: Item.Center
                        antialiasing: true
                        scale: 1
                        visible: true
                        source: "image/fuel/Fuel_fill.png"
                    }


                    Image {
                        id: id_img_temp_bg
                        x: 539
                        y: 39
                        z: 0
                        transformOrigin: Item.Center
                        antialiasing: true
                        scale: 1
                        visible: valuetable.temp < valuetable.temp_Over ? true : false
                        source: "image/temp/Temp_bg.png"
                    }

                    Image {
                        id: id_img_temp_red_bg
                        x: 539
                        y: 39
                        z: 0
                        transformOrigin: Item.Center
                        antialiasing: true
                        scale: 1
                        visible: valuetable.temp > valuetable.temp_Over + 1 ? true : false
                        source: "image/temp/Temp_Red_bg.png"
                    }

                    Image {
                        id: id_img_temp_fill
                        x: 537
                        y: valuetable.temp_fill_y
                        z: 2
                        width:232
                        height:111
                        transformOrigin: Item.Center
                        antialiasing: true
                        scale: 1
                        visible: true
                        source: "image/temp/Temp_fill.png"
                    }

                    Image {
                        id: id_img_temp_fuel_mask
                        x: 0
                        y: 0
                        z: 3
                        transformOrigin: Item.Center
                        antialiasing: true
                        scale: 1
                        visible: true
                        source: "image/main/Temp_fuel.png"
                    }

                    TextEdit {
                        id: label_gear
                        x: 387
                        y: 80
                        z: 3
                        width: 65
                        height: 51
                        text: valuetable.gear_input//qsTr("N")
                        font.pixelSize: 50
                        font.family: "Sony Sketch EF"
                        visible: true
                        color: "#ffffff"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.Center
                    }
                }

        /*        Image {
                    id: id_Ref
                    x: 0
                    y: 0
                    z:25
                    antialiasing: true
                    source: "image/Reference_main.png"
                    scale:1
                    visible:true
                    opacity:0.3
                }*/

                Image {
                    id: id_fuel_ife
                    x: 1386//1326
                    y: 528
                    z: 5
                    visible: valuetable.fuel_temp_view ? true : false
                    source: "image/fuel/Fuel_icon.png"

                    TextEdit {
                        id: label_fuel_ife
                        x: 34
                        y: 2
                        width: 146
                        height: 26
                        color: "#ffffff"
                        text: qsTr("IFE - 10")
                        font.bold: false
                        visible: true
                        font.pixelSize: 40
                        font.family: "Sony Sketch EF"
                        horizontalAlignment: Text.Center
                        verticalAlignment: Text.AlignVCenter
                    }

                    TextEdit {
                        id: label_fuel_ife_kml
                        x: 180
                        y: 5
                        width: 61
                        height: 28
                        color: "#ffffff"
                        text: qsTr("km/l")
                        font.bold: true
                        visible: true
                        font.family: "Nexa Bold"
                        font.pointSize: 20
                    }
                }
            }



            /********************************** Hi line menu task **************************/
            Rectangle {
                id: id_hi_line_menu
                x: 664
                y: valuetable.hi_line_menu_clip_y
                width: 485
                height: 92
                color: "transparent"
                visible: valuetable.main_menu_no === 0 ? false : true
                transformOrigin: Item.Center
                scale : 1
               // clip: true
                z: 5

                Image {
                    id: id_img_hi_line_menu
                    x: -10
                    y: 19
                    z: 0
                    transformOrigin: Item.Center
                    antialiasing: true
                    scale: 1
                    visible: true
                    source: "image/main/up_chrome_menu.png"
                }

                TextEdit {
                    id: label_OAT_temp_Digital
                    x: 82
                    y: 32
                    z: 1
                    width: 52
                    height: 25
                    text: qsTr("32")
                    font.pixelSize: 35
                    font.family: "Sony Sketch EF"
                    visible: true
                    color: "#ffffff"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.Center
                }

                TextEdit {
                    id: label_time_Digital
                    x: 290
                    y: 32
                    z: 1
                    width: 118
                    height: 25
                    text: qsTr("13:08")
                    font.pixelSize: 35
                    font.family: "Sony Sketch EF"
                    visible: true
                    color: "#ffffff"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.Center
                }

                TextEdit {
                    id: label_dir_Digital
                    x: 216
                    y: 28
                    z: 1
                    width: 29
                    height: 22
                    text: valuetable.compassdir//qsTr("TY")
                    font.pixelSize: (valuetable.compassdir === ( "N" || "S" || "W" || "E" )) ? 30 : 27
                    font.family: "Sony Sketch EF"
                    visible: true
                    color: "#ffffff"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.Center
                }

                Image {
                    id: id_img_hiline_menu_compass
                    x: 133
                    y: 0
                    source: "image/main/hiline_menu_compass.png"
                }
            }

            /********************************** Fuel Temp menu task **************************/
            Rectangle {
                id: id_low_line_menu
                x: 477
                y: valuetable.low_line_menu_clip_y
                width: 832
                height: 114
                color: "transparent"
                visible: valuetable.main_menu_no === 0 ? false : true
                transformOrigin: Item.Center
                scale : 1
                clip: true
                z: 5

                Image {
                    id: id_img_low_line_menu
                    x: 0
                    y: 0
                    z: 0
                    transformOrigin: Item.Center
                    antialiasing: true
                    scale: 1
                    visible: true
                    source: "image/main/Temp_fuel_menu.png"
                }

                TextEdit {
                    id: label_fuel_Digital
                    x: 527
                    y: 57
                    z: 1
                    width: 74
                    height: 36
                    text: qsTr("50")//valuetable.fuel_dig//qsTr("50")
                    font.pixelSize: 50
                    font.family: "Sony Sketch EF"
                    visible: true
                    color: "#ffffff"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.Center
                }

                TextEdit {
                    id: label_temp_Digital
                    x: 182
                    y: 57
                    z: 1
                    width: 74
                    height: 36
                    text: qsTr("40")//valuetable.temp_dig//qsTr("80")
                    font.pixelSize: 50
                    font.family: "Sony Sketch EF"
                    visible: true
                    color: "#ffffff"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.Center
                }

                TextEdit {
                    id: label_gear_menu
                    x: 387
                    y: 53
                    z: 1
                    width: 59
                    height: 36
                    text: valuetable.gear_input//qsTr("N")
                    font.pixelSize: 50
                    font.family: "Sony Sketch EF"
                    visible: true
                    color: "#ffffff"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.Center
                }

                TextEdit {
                    id: label_temp_Degree
                    x: 254
                    y: 54
                    width: 11
                    height: 11
                    color: "#ffffff"
                    text: qsTr("0")//valuetable.temp_dig
                    z: 1
                    visible: true
                    font.pixelSize: 10
                    font.family: "Sony Sketch EF"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.Center
                }
            }


            /************************************* Self check task end *****************************/

            /******************************************** Main Menu start******************************************/
            Rectangle {
                id: id_Main_menu
                x: valuetable.menu_x
                y: 227
                width: 525
                height: 244
                color: "transparent"
                transformOrigin: Item.Left
                scale : 1//valuetable.menu_scale
                clip: true
                visible:valuetable.main_menu_no === 1 ? true : false
                z: 6

                Image {
                    id: id_Menu_sel_hilit
                    x: -395
                    y: -341
                    scale: valuetable.menu_ent_hilit_scale
                    z: 0
                    visible: valuetable.ent_menu_no === 1 ? true : false
                    source: "image/menu/menu_sel_hilit.png"
                }

                Image {
                    id: id_Menu_sel_all
                    x: -395
                    y: -1
                    z: 0
                    source: "image/menu/Menu_sel_all.png"
                    visible: valuetable.tmp_sub_menu_no === 1 || valuetable.tmp_sub_menu_no === 2 ? true : false
                }


                Image {
                    id: id_Menu_thin_hilit
                    x: -433
                    y: -376
                    scale: valuetable.menu_thin_hilit_scale
                    z: 0
                    source: "image/menu/Menu_thin_hilit.png"
                    visible: valuetable.tmp_sub_menu_no === 1 ? true : false
                }


                Image {
                    id: id_Menu_thick_hilit
                    x: -438
                    y: -375
                    scale: valuetable.menu_thik_hilit_scale
                    source: "image/menu/Menu_thick_hilit.png"
                    visible: valuetable.tmp_sub_menu_no === 1 ? true : false
                }


                Image {
                    id: id_Main_menu1
                    x: 0
                    y: 0
                    z: 1
                    source: "image/menu/menu3/menu3_sel1.png"
                    visible: valuetable.sub_menu_no === 1 && valuetable.tmp_sub_menu_no === 1 ? true : false

                    TextEdit {
                        id: label_main_menu_function1
                        x: 250
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Functions")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_main_menu_theme1
                        x: 250
                        y: 105
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Themes")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_main_menu_sett1
                        x: 250
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Settings")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Main_desel_menu1
                    x: 0
                    y: 0
                    z: 1
                    source: "image/menu/menu3/menu3_desel1.png"
                    visible: valuetable.sub_menu_no === 1 && valuetable.tmp_sub_menu_no === 2 ? true : false

                    TextEdit {
                        id: label_main_menu_function
                        x: 250
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Functions")
                        z: 9
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Main_menu2
                    x: 0
                    y: 0
                    z: 2
                    source: "image/menu/menu3/menu3_sel2.png"
                    visible: valuetable.sub_menu_no === 2 && valuetable.tmp_sub_menu_no === 1 ? true : false

                    TextEdit {
                        id: label_main_menu_function2
                        x: 250
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Functions")
                        z: 9
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_main_menu_theme2
                        x: 250
                        y: 105
                        z: 9
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Themes")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_main_menu_sett2
                        x: 250
                        y: 190
                        z: 9
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Settings")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Main_desel_menu2
                    x: 0
                    y: 0
                    z: 2
                    source: "image/menu/menu3/menu3_desel2.png"
                    visible: valuetable.sub_menu_no === 2 && valuetable.tmp_sub_menu_no === 2 ? true : false

                    TextEdit {
                        id: label_main_menu_theme
                        x: 250
                        y: 105
                        z: 9
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Themes")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                }

                Image {
                    id: id_Main_menu3
                    x: 0
                    y: 0
                    z: 3
                    source: "image/menu/menu3/menu3_sel3.png"
                    visible: valuetable.sub_menu_no === 3 && valuetable.tmp_sub_menu_no === 1 ? true : false

                    TextEdit {
                        id: label_main_menu_function3
                        x: 250
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Functions")
                        z: 9
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_main_menu_theme3
                        x: 250
                        y: 105
                        z: 9
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Themes")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_main_menu_sett3
                        x: 250
                        y: 190
                        z: 9
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Settings")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Main_desel_menu3
                    x: 0
                    y: 0
                    z: 3
                    source: "image/menu/menu3/menu3_desel3.png"
                    visible: valuetable.sub_menu_no === 3 && valuetable.tmp_sub_menu_no === 2 ? true : false

                    TextEdit {
                        id: label_main_menu_sett
                        x: 250
                        y: 190
                        z: 9
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Settings")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                }

                Image {
                    id: id_Menu_glow
                    x: -8
                    y: 43
                    z: 4
                    opacity: valuetable.menu_glow_opac
                    scale : (valuetable.menu_scale)*(valuetable.menu_scale_factor)//valuetable.circle_scale
                    source: "image/menu/Menu_glow.png"
                    visible: true
                }

                Image {
                    id: id_Menu_dot_circle
                    x: 23
                    y: 73
                    z: 5
                    scale : (valuetable.menu_scale)*(valuetable.menu_scale_factor)//valuetable.circle_scale
                    source: "image/menu/Menu_dot_circle.png"
                    visible: true
                }

                Image {
                    id: id_Mode_fun
                    x: 33
                    y: 88
                    z: 6
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    source: "image/menu/Mode_fun.png"
                    scale: (valuetable.menu_scale)*(valuetable.menu_scale_factor)
                    visible: valuetable.sub_menu_no === 1 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.sub_menu_no === 1 ? true : false
                    }
                }

                Image {
                    id: id_Mode_theme
                    x: 43
                    y: 88
                    z: 7
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    source: "image/menu/Mode_theme.png"
                    scale: (valuetable.menu_scale)*(valuetable.menu_scale_factor)
                    visible: valuetable.sub_menu_no === 2 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.sub_menu_no === 2 ? true : false
                    }
                }

                Image {
                    id: id_Mode_set
                    x: 40
                    y: 93
                    z: 8
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    source: "image/menu/Mode_set.png"
                    scale: (valuetable.menu_scale)*(valuetable.menu_scale_factor)
                    visible: valuetable.sub_menu_no === 3 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.sub_menu_no === 3 ? true : false
                    }
                }
            }
            /************************************* Main menu end *******************************/

            /************************************* Func menu start *******************************/
            Rectangle {
                id: id_Func_menu
                x: valuetable.func_menu_x
                y: 227
                width: 918
                height: 244
                color: "transparent"
                z: 8
                clip: true
                scale: 1//valuetable.func_menu_scale
                visible : valuetable.main_menu_no === 2 ? true : false

                Image {
                    id: id_Func_menu_sel_hilit
                    x: 1
                    y: -336
                    z: 0
                    scale: valuetable.menu_ent_hilit_scale
                    visible: valuetable.ent_menu_no === 1 ? true : false
                    source: "image/menu/menu_sel_hilit.png"
                }

                Image {
                    id: id_Func_menu_sel_all
                    x: 0
                    y: 0
                    z: 0
                    scale: 1
                    source: "image/menu/Menu_sel_all.png"
                    visible: valuetable.tmp_sub_menu_no === 1 || valuetable.tmp_sub_menu_no === 2  ? true : false
                }

                Image {
                    id: id_Func_menu_thin_hilit
                    x: -37
                    y: -374
                    z: 0
                    scale: valuetable.menu_thin_hilit_scale
                    source: "image/menu/Menu_thin_hilit.png"
                    visible: valuetable.tmp_sub_menu_no === 1 ? true : false
                }

                Image {
                    id: id_Func_menu_thick_hilit
                    x: -41
                    y: -373
                    z: 0
                    scale: valuetable.menu_thik_hilit_scale
                    source: "image/menu/Menu_thick_hilit.png"
                    visible: valuetable.tmp_sub_menu_no === 1 ? true : false
                }

                Image {
                    id: id_Func_menu1
                    x: 0
                    y: 0
                    z: 1
                    source: "image/menu/menu4/menu4_sel1.png"
                    visible: (valuetable.func_sub_menu_no === 1 && valuetable.tmp_sub_menu_no === 1) ? true : false

                    TextEdit {
                        id: label_func_Navigation1
                        x: 76
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Navigation")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_func_Phonebook1
                        x: 76
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Phonebook")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                   TextEdit {
                       id: label_func_TripComp1
                       x: 681
                       y: 20
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Trip Comp")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }

                   TextEdit {
                       id: label_func_TPMS1
                       x: 681
                       y: 190
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("TPMS")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }

                Image {
                    id: id_Func_desel_menu1
                    x: 0
                    y: 0
                    z: 1
                    source: "image/menu/menu4/menu4_desel1.png"
                    visible: valuetable.func_sub_menu_no === 1 && valuetable.tmp_sub_menu_no === 2 ? true : false

                    TextEdit {
                        id: label_func_Navigation_sel
                        x: 76
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Navigation")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Func_menu2
                    x: 0
                    y: 0
                    z: 3
                    source: "image/menu/menu4/menu4_sel2.png"
                    visible: valuetable.func_sub_menu_no === 2 && valuetable.tmp_sub_menu_no === 1 ? true : false

                    TextEdit {
                        id: label_func_Navigation2
                        x: 76
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Navigation")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_func_Phonebook2
                        x: 76
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Phonebook")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                   TextEdit {
                       id: label_func_TripComp2
                       x: 681
                       y: 20
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Trip Comp")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }

                   TextEdit {
                       id: label_func_TPMS2
                       x: 681
                       y: 190
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("TPMS")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }

                Image {
                    id: id_Func_desel_menu2
                    x: 0
                    y: 0
                    z: 4
                    source: "image/menu/menu4/menu4_desel2.png"
                    visible: valuetable.func_sub_menu_no === 2 && valuetable.tmp_sub_menu_no === 2 ? true : false

                    TextEdit {
                        id: label_func_Phonebook_sel
                        x: 76
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Phonebook")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Func_menu3
                    x: 0
                    y: 0
                    z: 5
                    source: "image/menu/menu4/menu4_sel3.png"
                    visible: valuetable.func_sub_menu_no === 3 && valuetable.tmp_sub_menu_no === 1 ? true : false

                    TextEdit {
                        id: label_func_Navigation3
                        x: 76
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Navigation")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_func_Phonebook3
                        x: 76
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Phonebook")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                   TextEdit {
                       id: label_func_TripComp3
                       x: 681
                       y: 20
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Trip Comp")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }

                   TextEdit {
                       id: label_func_TPMS3
                       x: 681
                       y: 190
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("TPMS")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }

                Image {
                    id: id_Func_desel_menu3
                    x: 0
                    y: 0
                    z: 6
                    source: "image/menu/menu4/menu4_desel3.png"
                    visible: valuetable.func_sub_menu_no === 3 && valuetable.tmp_sub_menu_no === 2 ? true : false

                    TextEdit {
                        id: label_func_TPMS_sel
                        x: 681
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("TPMS")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Func_menu4
                    x: 0
                    y: 0
                    z: 7
                    source: "image/menu/menu4/menu4_sel4.png"
                    visible: valuetable.func_sub_menu_no === 4 && valuetable.tmp_sub_menu_no === 1 ? true : false

                    TextEdit {
                        id: label_func_Navigation4
                        x: 76
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Navigation")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_func_Phonebook4
                        x: 76
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Phonebook")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                   TextEdit {
                       id: label_func_TripComp4
                       x: 681
                       y: 20
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Trip Comp")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }

                   TextEdit {
                       id: label_func_TPMS4
                       x: 681
                       y: 190
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("TPMS")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }

                Image {
                    id: id_Func_desel_menu4
                    x: 0
                    y: 0
                    z: 8
                    source: "image/menu/menu4/menu4_desel4.png"
                    visible: valuetable.func_sub_menu_no === 4 && valuetable.tmp_sub_menu_no === 2 ? true : false

                    TextEdit {
                        id: label_func_TripComp_sel
                        x: 681
                        y: 20
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Trip Comp")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Func_menu_glow
                    x: 383
                    y: 46
                    z: 9
                    scale: (valuetable.func_menu_scale)*(valuetable.menu_scale_factor)//valuetable.circle_scale
                    opacity: valuetable.menu_glow_opac
                    source: "image/menu/Menu_glow.png"
                    visible: true
                }

                Image {
                    id: id_Func_menu_dot_circle
                    x: 414
                    y: 77
                    z: 10
                    scale:(valuetable.func_menu_scale)*(valuetable.menu_scale_factor)//valuetable.circle_scale
                    source: "image/menu/Menu_dot_circle.png"
                    visible: true
                }

                Image {
                    id: id_Func_mode_GPS
                    x: 441
                    y: 90
                    z: 11
                    source: "image/menu/Mode_GPS.png"
                    scale:(valuetable.func_menu_scale)*(valuetable.menu_scale_factor)
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    visible: valuetable.func_sub_menu_no === 1 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.func_sub_menu_no === 1 ? true : false
                    }
                }

                Image {
                    id: id_Func_mode_phbook
                    x: 442
                    y: 91
                    width: 36
                    height: 61
                    z: 12
                    source: "image/menu/Mode_phbook.png"
                    scale:(valuetable.func_menu_scale)*(valuetable.menu_scale_factor)
                    transform: Rotation { origin.x: 30; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    visible: valuetable.func_sub_menu_no === 2 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.func_sub_menu_no === 2 ? true : false
                    }
                }

                Image {
                    id: id_Func_mode_tpms
                    x: 425
                    y: 96
                    z: 13
                    source: "image/menu/Mode_tpms.png"
                    scale:(valuetable.func_menu_scale)*(valuetable.menu_scale_factor)
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    visible: valuetable.func_sub_menu_no === 3 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.func_sub_menu_no === 3 ? true : false
                    }
                }

                Image {
                    id: id_Func_mode_trip
                    x: 425
                    y: 99
                    z: 14
                    source: "image/menu/Mode_trip.png"
                    scale:(valuetable.func_menu_scale)*(valuetable.menu_scale_factor)
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    visible: valuetable.func_sub_menu_no === 4 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.func_sub_menu_no === 4 ? true : false
                    }
                }
            }
            /******************************************** Func Menu end******************************************/

            /******************************************** theme Menu start******************************************/
            Rectangle {
                id: id_Theme_menu
                x: valuetable.theme_menu_x
                y: 227
                width: 525
                height: 244
                color: "transparent"
                transformOrigin: Item.Left
                scale : 1//valuetable.theme_menu_scale
                clip: true
                visible:valuetable.main_menu_no === 3 ? true : false
                z: 8

                Image {
                    id: id_Theme_menu_sel_hilit
                    x: -395
                    y: -341
                    scale: valuetable.menu_ent_hilit_scale
                    z: 0
                    visible: valuetable.ent_menu_no === 1 ? true : false
                    source: "image/menu/menu_sel_hilit.png"
                }

                Image {
                    id: id_Theme_menu_sel_all
                    x: -395
                    y: -1
                    z: 0
                    source: "image/menu/Menu_sel_all.png"
                    visible: valuetable.tmp_sub_menu_no === 1 || valuetable.tmp_sub_menu_no === 2  ? true : false
                }


                Image {
                    id: id_Theme_menu_thin_hilit
                    x: -433
                    y: -376
                    scale: valuetable.menu_thin_hilit_scale
                    z: 0
                    source: "image/menu/Menu_thin_hilit.png"
                    visible: valuetable.tmp_sub_menu_no === 1 ? true : false
                }


                Image {
                    id: id_Theme_menu_thick_hilit
                    x: -438
                    y: -375
                    z: 0
                    scale: valuetable.menu_thik_hilit_scale
                    source: "image/menu/Menu_thick_hilit.png"
                    visible: valuetable.tmp_sub_menu_no === 1 ? true : false
                }

                Image {
                    id: id_Theme_menu1
                    x: 0
                    y: 0
                    z: 1
                    source: "image/menu/menu3/menu3_sel1.png"
                    visible: (valuetable.theme_sub_menu_no === 1 && valuetable.tmp_sub_menu_no === 1) ? true : false

                    TextEdit {
                        id: label_theme_theme11
                        x: 250
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Techno Blue")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_theme_theme21
                        x: 250
                        y: 105
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Tangerine")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                   TextEdit {
                       id: label_theme_theme31
                       x: 250
                       y: 190
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Deep Azure")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }



                Image {
                    id: id_Theme_desel_menu1
                    x: 0
                    y: 0
                    z: 1
                    source: "image/menu/menu3/menu3_desel1.png"
                    visible: (valuetable.theme_sub_menu_no === 1 && valuetable.tmp_sub_menu_no === 2) ? true : false

                    TextEdit {
                        id: label_theme_theme1_sel
                        x: 250
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Techno Blue")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Theme_menu2
                    x: 0
                    y: 0
                    z: 1
                    source: "image/menu/menu3/menu3_sel2.png"
                    visible: (valuetable.theme_sub_menu_no === 2 && valuetable.tmp_sub_menu_no === 1) ? true : false

                    TextEdit {
                        id: label_theme_theme12
                        x: 250
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Techno Blue")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_theme_theme22
                        x: 250
                        y: 105
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Tangerine")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                   TextEdit {
                       id: label_theme_theme32
                       x: 250
                       y: 190
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Deep Azure")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }

                Image {
                    id: id_Theme_desel_menu2
                    x: 0
                    y: 0
                    z: 1
                    source: "image/menu/menu3/menu3_desel2.png"
                    visible: valuetable.theme_sub_menu_no === 2 && valuetable.tmp_sub_menu_no === 2 ? true : false

                    TextEdit {
                        id: label_theme_theme2_sel
                        x: 250
                        y: 105
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Tangerine")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Theme_menu3
                    x: 0
                    y: 0
                    z: 1
                    source: "image/menu/menu3/menu3_sel3.png"
                    visible: (valuetable.theme_sub_menu_no === 3 && valuetable.tmp_sub_menu_no === 1)? true : false

                    TextEdit {
                        id: label_theme_theme13
                        x: 250
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Techno Blue")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_theme_theme23
                        x: 250
                        y: 105
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Tangerine")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                   TextEdit {
                       id: label_theme_theme33
                       x: 250
                       y: 190
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Deep Azure")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }

                Image {
                    id: id_Theme_desel_menu3
                    x: 0
                    y: 0
                    z: 1
                    source: "image/menu/menu3/menu3_desel3.png"
                    visible: valuetable.theme_sub_menu_no === 3 && valuetable.tmp_sub_menu_no === 2 ? true : false

                   TextEdit {
                       id: label_theme_theme3_sel
                       x: 250
                       y: 190
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Deep Azure")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }

                Image {
                    id: id_Theme_menu_glow
                    x: -8
                    y: 43
                    z: 4
                    opacity: valuetable.menu_glow_opac
                    scale: (valuetable.theme_menu_scale) * (valuetable.menu_scale_factor)//valuetable.circle_scale
                    source: "image/menu/Menu_glow.png"
                    visible: true
                }

                Image {
                    id: id_Theme_menu_dot_circle
                    x: 23
                    y: 73
                    z: 5
                    scale: (valuetable.theme_menu_scale) * (valuetable.menu_scale_factor)//valuetable.circle_scale
                    source: "image/menu/Menu_dot_circle.png"
                    visible: true
                }

                Image {
                    id: id_Theme_mode_theme1
                    x: 43
                    y: 88
                    z: 6
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    scale: (valuetable.theme_menu_scale) * (valuetable.menu_scale_factor)
                    source: "image/menu/Mode_theme.png"
                    visible: valuetable.theme_sub_menu_no === 1 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.theme_sub_menu_no === 1 ? true : false
                    }
                }

                Image {
                    id: id_Theme_theme2
                    x: 43
                    y: 88
                    z: 7
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    scale: (valuetable.theme_menu_scale) * (valuetable.menu_scale_factor)
                    source: "image/menu/Mode_theme.png"
                    visible: valuetable.theme_sub_menu_no === 2 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.theme_sub_menu_no === 2 ? true : false
                    }
                }

                Image {
                    id: id_Theme_theme3
                    x: 43
                    y: 88
                    z: 8
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    scale: (valuetable.theme_menu_scale) * (valuetable.menu_scale_factor)
                    source: "image/menu/Mode_theme.png"
                    visible: valuetable.theme_sub_menu_no === 3 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.theme_sub_menu_no === 3 ? true : false
                    }
                }
            }

            /************************************* Theme menu end *******************************/

            /************************************* set menu start *******************************/
            Rectangle {
                id: id_Set_menu
                x: 430
                y: 227
                width: 918
                height: 244
                color: "transparent"
                z: 8
                clip: true
                scale: 1//(valuetable.set_menu_scale) * (valuetable.menu_scale_factor)
                visible : valuetable.main_menu_no === 4 ? true : false

                Image {
                    id: id_Set_menu_sel_hilit
                    x: 1
                    y: -336
                    z: 0
                    scale: valuetable.menu_ent_hilit_scale
                    visible: valuetable.ent_menu_no === 1 ? true : false
                    source: "image/menu/menu_sel_hilit.png"
                }

                Image {
                    id: id_Set_menu_sel_all
                    x: 0
                    y: 0
                    z: 0
                    scale: 1
                    source: "image/menu/Menu_sel_all.png"
                    visible: valuetable.tmp_sub_menu_no === 1 || valuetable.tmp_sub_menu_no === 2  ? true : false
                }

                Image {
                    id: id_Set_menu_thin_hilit
                    x: -37
                    y: -374
                    z: 0
                    scale: valuetable.menu_thin_hilit_scale
                    source: "image/menu/Menu_thin_hilit.png"
                    visible: valuetable.tmp_sub_menu_no === 1 ? true : false
                }

                Image {
                    id: id_Set_menu_thick_hilit
                    x: -41
                    y: -373
                    z: 0
                    scale: valuetable.menu_thik_hilit_scale
                    source: "image/menu/Menu_thick_hilit.png"
                    visible: valuetable.tmp_sub_menu_no === 1 ? true : false
                }

                Image {
                    id: id_Set_menu1
                    x: 0
                    y: 0
                    z: 1
                    source: "image/menu/menu4/menu4_sel1.png"
                    visible: valuetable.set_sub_menu_no === 1 &&
                             valuetable.tmp_sub_menu_no === 1 ? true : false

                    TextEdit {
                        id: label_Set_Display1
                        x: 60
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Display Settings")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_Set_Service1
                        x: 76
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Service")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                   TextEdit {
                       id: label_Set_Safety1
                       x: 681
                       y: 20
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Safety")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }

                   TextEdit {
                       id: label_Set_Sound1
                       x: 681
                       y: 190
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Sound")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }

                Image {
                    id: id_Set_desel_menu1
                    x: 0
                    y: 0
                    z: 1
                    source: "image/menu/menu4/menu4_desel1.png"
                    visible: valuetable.set_sub_menu_no === 1 && valuetable.tmp_sub_menu_no === 2 ? true : false

                    TextEdit {
                        id: label_Set_Display_sel
                        x: 60
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Display Settings")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Set_menu2
                    x: 0
                    y: 0
                    z: 3
                    source: "image/menu/menu4/menu4_sel2.png"
                    visible: valuetable.set_sub_menu_no === 2 &&
                             valuetable.tmp_sub_menu_no === 1 ? true : false

                    TextEdit {
                        id: label_Set_Display2
                        x: 60
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Display Settings")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_Set_Service2
                        x: 76
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Service")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                   TextEdit {
                       id: label_Set_Safety2
                       x: 681
                       y: 20
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Safety")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }

                   TextEdit {
                       id: label_Set_Sound2
                       x: 681
                       y: 190
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Sound")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }

                Image {
                    id: id_Set_desel_menu2
                    x: 0
                    y: 0
                    z: 4
                    source: "image/menu/menu4/menu4_desel2.png"
                    visible: valuetable.set_sub_menu_no === 2 && valuetable.tmp_sub_menu_no === 2 ? true : false

                    TextEdit {
                        id: label_Set_Service_sel
                        x: 76
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Service")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Set_menu3
                    x: 0
                    y: 0
                    z: 5
                    source: "image/menu/menu4/menu4_sel3.png"
                    visible: valuetable.set_sub_menu_no === 3 &&
                             valuetable.tmp_sub_menu_no === 1 ? true : false

                    TextEdit {
                        id: label_Set_Display3
                        x: 60
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Display Settings")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_Set_Service3
                        x: 76
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Service")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                   TextEdit {
                       id: label_Set_Safety3
                       x: 681
                       y: 20
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Safety")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }

                   TextEdit {
                       id: label_Set_Sound3
                       x: 681
                       y: 190
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Sound")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }

                Image {
                    id: id_Set_desel_menu3
                    x: 0
                    y: 0
                    z: 6
                    source: "image/menu/menu4/menu4_desel3.png"
                    visible: valuetable.set_sub_menu_no === 3 && valuetable.tmp_sub_menu_no === 2 ? true : false

                    TextEdit {
                        id: label_Set_Sound_sel
                        x: 681
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Sound")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }
                }

                Image {
                    id: id_Set_menu4
                    x: 0
                    y: 0
                    z: 7
                    source: "image/menu/menu4/menu4_sel4.png"
                    visible: valuetable.set_sub_menu_no === 4 &&
                             valuetable.tmp_sub_menu_no === 1 ? true : false

                    TextEdit {
                        id: label_Set_Display4
                        x: 60
                        y: 20
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Display Settings")
                        z: 0
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                    TextEdit {
                        id: label_Set_Service4
                        x: 76
                        y: 190
                        z: 0
                        width: 53
                        height: 32
                        color: "#ffffff"
                        text: qsTr("Service")
                        font.bold: true
                        font.family: "Nexa Bold"
                        visible: true
                        font.pointSize: 20
                    }

                   TextEdit {
                       id: label_Set_Safety4
                       x: 681
                       y: 20
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Safety")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }

                   TextEdit {
                       id: label_Set_Sound4
                       x: 681
                       y: 190
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Sound")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }

                Image {
                    id: id_Set_desel_menu4
                    x: 0
                    y: 0
                    z: 8
                    source: "image/menu/menu4/menu4_desel4.png"
                    visible: valuetable.set_sub_menu_no === 4 && valuetable.tmp_sub_menu_no === 2 ? true : false

                   TextEdit {
                       id: label_Set_Safety_sel
                       x: 681
                       y: 20
                       z: 0
                       width: 53
                       height: 32
                       color: "#ffffff"
                       text: qsTr("Safety")
                       font.bold: true
                       font.family: "Nexa Bold"
                       visible: true
                       font.pointSize: 20
                   }
                }

                Image {
                    id: id_Set_menu_glow
                    x: 383
                    y: 46
                    z: 9
                    scale: (valuetable.set_menu_scale) * (valuetable.menu_scale_factor)//valuetable.circle_scale
                    opacity: valuetable.menu_glow_opac
                    source: "image/menu/Menu_glow.png"
                    visible: true
                }

                Image {
                    id: id_Set_menu_dot_circle
                    x: 414
                    y: 77
                    z: 10
                    scale: (valuetable.set_menu_scale) * (valuetable.menu_scale_factor)//valuetable.circle_scale
                    source: "image/menu/Menu_dot_circle.png"
                    visible: true
                }

                Image {
                    id: id_Set_mode_disp_set
                    x: 427
                    y: 98
                    z: 11
                    source: "image/menu/Mode_disp.png"
                    scale: (valuetable.set_menu_scale) * (valuetable.menu_scale_factor)
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    visible: valuetable.set_sub_menu_no === 1 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.set_sub_menu_no === 1 ? true : false
                    }

                }


                Image {
                    id: id_Set_mode_service
                    x: 433
                    y: 97
                    z: 12
                    source: "image/menu/Mode_service.png"
                    scale: (valuetable.set_menu_scale) * (valuetable.menu_scale_factor)
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    visible: valuetable.set_sub_menu_no === 2 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.set_sub_menu_no === 2 ? true : false
                    }
                }

                Image {
                    id: id_Set_sound
                    x: 430
                    y: 96
                    z: 13
                    source: "image/menu/Mode_sound.png"
                    scale: (valuetable.set_menu_scale) * (valuetable.menu_scale_factor)
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    visible: valuetable.set_sub_menu_no === 3 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.set_sub_menu_no === 3 ? true : false
                    }
                }

                Image {
                    id: id_Set_Safety
                    x: 432
                    y: 88
                    z: 14
                    source: "image/menu/Mode_safety.png"
                    scale: (valuetable.set_menu_scale) * (valuetable.menu_scale_factor)
                    transform: Rotation { origin.x: 36; origin.y: 36; axis { x: 0; y: 1; z: 0 } angle: valuetable.menu_icon_deg_rev }
                    visible: valuetable.set_sub_menu_no === 4 ? true : false

                    SequentialAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 0
                            to: 90
                            duration: 500
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "menu_icon_deg_rev"
                            from: 90
                            to: 0
                            duration: 500
                        }
                        running: valuetable.set_sub_menu_no === 4 ? true : false
                    }
                }

            }
            /******************************************** setting Menu end******************************************/


            /***************************** Func sub menus *******************************/
            Rectangle {
                id: id_Func_menu_map
                x: 443
                y: 156
                width: 898
                height: 398
                color: "#000000"
                scale: valuetable.func_sub_func_scale * 0.9
                z: 8
                clip: true
                visible : valuetable.main_menu_no === 5 ? true : false

                Behavior on scale { SmoothedAnimation { velocity: 2 } }

                Image {
                        id: id_map_cut
                    x: 0
                    y: 0
                        width: 900
                        height: 400
                        transformOrigin: Item.Center
                        z:3
                    scale: 1
                        source: "image/maps/map_cut.png"
                    }
                    Rectangle {
                        id: id_Func_menu_map_rect
                        x: valuetable.map1_x - 254
                        y: valuetable.map1_y - 171
                        z:0
                        scale : valuetable.map1_scale
                        width: 1324
                        height: 743
                    Image {
                        x: 0
                        y: 0
                        id: id_map1
                        transformOrigin: Item.Center
                        z:0
                        scale: 1
                        source: "image/maps/map1.png"
                     }
                    Image {
                        id: id_map_arrow
                        x: valuetable.arrow_x - 15
                        y: valuetable.arrow_y - 15
                        transformOrigin: Item.Center
                        z:4
                        visible:true
                        scale: 1
                        rotation: valuetable.arrow_deg
                        source: "image/maps/arrow.png"
                    }
                }
            }
            Rectangle {
                id: id_Func_menu_phone_book
                x: 601
                y: 205
                width: 583
                height: 284
                color: "transparent"
                z: 8
                clip: true
                scale: (valuetable.func_sub_func_scale) * 1.2
                visible : valuetable.main_menu_no === 6 ? true : false

                Image {
                    id: id_func2
                    x: 0
                    y: 0
                    scale: 1
                    source: "image/menu/phone_book.png"
                }
            }
            Rectangle {
                id: id_Func_menu_tpms
                x: 760
                y: 245
                width: 266
                height: 205
                color: "transparent"
                z: 8
                clip: true
                scale: (valuetable.func_sub_func_scale) * 1.5
                visible : valuetable.main_menu_no === 7 ? true : false

                Image {
                    id: id_func3
                    x: 0
                    y: 0
                    scale: 1
                    source: "image/menu/tpms.png"
                }
            }
            Rectangle {
                id: id_Func_menu_trip_comp
                x: 770
                y: 282
                width: 246
                height: 130
                color: "transparent"
                z: 8
                clip: true
                scale: (valuetable.func_sub_func_scale) * 1.7
                visible : valuetable.main_menu_no === 8 ? true : false

                Image {
                    id: id_func4
                    x: 0
                    y: 0
                    scale: 1
                    source: "image/menu/Trip_comp.png"
                }
            }

            /***************************** theme sub menus *******************************/
            Rectangle {
                id: id_Theme_menu_theme1
                x: 451
                y: 227
                width: 918
                height: 244
                color: "transparent"
                z: 8
                clip: true
                scale: valuetable.theme_sub_func_scale
                visible : valuetable.main_menu_no === 9 ? true : false


                Image {
                    id: id_theme1
                    x: 0
                    y: 0
                    scale: 1
                    source: "image/final_menu/theme1.png"
                }
            }
            Rectangle {
                id: id_Theme_menu_theme2
                x: 451
                y: 227
                width: 918
                height: 244
                color: "transparent"
                z: 8
                clip: true
                scale: valuetable.theme_sub_func_scale
                visible : valuetable.main_menu_no === 10 ? true : false

                Image {
                    id: id_theme2
                    x: 0
                    y: 0
                    scale: 1
                    source: "image/final_menu/theme2.png"
                }
            }
            Rectangle {
                id: id_theme_menu_theme3
                x: 451
                y: 227
                width: 918
                height: 244
                color: "transparent"
                z: 8
                clip: true
                scale: valuetable.theme_sub_func_scale
                visible : valuetable.main_menu_no === 11 ? true : false

                Image {
                    id: id_theme3
                    x: 0
                    y: 0
                    scale: 1
                    source: "image/final_menu/theme3.png"
                }
            }

            /***************************** Set sub menus *******************************/
            Rectangle {
                id: id_Set_menu_disp
                x: 691
                y: 243
                width: 403
                height: 208
                color: "transparent"
                z: 8
                clip: true
                scale: (valuetable.set_sub_func_scale) * 1.1
                visible : valuetable.main_menu_no === 12 ? true : false


                Image {
                    id: id_set1
                    x: 0
                    y: 0
                    scale: 1
                    source: "image/menu/disp.png"
                }
            }
            Rectangle {
                id: id_Set_menu_service
                x: 721
                y: 229
                width: 343
                height: 237
                color: "transparent"
                z: 8
                clip: true
                scale: (valuetable.set_sub_func_scale)* 1.3
                visible : valuetable.main_menu_no === 13 ? true : false

                Image {
                    id: id_set2
                    x: 0
                    y: 0
                    scale: 1
                    source: "image/menu/service.png"
                }
            }
            Rectangle {
                id: id_Set_menu_safety
                x: 451
                y: 227
                width: 918
                height: 244
                color: "transparent"
                z: 8
                clip: true
                scale: valuetable.set_sub_func_scale
                visible : valuetable.main_menu_no === 14 ? true : false

                Image {
                    id: id_set3
                    x: 0
                    y: 0
                    scale: 1
                    source: "image/final_menu/set3.png"
                }
            }
            Rectangle {
                id: id_Set_menu_sound
                x: 451
                y: 227
                width: 918
                height: 244
                color: "transparent"
                z: 8
                clip: true
                scale: valuetable.set_sub_func_scale
                visible : valuetable.main_menu_no === 15 ? true : false

                Image {
                    id: id_set4
                    x: 0
                    y: 0
                    scale: 1
                    source: "image/final_menu/set4.png"
                }
            }

        }
    }
}
