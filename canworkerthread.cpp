// Copyright 2012 CrossControl

#include "general.h"

extern U1 ENABLE_CAN_DATA;


extern U1 u1_Main_Menu;
extern U1 u1_Sub_Menu;
extern U1 u1_Ent_Menu;
extern U1 u1_Esc_Menu;
extern U1 qml_slfchk_complete;

U1 gear_level ;
U1 E_Compass_Data = 0;
U1 button_clicked = 0;

U2 can_notact_cnt = 0;


#ifdef EN_CAN_DRIVER

#include "canworkerthread.h"

#include "canwrapper.h"

#include <QDebug>

#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <sys/uio.h>
#include <net/if.h>
#include <linux/can.h>
#include <linux/can/raw.h>

#include <signal.h>

#include <assert.h>

#include <errno.h>

#include <fcntl.h>

#include <stdio.h>

#include <sys/time.h>


/* Typedefs */

typedef unsigned char		U1;
typedef unsigned short		U2;
typedef unsigned long		U4;


/* Defines */

#define CAN_ID1 0x450
#define CAN_ID2 0x451
#define CAN_ID3 0x452
#define CAN_ID4 0x453


/* Structures */

union CAN_IO
{
    struct io_byte
    {
        U2 RIGHT_Arrow 	: 1;
        U2 LEFT_Arrow  	: 1;
        U2 UP_Arrow 	: 1 ;
        U2 DOWN_Arrow 	: 1;
        U2 Gear_Down  	: 1;
        U2 Gear_up 	: 1;
        U2 Reverse 	: 1 ;
        U2 ESC_Button 	: 1;
        U2 OK_Button 	: 1;
        U2 Reserved 	: 7;
     }io_bits;
    U2 CAN_iobyte;
};



CanWorkerThread::CanWorkerThread(QObject *parent) :
    QThread(parent)
{
}

// Setup worker thread
// Parameter:
// wrapper - pointer to CAN wrapper instance
void CanWorkerThread::Init(CanWrapper *wrapper)
{
    m_running = true;
    m_can = wrapper;
}

