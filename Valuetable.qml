import QtQuick 2.0

Item{
    id : valuetable

    property real logo_scale:0
    property real logo_y:400
    property real logo_deg_x:0
    property int centre_blk_view:0
    property real centre_scale:0

    property int low_line_x:-416
    property int low_line_clip_x:893
    property int low_line_clip_y:523
    property int low_line_siz_x:0
    property int low_line_siz_y:15

    property int hi_line_x:-337
    property int hi_line_y:147
    property int hi_line_clip_x:893
    property int hi_line_clip_y:15
    property int hi_line_siz_x:0
    property int hi_line_siz_y:0
    property int hi_line_clip: 0

    property int line_view:0
    property int fuel_temp_view:0

    property int hi_line_menu_clip_y:-120 //-90
    property int low_line_menu_clip_y:720

    property int ind_r_x:1197//1207
    property int ind_r_y:129

    property int ind_l_x:383
    property int ind_l_y:125

    property int fuel : 200
    property int fuel_dig : 0
    property int fuel_fill_y : 0
    property int fuel_low : 300

    property int temp : 200
    property int temp_dig : 0
    property int temp_fill_y : 0
    property int temp_Over : 700


    property int chrome_view :0
    property real chrome_opac :1

    property int speed : 0
    property int over_speed : 1200
    property int speed_dig : 0
    property real spd_fill_angle : 0
    property int spd_fill_x : 0
    property int spd_fill_y : 0

    property int tach : 0
    property int over_tach : 1200
    property real tach_dig : 0
    property real tach_fill_angle : 0
    property int tach_fill_x : 0
    property int tach_fill_y : 0


    property int main_menu_no : 0
    property int sub_menu_no : 1
    property int ent_menu_no : 0
    property int esc_menu_no : 0
    property int tmp_sub_menu_no : 0

    property real func_menu_x : 431
    property real func_menu_scale : 1
    property int func_sub_menu_no : 1
    property int tmp_func_menu_no : 0
    property real func_sub_func_scale : 0

    property int theme_menu_x:622
    property real theme_menu_scale : 1
    property int theme_sub_menu_no : 1
    property real theme_sub_func_scale:0

    property real set_menu_scale : 1
    property int set_sub_menu_no : 1
    property real set_sub_func_scale:0

    property real menu_thin_hilit_scale : 0
    property real menu_thik_hilit_scale : 0
    property real menu_ent_hilit_scale : 0


     property real circle_scale : 0.8

    property real menu_scale:0

    property real menu_scale_factor:0.8

    property int menu_x:822//884
    property real menu_glow_opac:0.5

    property real menu_icon_deg_rev: 0
    property real menu_icon_deg_fwd: 0

    property int self_chk:1
    property real centre_blue_scale:0
    property real sp_th_fontscale : 1



    property int display_mode : 0


    property int auto_demo:0

    property int ent_wait : 6000
    property int esc_wait : 6000
    property int menu_sel : 2000
    
    
     property string incoming_mob_number : ""
     property string gear_input : "P"
     property bool show_income_call_alert : false
     property bool bt_paired : false
     property bool telltale_visible : false

    property string compassdir: "SE"

    property real map1_scale : 0.75
    property real arrow_deg : 0
    property real arrow_x : 0
    property real arrow_y : 0

    property real map1_x : 0.5
    property real map1_y : 0.5

    property int nav_pntr_dly : 3000

    property int nav_pntr_turn_dly : 3000


    property int glow_opac_dly : 200
    property int ent_hilit_dly : 500
    property int menu_x_dly : 500
    property int menu_scale_dly : 500
    property int fuel_entry_dly : 750
    property int gps_wait_dly : 50000
    property int main_menu_reenter : 0

    property int self_chk_dly : 5000
	
	property bool ip_mode_control : true
	
	function var_init()
	{
	console.debug("Clearing Global Variables");
	logo_scale = 0
    logo_y = 400
    logo_deg_x = 0
    centre_blk_view = 0
    centre_scale = 0

      low_line_x = -416
      low_line_clip_x = 893
      low_line_clip_y = 523
      low_line_siz_x = 0
      low_line_siz_y = 15

      hi_line_x = -337
      hi_line_y = 147
      hi_line_clip_x = 893
      hi_line_clip_y = 15
      hi_line_siz_x = 0
      hi_line_siz_y = 0
      hi_line_clip =  0

      line_view = 0
      fuel_temp_view = 0

      hi_line_menu_clip_y = -120//-90
      low_line_menu_clip_y = 720

      ind_r_x = 1197//1190 //1110
      ind_r_y = 123 //81

      ind_l_x = 383  //464
      ind_l_y = 125 //87

      fuel  =  200
      fuel_dig  =  0
      fuel_fill_y  =  0
      fuel_low  =  300

      temp  =  200
      temp_dig  =  0
      temp_fill_y  =  0
      temp_Over  =  700


      chrome_view  = 0
      chrome_opac  = 1

      speed  =  0
      over_speed  =  1500
      speed_dig  =  0
      spd_fill_angle  =  0
      spd_fill_x  =  0
      spd_fill_y  =  0

      tach  =  0
      over_tach  =  1500
      tach_dig  =  0
      tach_fill_angle  =  0
      tach_fill_x  =  0
      tach_fill_y  =  0


      main_menu_no  =  0
      sub_menu_no  =  1
      ent_menu_no  =  0
      esc_menu_no  =  0
      tmp_sub_menu_no  =  0

      func_menu_x  =  431
      func_menu_scale  =  1
      func_sub_menu_no  =  1
      tmp_func_menu_no  =  0
      func_sub_func_scale  =  0

      theme_menu_x = 622
      theme_menu_scale  =  1
      theme_sub_menu_no  =  1
      theme_sub_func_scale = 0

      set_menu_scale  =  1
      set_sub_menu_no  =  1
      set_sub_func_scale = 0

      menu_thin_hilit_scale  =  0
      menu_thik_hilit_scale  =  0
      menu_ent_hilit_scale = 0


      circle_scale  =  0.8

      menu_scale = 0

      menu_scale_factor = 0.8

      menu_x = 822//884
      menu_glow_opac = 0.5

      menu_icon_deg_rev =  0
      menu_icon_deg_fwd =  0

      centre_blue_scale = 0
      sp_th_fontscale  =  1



      display_mode  =  0


      auto_demo = 0

      ent_wait  =  6000
      esc_wait  =  6000
      menu_sel  =  2000
    
    
       incoming_mob_number  =  ""
       gear_input  =  "P"
       show_income_call_alert  =  false
       bt_paired  =  false
       telltale_visible  =  false

      compassdir =  "SE"

      map1_scale  =  0.75
      arrow_deg  =  0
      arrow_x  =  0
      arrow_y  =  0

      map1_x  =  0.5
      map1_y  =  0.5

      nav_pntr_dly  =  3000

      nav_pntr_turn_dly  =  3000


      glow_opac_dly  =  200
      ent_hilit_dly  =  500
      menu_x_dly  =  500
      menu_scale_dly  =  500
      fuel_entry_dly  =  750
      gps_wait_dly  =  50000
      main_menu_reenter  =  0

      self_chk_dly  =  5000
		
	}


/*********************************** Self check **************************************/

    SequentialAnimation
    {
	
        PropertyAction
        {
            target: valuetable
            property: "centre_blue_scale"
            value : 0
        }
        PropertyAction
        {
          target: valuetable
          property: "fuel_temp_view"
          value: 0
        }
        PropertyAction
        {
          target: valuetable
          property: "centre_blk_view"
          value: 0
        }
        PropertyAction
        {
            target: valuetable
            property: "logo_y"
            value: 400
        }
        PropertyAction
        {
            target: valuetable
            property: "logo_scale"
            value: 0.5
        }

        PauseAnimation {
            duration: 2000
        }

        NumberAnimation
        {
            target: valuetable
            property: "logo_deg_x"
            from: 0
            to: 45
            duration: 200
        }

        PauseAnimation {
            duration: 500
        }

        ParallelAnimation
        {
            NumberAnimation
            {
                target: valuetable
                property: "logo_deg_x"
                from: 45
                to: 90
                duration: 1000
            }

            NumberAnimation
            {
                target: valuetable
                property: "logo_scale"
                from: 0.5
                to: 0
                duration: 1000
            }

            NumberAnimation
            {
                target: valuetable
                property: "logo_y"
                from: 400
                to: 200
                duration: 1000
            }
        }

        PropertyAction
        {
            target: valuetable
            property: "centre_blk_view"
            value: 1
        }

        PropertyAction
        {
            target: valuetable
            property: "line_view"
            value: 1
        }


        ParallelAnimation
        {

            SequentialAnimation
            {
                loops:Animation.Infinite
                NumberAnimation
                {
                    target: valuetable
                    property: "centre_scale"
                    from: 1.05
                    to: 1.1
                    duration: 1000
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "centre_scale"
                    from: 1.1
                    to: 1.05
                    duration: 1000
                }
            }

            /***************** lo line ***************/
            ParallelAnimation
            {

                NumberAnimation
                {
                    target: valuetable
                    property: "low_line_x"
                    from: -417
                    to: 0
                    duration: 500
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "low_line_siz_x"
                    from: 0
                    to: 832
                    duration: 500
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "low_line_clip_x"
                    from: 893
                    to: 477
                    duration: 500
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "low_line_siz_y"
                    from: 15
                    to: 147
                    duration: 500
                }
            }


            /******************* hiline *********************/
            ParallelAnimation
            {
                PropertyAction
                {
                    target: valuetable
                    property: "hi_line_clip"
                    value: 1
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "hi_line_x"
                    from: -337
                    to: 0
                    duration: 500
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "hi_line_y"
                    from: -107
                    to: 0
                    duration: 500
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "hi_line_siz_x"
                    from: 0
                    to: 675
                    duration: 500
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "hi_line_siz_y"
                    from: 0
                    to: 107
                    duration: 500
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "hi_line_clip_x"
                    from: 908
                    to: 570
                    duration: 500
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "hi_line_clip_y"
                    from: 197
                    to: 110
                    duration: 500
                }

            }

            SequentialAnimation
            {

                NumberAnimation
                {
                    target: valuetable
                    property: "chrome_opac"
                    from: 0
                    to: 0
                    duration: 500
                }

                PropertyAction
                {
                    target: valuetable
                    property: "chrome_view"
                    value : 1
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "chrome_opac"
                    from: 0
                    to: 1
                    duration: 500
                }

                PropertyAction
                {
                    target: valuetable
                    property: "line_view"
                    value: 0
                }

                PropertyAction
                {
                    target: valuetable
                    property: "hi_line_clip"
                    value: 0
                }

                PropertyAction
                {
                    target: valuetable
                    property: "fuel_temp_view"
                    value: 1
                }

                PropertyAction
                {
                    target: valuetable
                    property: "sp_th_fontscale"
                    value: 1.5
                }
//                NumberAnimation
//                {
//                    target: valuetable
//                    property: "sp_th_fontscale"
//                    from: 1
//                    to: 1.5
//                    duration: 500
//                }
                SequentialAnimation
                {
                    ParallelAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "centre_blue_scale"
                            from: 0
                            to: 1
                            duration: valuetable.menu_scale_dly
                        }
                        NumberAnimation
                        {
                            target: valuetable
                            property: "speed"
                            from: 0
                            to: 1800
                            duration: valuetable.self_chk_dly
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "tach"
                            from: 0
                            to: 1800
                            duration: valuetable.self_chk_dly
                        }


                        NumberAnimation
                        {
                            target: valuetable
                            property: "fuel"
                            from: 200
                            to: 1000
                            duration: valuetable.self_chk_dly
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "temp"
                            from: 200
                            to: 1000
                            duration: valuetable.self_chk_dly
                        }
                    }

                    ParallelAnimation
                    {
                        NumberAnimation
                        {
                            target: valuetable
                            property: "speed"
                            from: 1800
                            to: 0
                            duration: valuetable.self_chk_dly
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "tach"
                            from: 1800
                            to: 0
                            duration: valuetable.self_chk_dly
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "fuel"
                            from: 1000
                            to: 200
                            duration: valuetable.self_chk_dly
                        }

                        NumberAnimation
                        {
                            target: valuetable
                            property: "temp"
                            from: 1000
                            to: 200
                            duration: valuetable.self_chk_dly
                        }
                    }
                }
//                ParallelAnimation
//                {
//                    NumberAnimation
//                    {
//                        target: valuetable
//                        property: "centre_blue_scale"
//                        from: 0
//                        to: 1
//                        duration: 500
//                    }

//                    NumberAnimation
//                    {
//                        target: valuetable
//                        property: "sp_th_fontscale"
//                        from: 1
//                        to: 1.5
//                        duration: 500
//                    }
//                }
                PauseAnimation {
                    duration: 2000
                }

/********************* for auto demo ****************/
               /* PropertyAction
                {
                    target: valuetable
                    property: "auto_demo"
                    value:  valuetable.ip_mode_control
                }
*/
                PropertyAction
                {
                    target: valuetable
                    property: "self_chk"
                    value: 0
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "centre_scale"
                    from: 1.05
                    to: 0.8
                    duration: 1000
                }
            }
        }
		onStopped:
		{
            basewindow.qSig_Selfchk_completed(1);
			console.debug("ato demo",valuetable.auto_demo);
			console.debug("ip_mode_control",valuetable.ip_mode_control);
			
			if(valuetable.ip_mode_control)
			{
				valuetable.auto_demo = 1 ;
				console.debug("my ato",valuetable.auto_demo);
			}
			else
			{
				valuetable.auto_demo = 0;
				console.debug("my ato",valuetable.auto_demo);
			}			
		}
		onStarted:
		{
            basewindow.qSig_Selfchk_completed(0);
			console.debug("ip during start",ip_mode_control);
		}
    running: valuetable.self_chk === 1 ? true : false
    }


/**************** speed tach fuel temp auto demo *********************/

        SequentialAnimation
        {
        loops: Animation.Infinite
            ParallelAnimation
            {
                NumberAnimation
                {
                    target: valuetable
                    property: "speed"
                    from: 0
                    to: 1800
                    duration: 20000
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "tach"
                    from: 0
                    to: 1800
                    duration: 20000
                }


                NumberAnimation
                {
                    target: valuetable
                    property: "fuel"
                    from: 200
                    to: 1000
                    duration: 5000
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "temp"
                    from: 200
                    to: 1000
                    duration: 5000
                }
            }

            ParallelAnimation
            {
                NumberAnimation
                {
                    target: valuetable
                    property: "speed"
                    from: 1800
                    to: 0
                    duration: 20000
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "tach"
                    from: 1800
                    to: 0
                    duration: 20000
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "fuel"
                    from: 1000
                    to: 200
                    duration: 5000
                }

                NumberAnimation
                {
                    target: valuetable
                    property: "temp"
                    from: 1000
                    to: 200
                    duration: 5000
                }
            }
        running: valuetable.centre_blk_view ? true : false
        }
/**************************************** auto demo *******************************/
    ParallelAnimation
    {
        SequentialAnimation
        {
////            loops: Animation.Infinite
//            PropertyAction
//            {
//                target: valuetable
//                property: "display_mode"
//                value: 1
//            }
//            PauseAnimation {
//                duration: 1000
//            }
            PropertyAction
            {
                target: valuetable
                property: "main_menu_no"
                value: 1
            }
            PropertyAction
            {
                target: valuetable
                property: "main_menu_reenter"
                value: 1
            }

    /********************** Menu Function *******************/
            PauseAnimation {
                duration: 5000
            }

            PropertyAction
            {
                target: valuetable
                property: "sub_menu_no"
                value: 1
            }


            PauseAnimation {
                duration: valuetable.menu_sel
            }

            PropertyAction
            {
                target: valuetable
                property: "ent_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.ent_wait
            }

    /********************** GPS *******************/

            PropertyAction
            {
                target: valuetable
                property: "func_sub_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.menu_sel
            }

            PropertyAction
            {
                target: valuetable
                property: "ent_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.gps_wait_dly
            }

            PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait
            }

    /********************** phone book *******************/
            PropertyAction
            {
                target: valuetable
                property: "func_sub_menu_no"
                value: 2
            }

            PauseAnimation {
                duration: valuetable.menu_sel
            }

            PropertyAction
            {
                target: valuetable
                property: "ent_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.ent_wait
            }

            PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait
            }

    /********************** TPMS *******************/
            PropertyAction
            {
                target: valuetable
                property: "func_sub_menu_no"
                value: 3
            }

            PauseAnimation {
                duration: valuetable.menu_sel
            }

            PropertyAction
            {
                target: valuetable
                property: "ent_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.ent_wait
            }

            PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait
            }

    /********************** Trip Comp *******************/
            PropertyAction
            {
                target: valuetable
                property: "func_sub_menu_no"
                value: 4
            }

            PauseAnimation {
                duration: valuetable.menu_sel
            }

            PropertyAction
            {
                target: valuetable
                property: "ent_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.ent_wait
            }

            PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait
            }


    /********** escape to main menu ***************/

            PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait
            }


    /********************************** Theme Anim **************************/
    /********************** Menu theme *******************/
            PauseAnimation {
                duration: 2000
            }

            PropertyAction
            {
                target: valuetable
                property: "sub_menu_no"
                value: 2
            }

            PauseAnimation {
                duration: valuetable.menu_sel
            }

            PropertyAction
            {
                target: valuetable
                property: "ent_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.ent_wait
            }
    /********************** Themes 1 *******************/

            PropertyAction
            {
                target: valuetable
                property: "theme_sub_menu_no"
                value: valuetable.theme_sub_menu_no === 1 ? 2 :
                       (valuetable.theme_sub_menu_no === 2 ? 3 : 1)
            }

            PauseAnimation {
                duration: valuetable.esc_wait
            }


    /********** escape to main menu ***************/

            PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait
            }



    /********************************** Setting Anim **************************/
    /********************** Menu setting *******************/
            PauseAnimation {
                duration: 2000
            }

            PropertyAction
            {
                target: valuetable
                property: "sub_menu_no"
                value: 3
            }

            PauseAnimation {
                duration: valuetable.menu_sel
            }

            PropertyAction
            {
                target: valuetable
                property: "ent_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.ent_wait
            }
    /********************** Display *******************/

            PropertyAction
            {
                target: valuetable
                property: "set_sub_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.menu_sel
            }

            PropertyAction
            {
                target: valuetable
                property: "ent_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.ent_wait
            }

            PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait
            }

    /********************** Service *******************/
            PropertyAction
            {
                target: valuetable
                property: "set_sub_menu_no"
                value: 2
            }

            PauseAnimation {
                duration: valuetable.menu_sel
            }

            PropertyAction
            {
                target: valuetable
                property: "ent_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.ent_wait
            }

            PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait
            }

    /********************** Sound *******************/
    /*        PropertyAction
            {
                target: valuetable
                property: "set_sub_menu_no"
                value: 3
            }

            PauseAnimation {
                duration: valuetable.menu_sel
            }

            PropertyAction
            {
                target: valuetable
                property: "ent_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.ent_wait
            }

            PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait
            }
    */
    /********************** Safety *******************/
      /*      PropertyAction
            {
                target: valuetable
                property: "set_sub_menu_no"
                value: 4
            }

            PauseAnimation {
                duration: valuetable.menu_sel
            }

            PropertyAction
            {
                target: valuetable
                property: "ent_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.ent_wait
            }

            PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait
            }
            */

    /********** escape to main menu ***************/

            PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait// * 3
            }

            PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait * 2
            }