// This function will be excuted in an own thread when start is called from parent thread
// It will wait for data from CAN (blocking) and signal to GUI when data arrives
void CanWorkerThread::run()
{
    struct can_frame msg;
    union CAN_IO can_iodata;
    int ret;
    int i;
    int errorCode;
    U1 speed;
    U1 rpm;
    bool rtr;
    bool extended;
    bool error;

    struct timeval tv;

    tv.tv_sec = 1;
    tv.tv_usec = 0;

    while(m_running)
    {
        // This call will block but only for one sec to let us abort if m_running = false
        // errorCode is errors related to socket problems, error is can related problems like bus-off
        ret = m_can->GetMsg(msg, extended, rtr, error, errorCode, tv);

        if( ret && qml_slfchk_complete )
        {
            QString string;

            if(error)   // Error frame
            {
                string = QString("Error frame received, class = " +  QString::number(msg.can_id));
            }
            else
            if(extended)   // Extended frame
            {
                if(rtr)
                {
                    string = QString("RTR ID: %1 LENGTH: %2").arg(msg.can_id).arg(msg.can_dlc);
                }
                else
                {
                    string = QString("ID: %1 LENGTH: %2 DATA: ").arg(msg.can_id).arg(msg.can_dlc);

                    for(i = 0; i < msg.can_dlc; i++)
                    {
                        string.append(QString::number(msg.data[i]) + " ");
                    }
                }
            }
            else    // Standard frame
            {
                if(rtr)
                {
                    string = QString("RTR ID: %1 LENGTH: %2").arg(msg.can_id).arg(msg.can_dlc);
                }
                else
                {
                    string = QString("ID: %1 LENGTH: %2 DATA: ").arg(msg.can_id).arg(msg.can_dlc);

                    for(i = 0; i < msg.can_dlc; i++)
                    {
                        string.append(QString::number(msg.data[i]) + " ");
                    }
            //qDebug()<<"id :"<<msg.can_id;

                    switch (msg.can_id)
                    {
                        case 0x100:
#if 0
                             speed= (U1)msg.data[0];
                             rpm = (((U1)msg.data[1]<<8) | (U1) msg.data[2]);
                 qDebug()<<"Can_speed :"<<speed;
                 qDebug()<<"CAN_rpm :"<<rpm;
                            emit onChangeParam(speed,rpm,0,1); /* 0 fuel, 1 temp*/
#endif
                            break;
#if 1
                    case CAN_ID1: /* 0x450 */

                        /* Accelerator - byte 0-1
                         * Brake - byte 2-3
                         * Steering - 4-5
                         * Key Inputs - 6-7 */
                    //     qDebug()<<"0x450 ";

                  //      qDebug()<<"data0 :"<<msg.data[0];
                  //      qDebug()<<"data1 :"<<msg.data[1];
                  //      qDebug()<<"data2 :"<<msg.data[2];
                  //      qDebug()<<"data3 :"<<msg.data[3];
                 //       qDebug()<<"data4 :"<<msg.data[4];
                 //       qDebug()<<"data5 :"<<msg.data[5];
                 //       qDebug()<<"data6 :"<<msg.data[6];
                 //       qDebug()<<"data7 :"<<msg.data[7];


                        /*Accelerator_Data = msg.data[0];
                        Accelerator_Data = (U2)(Accelerator_Data << 8 | msg.data[1]);

                        Brake_Data = msg.data[2];
                        Brake_Data = (U2)(Brake_Data << 8 |  msg.data[3]);

                        Steering_Data =  msg.data[4];
                        Steering_Data = (U2)(Steering_Data << 8 | msg.data[5]);*/

                        can_iodata.CAN_iobyte = 0;
                        can_iodata.CAN_iobyte =  msg.data[6] ;
                        can_iodata.CAN_iobyte =  (U2)((can_iodata.CAN_iobyte) | ((msg.data[7] & 0x01) << 8));

                        if(can_iodata.CAN_iobyte)
                        {
							can_notact_cnt = 0;
							qDebug()<<"data7 :"<<"can_byte"<<can_iodata.CAN_iobyte;
                            if(button_clicked == TRUE && !ENABLE_CAN_DATA )
                            {
								u1_Main_Menu = 0;
								u1_Sub_Menu = 0;
								u1_Ent_Menu = 0;
								u1_Esc_Menu = 0;
                                emit compass_signal((QVariant)E_Compass_Data , 1 , 0); // reset signal
                                // key_scan(can_iodata);
                                 ENABLE_CAN_DATA = TRUE;
                                 button_clicked = FALSE;
                            }
                            else if(button_clicked == TRUE && ENABLE_CAN_DATA)
                            {
                                key_scan(can_iodata);
								qDebug()<<"main Menu:"<<u1_Main_Menu;
								qDebug()<<"Sub Menu:"<<u1_Sub_Menu;
								qDebug()<<"Ent Menu:"<<u1_Ent_Menu;
								qDebug()<<"Esc Menu:"<<u1_Esc_Menu;
                            }
                            button_clicked = FALSE;
                        }
                        else
                        {
                            button_clicked = TRUE;
							//qDebug()<<"No can count:"<<can_notact_cnt;
							if(ENABLE_CAN_DATA && ++can_notact_cnt > 4200)
							{
								u1_Main_Menu = 0;
								u1_Sub_Menu = 0;
								u1_Ent_Menu = 0;
								u1_Esc_Menu = 0;
							
								 can_notact_cnt = 0;
								 ENABLE_CAN_DATA = FALSE;
								 emit compass_signal((QVariant)E_Compass_Data , 0 , 1 ); // can_no activity signal.
							}
                        }

                        break;
#endif
                    case CAN_ID2:
                        /*  E-Compass 8 byte <U01,x>
                         * x = 1 - East
                         * 2 - SouthEast
                         * 3 - South
                         * 4 - SouthWest
                         * 5 - West
                         * 6 - North west
                         * 7 - North
                         * 8 - North East  */

                         E_Compass_Data = msg.data[5] & 0xff;
                         E_Compass_Data -=0x30;

                         emit compass_signal((QVariant)E_Compass_Data,0 , 0 );

                        break;

                    case CAN_ID3:
                        /* RPAS - totally 9 bytes
                         * first 5 bytes in this ID
                         *                               */


                        break;

                    case CAN_ID4:

                        /* RPAS - first 4 bytes
                         *
                         *                              */


                        break;


			default:
			break;
                    }
                }
             }
        }
        else
        {
            if(errorCode)
            {
                QString string = QString("Error detected, errorcode: " + QString::number(errorCode));

                emit msgReceived(string);
            }
        }
    }
}