/*************** fot test *****************/
  /*          PropertyAction
            {
                target: valuetable
                property: "esc_menu_no"
                value: 1
            }

            PauseAnimation {
                duration: valuetable.esc_wait
            }*/
/*******************************/

            PropertyAction
            {
              target: valuetable
              property: "self_chk"
              value: 1
                }

            PropertyAction
            {
              target: valuetable
              property: "auto_demo"
              value: 0
            }
        }
            running: valuetable.auto_demo === 1 ? true : false
    }



/*********************************** func/theme/set menu start **********************************/
        SequentialAnimation
        {

             SequentialAnimation
            {
                NumberAnimation
                {
                    target:valuetable
                    property: "menu_glow_opac"
                    from: 0.5
                    to: 1
                    duration: valuetable.glow_opac_dly
                }

                NumberAnimation
                {
                    target:valuetable
                    property: "menu_glow_opac"
                    from: 1
                    to: 0.5
                    duration: valuetable.glow_opac_dly
                }
            }


            SequentialAnimation //Hilighter continuous
            {
                loops:Animation.Infinite

                ParallelAnimation
                {
                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_thin_hilit_scale"
                        from: 0.13
                        to: 0.25
                        duration: 500
                    }

                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_thik_hilit_scale"
                        from: 0.16
                        to: 0.30
                        duration: 500
                    }
                }

                ParallelAnimation
                {
                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_thin_hilit_scale"
                        from: 0.25
                        to: 0.35
                        duration: 750
                    }

                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_thik_hilit_scale"
                        from: 0.30
                        to: 0.42
                        duration: 750
                    }
                }

                ParallelAnimation
                {
                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_thin_hilit_scale"
                        from: 0.35
                        to: 0.98
                        duration: 1000
                    }

                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_thik_hilit_scale"
                        from: 0.42
                        to: 1.18
                        duration: 1000
                    }
                }
            }
        onStarted:
        {
            if(valuetable.ip_mode_control == 0)
            {
                basewindow.qSig_Selfchk_completed(0);
            }
        }
        onStopped:
        {
            if(valuetable.ip_mode_control == 0)
            {
                basewindow.qSig_Selfchk_completed(1);
            }
        }
            running: //valuetable.main_menu_no === 1 ||
                 valuetable.main_menu_no === 2 ||
                 valuetable.main_menu_no === 3 ||
                 valuetable.main_menu_no === 4
                 ? true : false
        }
/**************************************** func/theme menu end **************************************/


/******************** main menu fuel anim *******************/
    /*****************  big fuel to small fuel ******************/
        SequentialAnimation
        {
            ParallelAnimation
            {
                NumberAnimation
                {
                    target: valuetable
                    property: "centre_blue_scale"
                    from: 1
                    to: 0
                    duration: valuetable.fuel_entry_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "sp_th_fontscale"
                    from: 1.5
                    to: 1
                    duration: valuetable.fuel_entry_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "hi_line_clip_y"
                    from: 110
                    to: -119
                    duration: valuetable.fuel_entry_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "low_line_clip_y"
                    from: 523
                    to: 720
                    duration: valuetable.fuel_entry_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "ind_r_x"
                    from: 1197//1207
                    to: 1117//1127
                    duration: valuetable.fuel_entry_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "ind_r_y"
                    from: 129
                    to: 87
                    duration: valuetable.fuel_entry_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "ind_l_x"
                    from: 383
                    to: 450
                    duration: valuetable.fuel_entry_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "ind_l_y"
                    from: 125
                    to: 87
                    duration: valuetable.fuel_entry_dly
                }
            }
            ParallelAnimation
            {
                NumberAnimation
                {
                    target: valuetable
                    property: "hi_line_menu_clip_y"
                    from: -120//-90
                    to: 80//60
                    duration: valuetable.fuel_entry_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "low_line_menu_clip_y"
                    from: 720
                    to: 555
                    duration: valuetable.fuel_entry_dly
                }
            }
            onStarted:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(0);
                }
            }
            onStopped:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(1);
                }
            }

            running: valuetable.main_menu_reenter === 1 ? true : false
        }