// Make thread to stop. Because the thread might be waiting on a blocking call, the call must be unblocked first to actually make the
// thread stop
void CanWorkerThread::shutDown()
{
    m_running = false;
}


void CanWorkerThread::key_scan(union CAN_IO key_status)
{

    static U1 gear_count = 2;

/* Test IO */

if(key_status.io_bits.RIGHT_Arrow) /* bit 0 */
{
	qDebug()<<"RIGHT_Arrow_Button Pressed ";
}
if(key_status.io_bits.LEFT_Arrow) /* bit 1 */
{
	qDebug()<<"LEFT_Arrow_Button Pressed ";
}
if(key_status.io_bits.UP_Arrow)	/* bit 2 */
{
	qDebug()<<"UP_Arrow_Button Pressed ";

    u1_Sub_Menu -=1;
    if( u1_Main_Menu == 2 )
    {
    if(u1_Sub_Menu <=0)
        {
            u1_Sub_Menu = 4;
        }
    }
    else if(u1_Main_Menu != 2 && u1_Sub_Menu <= 0 )
    {
        u1_Sub_Menu = 3;
    }

    if(u1_Main_Menu == 4)
    {
        if(u1_Sub_Menu <= 0 )
        {
            u1_Sub_Menu = 2;
        }
    }

}
if(key_status.io_bits.DOWN_Arrow) /* bit 3 */
{
	qDebug()<<"DOWN_Arrow_Button Pressed ";
    u1_Sub_Menu +=1;
    if( u1_Main_Menu == 2 )
    {
        if(u1_Sub_Menu > 4)
        {
            u1_Sub_Menu = 1;
        }
    }
    else if(u1_Main_Menu != 2 && u1_Sub_Menu >3 )
    {
        u1_Sub_Menu = 1;
    }
    if(u1_Main_Menu == 4)
    {
        if(u1_Sub_Menu > 2)
        {
            u1_Sub_Menu = 1;
        }
    }
}
if(key_status.io_bits.Gear_up) /* bit 4 */
{
	qDebug()<<"Gear up_Button Pressed ";
}
if(key_status.io_bits.Gear_Down) /* bit 5 */
{
	qDebug()<<"Gear_Down_Button Pressed ";
}
if(key_status.io_bits.Reverse) /* bit 6 */
{
	qDebug()<<"Reverse_Button Pressed ";
}
if(key_status.io_bits.ESC_Button) /* bit 7 */
{
	if(u1_Main_Menu)
	{
		qDebug()<<"ESC_Button_Button Pressed ";
		u1_Esc_Menu = 1;
	}	
}
if(key_status.io_bits.OK_Button) /* bit 8 */
{
    if(!u1_Main_Menu)
    {
        u1_Main_Menu = 1;
    }
    else if(u1_Main_Menu != 3 && u1_Main_Menu != 5 && u1_Main_Menu != 6 && u1_Main_Menu != 7  && u1_Main_Menu != 8  && u1_Main_Menu != 12  && u1_Main_Menu != 13 )
    {
        u1_Ent_Menu = 1;
    }
	qDebug()<<"OK_Button Pressed ";

}

    /* Processing Gear */

    if(key_status.io_bits.Gear_up || key_status.io_bits.Gear_Down )
    {
        if(key_status.io_bits.Gear_up)
        {
            if(gear_count < 5 )
            {
                gear_count +=1;
            }
        }
        else if(key_status.io_bits.Gear_Down)
        {
            if(gear_count > 0 )
            {
                gear_count -=1;
            }
        }

        switch (gear_count)
        {
         case 0: // Park
             gear_level = 0;
            break;
         case 1: // Reverse
            gear_level = 1;
            break;
         case 2: // Nutral
            gear_level = 2;
            break;
        case 3: // Gear Drive
            gear_level = 3;
            break;
         case 4: // Gear 1
           gear_level = 4;
            break;
         case 5: // Gear 2
            gear_level = 5;
            break;
          default:
            break;
        }

    }
    if(gear_level == 1 )
    {
        emit update_Gears(gear_level,1);   // Enable RPAS
    }
    else
    {
       emit update_Gears(gear_level,0); // Disable RPAS
    }

}


  
	
#endif