/******************** big fuel to smalll fuel end *******************/
/*********************************** main menu start **********************************/
        /**************** start anim *************/
        SequentialAnimation
        {
            SequentialAnimation
            {
                PauseAnimation {
                    duration: 1700//valuetable.main_menu_reenter === 1 ? 1700 : 1
                }

                PropertyAction
                {
                    target:valuetable
                    property:"tmp_sub_menu_no"
                    value:0
                }

                ParallelAnimation
                {
                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_scale"
                        from: 0
                        to: 1
                        duration: valuetable.menu_scale_dly
                    }
                    PropertyAction
                    {
                        target:valuetable
                        property:"menu_x"
                        value:822
                    }
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "menu_x"
                    from: 822
                    to: 622
                    duration: valuetable.menu_x_dly
                }

                NumberAnimation
                {
                    target:valuetable
                    property: "menu_glow_opac"
                    from: 0.5
                    to: 1
                    duration: valuetable.glow_opac_dly
                }

                NumberAnimation
                {
                    target:valuetable
                    property: "menu_glow_opac"
                    from: 1
                    to: 0.5
                    duration: valuetable.glow_opac_dly
                }

                PropertyAction
                {
                    target:valuetable
                    property:"tmp_sub_menu_no"
                    value:1
                }
            }

            SequentialAnimation //Hilighter continuous
            {
                loops:Animation.Infinite

                ParallelAnimation
                {
                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_thin_hilit_scale"
                        from: 0.13
                        to: 0.25
                        duration: 500
                    }

                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_thik_hilit_scale"
                        from: 0.16
                        to: 0.30
                        duration: 500
                    }
                }

                ParallelAnimation
                {
                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_thin_hilit_scale"
                        from: 0.25
                        to: 0.35
                        duration: 750
                    }

                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_thik_hilit_scale"
                        from: 0.30
                        to: 0.42
                        duration: 750
                    }
                }

                ParallelAnimation
                {
                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_thin_hilit_scale"
                        from: 0.35
                        to: 0.98
                        duration: 1000
                    }

                    NumberAnimation
                    {
                        target: valuetable
                        property: "menu_thik_hilit_scale"
                        from: 0.42
                        to: 1.18
                        duration: 1000
                    }
                }
            }

            onStarted:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(0);
                }
            }
            onStopped:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(1);
                }
            }

            running: valuetable.main_menu_no === 1 ? true : false
        }


        /********** select Enter sequence ***************/
        SequentialAnimation
       {
           PropertyAction
           {
               target:valuetable
               property:"tmp_sub_menu_no"
               value:2
           }

           NumberAnimation
           {
               target:valuetable
               property: "menu_glow_opac"
               from: 0.5
               to: 1
               duration: valuetable.glow_opac_dly
           }

           NumberAnimation
           {
               target:valuetable
               property: "menu_glow_opac"
               from: 1
               to: 0.5
               duration: valuetable.glow_opac_dly
           }

           NumberAnimation
           {
               target: valuetable
               property: "menu_ent_hilit_scale"
               from: 0
               to: 1.2
               duration: valuetable.ent_hilit_dly
           }

           PropertyAction
           {
               target:valuetable
               property:"tmp_sub_menu_no"
               value:0
           }

           NumberAnimation
           {
               target: valuetable
               property: "menu_x"
               from: 622
               to: 822
               duration: valuetable.menu_x_dly
           }

           NumberAnimation
           {
               target: valuetable
               property: "menu_scale"
               from: 1
               to: 0
               duration: valuetable.menu_scale_dly
           }

           PropertyAction
           {
               target:valuetable
               property:"ent_menu_no"
               value:0
           }

           running: (valuetable.ent_menu_no === 1 && valuetable.main_menu_no === 1) ? true : false

           onStarted:
           {
               if(valuetable.ip_mode_control == 0)
               {
                   basewindow.qSig_Selfchk_completed(0);
               }
           }
           onStopped:
           {
               if(valuetable.ip_mode_control == 0)
               {
                   basewindow.qSig_Selfchk_completed(1);
               }
               if(valuetable.auto_demo == 1 )
               {
                    if( valuetable.sub_menu_no == 1)
                        valuetable.main_menu_no = 2;
                    else if( valuetable.sub_menu_no == 2)
                        valuetable.main_menu_no = 3;
                    else
                        valuetable.main_menu_no = 4;
               }
               else
               {
                   basewindow.qSig_Main_Menu(valuetable.sub_menu_no === 1 ? 2 :
                                             (valuetable.sub_menu_no === 2 ? 3 : 4))
                   basewindow.qSig_Sub_Menu(0)
                   basewindow.qSig_Ent_Menu(0)
                   basewindow.qSig_Esc_Menu(0)
               }
           }
       }

        /******** Escape seq *************/
          SequentialAnimation
          {
              PropertyAction
              {
                 target:valuetable
                  property: "main_menu_reenter"
                  value : 0
              }
              PropertyAction
              {
                 target:valuetable
                 property:"tmp_sub_menu_no"
                 value: 0
              }


              NumberAnimation
              {
                  target: valuetable
                  property: "menu_x"
                  from: 622
                  to: 822
                  duration: valuetable.menu_x_dly
              }

              NumberAnimation
              {
                  target: valuetable
                  property: "menu_scale"
                  from: 1
                  to: 0
                  duration: valuetable.menu_scale_dly
              }


/*              PropertyAction
              {
                 target:valuetable
                 property:"display_mode"
                 value: 2
              }
*/
/***************************** small to big fuel ***************************/
              ParallelAnimation
              {
                  NumberAnimation
                  {
                      target: valuetable
                      property: "centre_blue_scale"
                      from: 0
                      to: 1
                      duration: valuetable.menu_scale_dly
                  }
                  NumberAnimation
                  {
                      target: valuetable
                      property: "sp_th_fontscale"
                      from: 1
                      to: 1.5
                      duration: valuetable.menu_scale_dly
                  }
                  NumberAnimation
                  {
                      target: valuetable
                      property: "hi_line_menu_clip_y"
                      from: 80
                      to: -120//-90//-65
                      duration: valuetable.menu_scale_dly
                  }
                  NumberAnimation
                  {
                      target: valuetable
                      property: "low_line_menu_clip_y"
                      from: 555
                      to: 720
                      duration: valuetable.menu_scale_dly
                  }
                  NumberAnimation
                  {
                      target: valuetable
                      property: "ind_r_x"
                      from: 1117//1127
                      to: 1197//1207
                      duration: valuetable.menu_scale_dly
                  }
                  NumberAnimation
                  {
                      target: valuetable
                      property: "ind_r_y"
                      from: 87
                      to: 129
                      duration: valuetable.menu_scale_dly
                  }
                  NumberAnimation
                  {
                      target: valuetable
                      property: "ind_l_x"
                      from: 450
                      to: 383
                      duration: valuetable.menu_scale_dly
                  }
                  NumberAnimation
                  {
                      target: valuetable
                      property: "ind_l_y"
                      from: 87
                      to: 125
                      duration: valuetable.menu_scale_dly
                  }
              }
              ParallelAnimation
              {
                  NumberAnimation
                  {
                      target: valuetable
                      property: "hi_line_clip_y"
                      from: -119
                      to: 110
                      duration: valuetable.menu_scale_dly
                  }
                  NumberAnimation
                  {
                      target: valuetable
                      property: "low_line_clip_y"
                      from: 720
                      to: 523
                      duration: valuetable.menu_scale_dly
                  }
              }
/********************************* small to big fuel end ******************/
              PropertyAction
              {
                 target:valuetable
                 property:"main_menu_no"
                 value: 0
              }



              running: (valuetable.esc_menu_no === 1 && valuetable.main_menu_no === 1) ? true : false

              onStarted:
              {
                  if(valuetable.ip_mode_control == 0)
                  {
                      basewindow.qSig_Selfchk_completed(0);
                  }
              }

              onStopped:
              {
                  if(valuetable.ip_mode_control == 0)
                  {
                      basewindow.qSig_Selfchk_completed(1);
                  }
                  if(valuetable.auto_demo == 1)
                  {
                      valuetable.main_menu_no = 0;
                      valuetable.esc_menu_no = 0;
                  }
                  else
                  {
                      basewindow.qSig_Ent_Menu(0)
                      basewindow.qSig_Main_Menu(0)
                      basewindow.qSig_Esc_Menu(0)
                      basewindow.qSig_Sub_Menu(valuetable.sub_menu_no)
                  }
              }
         }
/*********************************** main menu end **********************************/

/*********************************** func menu start **********************************/
          /**************** start anim *************/
          SequentialAnimation
          {
              PropertyAction
              {
                  target: valuetable
                  property: "main_menu_reenter"
                  value : 0
              }
              PropertyAction
              {
                  target:valuetable
                  property:"ent_menu_no"
                  value:0
              }

              PropertyAction
              {
                  target:valuetable
                  property:"func_menu_x"
                  value:431
              }

              PropertyAction
              {
                  target:valuetable
                  property:"tmp_sub_menu_no"
                  value:0
              }

              NumberAnimation
              {
                  target: valuetable
                  property: "func_menu_scale"
                  from: 0
                  to: 1
                  duration: valuetable.menu_scale_dly
              }

              NumberAnimation
              {
                  target:valuetable
                  property: "menu_glow_opac"
                  from: 0.5
                  to: 1
                  duration: valuetable.glow_opac_dly
              }

              NumberAnimation
              {
                  target:valuetable
                  property: "menu_glow_opac"
                  from: 1
                  to: 0.5
                  duration: valuetable.glow_opac_dly
              }

              PropertyAction
              {
                  target:valuetable
                  property:"tmp_sub_menu_no"
                  value:1
              }
              onStarted:
              {
                  if(valuetable.ip_mode_control == 0)
                  {
                      basewindow.qSig_Selfchk_completed(0);
                  }
              }

              onStopped:
              {
                  if(valuetable.ip_mode_control == 0)
                  {
                      basewindow.qSig_Selfchk_completed(1);
                  }
              }

            running: valuetable.main_menu_no === 2 ? true : false
                    // && valuetable.ent_menu_no === 0) */
          }


           /********** select Enter sequence ***************/
          SequentialAnimation
         {

             PropertyAction
             {
                 target:valuetable
                 property:"tmp_sub_menu_no"
                 value:2
             }

             NumberAnimation
             {
                 target:valuetable
                 property: "menu_glow_opac"
                 from: 0.5
                 to: 1
                 duration: valuetable.glow_opac_dly
             }

             NumberAnimation
             {
                 target:valuetable
                 property: "menu_glow_opac"
                 from: 1
                 to: 0.5
                 duration: valuetable.glow_opac_dly
             }

             NumberAnimation
             {
                 target: valuetable
                 property: "menu_ent_hilit_scale"
                 from: 0
                 to: 1.2
                 duration: valuetable.ent_hilit_dly
             }

             PropertyAction
             {
                 target:valuetable
                 property:"tmp_sub_menu_no"
                 value:0
             }

/*           NumberAnimation
             {
                 target: valuetable
                 property: "menu_x"
                 from: 622
                 to: 822
                 duration: menu_x_dly
             }*/

            NumberAnimation
             {
                 target: valuetable
                 property: "func_menu_scale"
                 from: 1
                 to: 0
                 duration: valuetable.menu_scale_dly
             }

            PropertyAction
            {
                target:valuetable
                property:"ent_menu_no"
                value:0
            }

             running: (valuetable.ent_menu_no === 1 && valuetable.main_menu_no === 2) ? true : false

             onStarted:
             {
                 if(valuetable.ip_mode_control == 0)
                 {
                     basewindow.qSig_Selfchk_completed(0);
                 }
             }

             onStopped:
             {
                 if(valuetable.ip_mode_control == 0)
                 {
                     basewindow.qSig_Selfchk_completed(1);
                 }
                if(valuetable.auto_demo == 1)
                {
                     if( valuetable.func_sub_menu_no == 1)
                         valuetable.main_menu_no = 5;
                     else if( valuetable.func_sub_menu_no == 2)
                         valuetable.main_menu_no = 6;
                     else if( valuetable.func_sub_menu_no == 3)
                         valuetable.main_menu_no = 7;
                     else
                         valuetable.main_menu_no = 8;

                     valuetable.ent_menu_no = 0;
                }
                else
                {
                     basewindow.qSig_Main_Menu(valuetable.func_sub_menu_no === 1 ? 5 :
                                              (valuetable.func_sub_menu_no === 2 ? 6 :
                                              (valuetable.func_sub_menu_no === 3 ? 7 : 8 )))
                     basewindow.qSig_Sub_Menu(0)
                     basewindow.qSig_Ent_Menu(0)
                    basewindow.qSig_Esc_Menu(0)
                }
             }
         }


        SequentialAnimation /******** Escape seq *************/
        {
            PropertyAction
            {
                target:valuetable
                property:"tmp_sub_menu_no"
                value:0
            }

            NumberAnimation
            {
                target: valuetable
                property: "func_menu_scale"
                from: 1
                to: 0
                duration: valuetable.menu_scale_dly
            }

            PropertyAction
            {
                target:valuetable
                property:"esc_menu_no"
                value:0
            }

            running: (valuetable.esc_menu_no === 1 && valuetable.main_menu_no === 2) ? true : false

            onStarted:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(0);
                }
            }

            onStopped:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(1);
                }

                if(valuetable.auto_demo == 1)
                {
                    valuetable.esc_menu_no = 0;
                    valuetable.main_menu_no = 1;
                }
                else
                {
                    basewindow.qSig_Ent_Menu(0)
                    basewindow.qSig_Esc_Menu(0)
                    basewindow.qSig_Sub_Menu(valuetable.sub_menu_no)
                    basewindow.qSig_Main_Menu(1)
                }
            }
        }


/************************************** func_sub_menu ****************************/
        /**************** start anim for GPS maps *************/
        SequentialAnimation
        {
            PropertyAction
            {
                target: valuetable
                property: "arrow_x"
                value: 662
            }
            PropertyAction
            {
                target: valuetable
                property: "arrow_y"
                value: 371
            }
            NumberAnimation
            {
                target: valuetable
                property: "func_sub_func_scale"
                from: 0
                to: 1
                duration: 2000
            }
            PropertyAction
            {
                target: valuetable
                property: "map1_x"
                value: 0
            }
            PropertyAction
            {
                target: valuetable
                property: "map1_y"
                value: 0
            }
            NumberAnimation
            {
                target: valuetable
                property: "map1_scale"
                from: 0.75
                to: 2
                duration: valuetable.nav_pntr_dly
            }
            NumberAnimation
            {
                target: valuetable
                property: "arrow_deg"
                from: 0
                to: 275
                duration: valuetable.nav_pntr_dly
            }
            NumberAnimation
            {
                target: valuetable
                property: "arrow_deg"
                from: 275
                to: 45
                duration: valuetable.nav_pntr_dly
            }
/************** seq 0 to 1 *********************/
            ParallelAnimation
            {
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_x"
                    from: 662
                    to: 471
                    duration: valuetable.nav_pntr_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_y"
                    from: 371
                    to: 434
                    duration: valuetable.nav_pntr_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "map1_x"
                    from: 0
                    to: 150
                    duration: valuetable.nav_pntr_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "map1_y"
                    from: 0
                    to: 0
                    duration: valuetable.nav_pntr_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_deg"
                    from: 0
                    to: -15
                    duration: valuetable.nav_pntr_dly
                }
            }
/************** seq 1 to 2 *********************/
            ParallelAnimation
            {
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_x"
                    from: 471
                    to: 464
                    duration: valuetable.nav_pntr_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_y"
                    from: 434
                    to: 400
                    duration: valuetable.nav_pntr_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "map1_x"
                    from: 150
                    to: 150
                    duration: valuetable.nav_pntr_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "map1_y"
                    from: 0
                    to: 0
                    duration: valuetable.nav_pntr_dly
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_deg"
                    from: -15
                    to: -15
                    duration: valuetable.nav_pntr_dly
                }
            }
            NumberAnimation
            {
                target: valuetable
                property: "arrow_deg"
                from: -15
                to: 80
                duration: valuetable.nav_pntr_turn_dly
            }
/************** seq 2 to 3 *********************/
            ParallelAnimation
            {
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_x"
                    from: 464
                    to: 559
                    duration: valuetable.nav_pntr_dly * 2.5
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_y"
                    from: 400
                    to: 378
                    duration: valuetable.nav_pntr_dly * 2.5
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "map1_x"
                    from: 150
                    to: 150
                    duration: valuetable.nav_pntr_dly * 2.5
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "map1_y"
                    from: 0
                    to: 0
                    duration: valuetable.nav_pntr_dly * 2.5
                }
            }
/************** seq 3 to 4 *********************/
            PropertyAction
            {
                target: valuetable
                property: "arrow_deg"
                value: 85
            }
            ParallelAnimation
            {
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_x"
                    from: 559
                    to: 638
                    duration: valuetable.nav_pntr_dly * 2
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_y"
                    from: 378
                    to: 360
                    duration: valuetable.nav_pntr_dly * 2
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "map1_x"
                    from: 150
                    to: 150
                    duration: valuetable.nav_pntr_dly * 2
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "map1_y"
                    from: 0
                    to: 0
                    duration: valuetable.nav_pntr_dly * 2
                }
            }
/************** seq 4 to 5 *********************/
            NumberAnimation
            {
                target: valuetable
                property: "arrow_deg"
                from: 85
                to: 65
                duration: valuetable.nav_pntr_turn_dly
            }
            ParallelAnimation
            {
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_x"
                    from: 638
                    to: 729
                    duration: valuetable.nav_pntr_dly * 2.5
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_y"
                    from: 360
                    to: 295
                    duration: valuetable.nav_pntr_dly * 2.5
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "map1_x"
                    from: 150
                    to: -200
                    duration: valuetable.nav_pntr_dly * 2.5
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "map1_y"
                    from: 0
                    to: 150
                    duration: valuetable.nav_pntr_dly * 2.5
                }
            }
/************** seq 5 to 6 *********************/
            PropertyAction
            {
                target: valuetable
                property: "arrow_deg"
                value: 60
            }
            ParallelAnimation
            {
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_x"
                    from: 729
                    to: 804
                    duration: valuetable.nav_pntr_dly * 2
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "arrow_y"
                    from: 295
                    to: 250
                    duration: valuetable.nav_pntr_dly * 2
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "map1_x"
                    from: -200
                    to: -200
                    duration: valuetable.nav_pntr_dly * 2
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "map1_y"
                    from: 150
                    to: 150
                    duration: valuetable.nav_pntr_dly * 2
                }
            }
          running: valuetable.main_menu_no === 5 ? true : false
        }
        /**************** start anim *************/
        SequentialAnimation
        {
            NumberAnimation
            {
                target: valuetable
                property: "func_sub_func_scale"
                from: 0
                to: 1
                duration: 2000
            }

            onStarted:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(0);
                }
            }
            onStopped:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(1);
                }
            }

            running: /*valuetable.main_menu_no === 5 ||*/
                   valuetable.main_menu_no === 6 ||
                   valuetable.main_menu_no === 7 ||
                   valuetable.main_menu_no === 8 ? true : false
        }


        SequentialAnimation /******** Escape seq *************/
        {
            NumberAnimation
            {
                target: valuetable
                property: "func_sub_func_scale"
                from: 1
                to: 0
                duration: 2000
            }

            PropertyAction
            {
                target:valuetable
                property:"esc_menu_no"
                value:0
            }

            running: (valuetable.esc_menu_no === 1 && valuetable.main_menu_no === 5) ||
                     (valuetable.esc_menu_no === 1 && valuetable.main_menu_no === 6) ||
                     (valuetable.esc_menu_no === 1 && valuetable.main_menu_no === 7) ||
                     (valuetable.esc_menu_no === 1 && valuetable.main_menu_no === 8)
                     ? true : false

            onStarted:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(0);
                }
            }

            onStopped:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(1);
                }

                 if( valuetable.auto_demo == 1)
                 {
                    valuetable.esc_menu_no = 0;
                    valuetable.main_menu_no = 2;
                 }
                 else
                 {
                      basewindow.qSig_Ent_Menu(0)
                      basewindow.qSig_Esc_Menu(0)
                      basewindow.qSig_Sub_Menu(valuetable.func_sub_menu_no)
                      basewindow.qSig_Main_Menu(2)
                 }
            }
        }



/*********************************** func menu end **********************************/

/*********************************** theme menu start **********************************/
        /**************** start anim *************/
        SequentialAnimation
        {
            SequentialAnimation
            {
                PropertyAction
                {
                    target:valuetable
                    property:"tmp_sub_menu_no"
                    value:0
                }

                ParallelAnimation
                {
                    NumberAnimation
                    {
                        target: valuetable
                        property: "theme_menu_scale"
                        from: 0
                        to: 1
                        duration: valuetable.menu_scale_dly
                    }
                    PropertyAction
                    {
                        target:valuetable
                        property:"theme_menu_x"
                        value:822
                    }
                }
                NumberAnimation
                {
                    target: valuetable
                    property: "theme_menu_x"
                    from: 822
                    to: 622
                    duration: menu_x_dly
                }

                NumberAnimation
                {
                    target:valuetable
                    property: "menu_glow_opac"
                    from: 0.5
                    to: 1
                    duration: valuetable.glow_opac_dly
                }

                NumberAnimation
                {
                    target:valuetable
                    property: "menu_glow_opac"
                    from: 1
                    to: 0.5
                    duration: valuetable.glow_opac_dly
                }

                PropertyAction
                {
                    target:valuetable
                    property:"tmp_sub_menu_no"
                    value:1
                }
            }

            onStarted:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(0);
                }
            }

            onStopped:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(1);
                }
            }

            running: valuetable.main_menu_no === 3 ? true : false
        }

        /******** Escape seq *************/
        SequentialAnimation
        {

            PropertyAction
            {
                target:valuetable
                property:"tmp_sub_menu_no"
                value:0
            }

            NumberAnimation
            {
                target: valuetable
                property: "theme_menu_x"
                from: 622
                to: 822
                duration: menu_x_dly
            }

            NumberAnimation
            {
                target: valuetable
                property: "theme_menu_scale"
                from: 1
                to: 0
                duration: valuetable.menu_scale_dly
            }

            PropertyAction
            {
                target:valuetable
                property:"esc_menu_no"
                value:0
            }

            running: (valuetable.esc_menu_no === 1 && valuetable.main_menu_no === 3) ? true : false

            onStarted:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(0);
                }
            }

            onStopped:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(1);
                }

                 if( valuetable.auto_demo == 1)
                 {
                    valuetable.main_menu_no = 1;
                 }
                 else
                 {
                    basewindow.qSig_Ent_Menu(0)
                    basewindow.qSig_Esc_Menu(0)
                    basewindow.qSig_Sub_Menu(valuetable.sub_menu_no)
                    basewindow.qSig_Main_Menu(1)
                 }
            }
        }


/*********************************** theme menu end **********************************/


/*********************************** set menu start **********************************/
          /**************** start anim *************/
          SequentialAnimation
          {
              SequentialAnimation
              {
                  PropertyAction
                  {
                      target:valuetable
                      property:"tmp_sub_menu_no"
                      value:0
                  }

                  NumberAnimation
                  {
                      target: valuetable
                      property: "set_menu_scale"
                      from: 0
                      to: 1
                      duration: valuetable.menu_scale_dly
                  }

                  NumberAnimation
                  {
                      target:valuetable
                      property: "menu_glow_opac"
                      from: 0.5
                      to: 1
                      duration: valuetable.glow_opac_dly
                  }

                  NumberAnimation
                  {
                      target:valuetable
                      property: "menu_glow_opac"
                      from: 1
                      to: 0.5
                      duration: valuetable.glow_opac_dly
                  }

                  PropertyAction
                  {
                      target:valuetable
                      property:"tmp_sub_menu_no"
                      value:1
                  }
              }


              onStarted:
              {
                  if(valuetable.ip_mode_control == 0)
                  {
                      basewindow.qSig_Selfchk_completed(0);
                  }
              }

              onStopped:
              {
                  if(valuetable.ip_mode_control == 0)
                  {
                      basewindow.qSig_Selfchk_completed(1);
                  }
              }

              running: valuetable.main_menu_no === 4 ? true : false
          }

          /********** select Enter sequence ***************/
         SequentialAnimation
        {

            PropertyAction
            {
                target:valuetable
                property:"tmp_sub_menu_no"
                value:2
            }

            NumberAnimation
            {
                target:valuetable
                property: "menu_glow_opac"
                from: 0.5
                to: 1
                duration: valuetable.glow_opac_dly
            }

            NumberAnimation
            {
                target:valuetable
                property: "menu_glow_opac"
                from: 1
                to: 0.5
                duration: valuetable.glow_opac_dly
            }

            NumberAnimation
            {
                target: valuetable
                property: "menu_ent_hilit_scale"
                from: 0
                to: 1.2
                duration: valuetable.ent_hilit_dly
            }

            PropertyAction
            {
                target:valuetable
                property:"tmp_sub_menu_no"
                value:0
            }

/*           NumberAnimation
            {
                target: valuetable
                property: "menu_x"
                from: 622
                to: 822
                duration: menu_x_dly
            }*/

           NumberAnimation
            {
                target: valuetable
                property: "set_menu_scale"
                from: 1
                to: 0
                duration: valuetable.menu_scale_dly
            }

           PropertyAction
           {
               target:valuetable
               property:"ent_menu_no"
               value:0
           }

            running: (valuetable.ent_menu_no === 1 && valuetable.main_menu_no === 4) ? true : false
            onStopped:
            {
                 if( valuetable.auto_demo == 1)
                 {
                    if(valuetable.set_sub_menu_no == 1)
                        valuetable.main_menu_no = 12;
                    else  if(valuetable.set_sub_menu_no == 2)
                        valuetable.main_menu_no = 13;
/*                    else  if(valuetable.set_sub_menu_no == 3)
                        valuetable.main_menu_no = 14;
                    else
                        valuetable.main_menu_no = 15;*/
                }
                 else
                 {
                     basewindow.qSig_Main_Menu(valuetable.set_sub_menu_no === 1 ? 12 :
                                         (valuetable.set_sub_menu_no === 2 ? 13 :
                                         (valuetable.set_sub_menu_no === 3 ? 14 : 15 )))
                    basewindow.qSig_Sub_Menu(0)
                    basewindow.qSig_Ent_Menu(0)
                    basewindow.qSig_Esc_Menu(0)
                 }
            }
        }



        SequentialAnimation /******** Escape seq *************/
        {
            PropertyAction
            {
                target:valuetable
                property:"tmp_sub_menu_no"
                value:0
            }

            NumberAnimation
            {
                target: valuetable
                property: "set_menu_scale"
                from: 1
                to: 0
                duration: valuetable.menu_scale_dly
            }

            PropertyAction
            {
                target:valuetable
                property:"esc_menu_no"
                value:0
            }

            running: (valuetable.esc_menu_no === 1 && valuetable.main_menu_no === 4) ? true : false

            onStarted:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(0);
                }
            }

            onStopped:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(1);
                }

                 if( valuetable.auto_demo == 1)
                 {
                    valuetable.main_menu_no = 1;
                 }
                 else
                 {
                    basewindow.qSig_Ent_Menu(0)
                    basewindow.qSig_Esc_Menu(0)
                    basewindow.qSig_Sub_Menu(valuetable.sub_menu_no)
                    basewindow.qSig_Main_Menu(1)
                 }
            }
        }

        /************************************** set_sub_menu ****************************/
        /**************** start anim *************/
        SequentialAnimation
        {
            NumberAnimation
            {
                target: valuetable
                property: "set_sub_func_scale"
                from: 0
                to: 1
                duration: 2000
            }

            onStarted:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(0);
                }
            }

            onStopped:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(1);
                }
            }
          running: valuetable.main_menu_no === 12 ||
                   valuetable.main_menu_no === 13 ||
                   valuetable.main_menu_no === 14 ||
                   valuetable.main_menu_no === 15 ? true : false
        }


        SequentialAnimation /******** Escape seq *************/
        {
            NumberAnimation
            {
                target: valuetable
                property: "set_sub_func_scale"
                from: 1
                to: 0
                duration: 2000
            }

            PropertyAction
            {
                target:valuetable
                property:"esc_menu_no"
                value:0
            }

            running: (valuetable.esc_menu_no === 1 && valuetable.main_menu_no === 12) ||
                     (valuetable.esc_menu_no === 1 && valuetable.main_menu_no === 13) ||
                     (valuetable.esc_menu_no === 1 && valuetable.main_menu_no === 14) ||
                     (valuetable.esc_menu_no === 1 && valuetable.main_menu_no === 15)
                     ? true : false

            onStarted:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(0);
                }
            }
            onStopped:
            {
                if(valuetable.ip_mode_control == 0)
                {
                    basewindow.qSig_Selfchk_completed(1);
                }
                 if( valuetable.auto_demo == 1)
                 {
                    valuetable.main_menu_no = 4;
                 }
                 else
                 {
                    basewindow.qSig_Ent_Menu(0)
                    basewindow.qSig_Esc_Menu(0)
                    basewindow.qSig_Sub_Menu(valuetable.set_sub_menu_no)
                    basewindow.qSig_Main_Menu(4)
                 }
            }
        }


/*********************************** set menu end **********************************/
}
