/*************************************************************** FILE DETAILS **********************************************************/
/* NAME OF THE FILE			:	S_SM.c									                                                               */
/* MODULE NAME			    :	Stepper Module			    		                                                                   */
/* PURPOSE  				:	Stepper motor hardware module                                                                          */
/* COPYRIGHTS				:	PRICOL LTD		                                                                                       */
/* TEMPALTE VERSION			:	V1.2 - CREATED AND MAINTAINED BY ANANDKUMAR.P                                                          */
/********************************************************** MODIFICATION HISTORY *******************************************************/
/* INITIAL VERSION			:	V1.0, INITIAL VERSION (Phase 2)		                                                                   */
/* CODE 					:	NOV 2012, PRICOL, ANAND KUMAR.P                                                                        */
/* UPDATE					:	FEB 2013, ANANDKUMAR.P					                                                               */
/***************************************************************************************************************************************/

/***************************************************************************************************************************************/
/*                                                            INCLUDE FILES                                                            */
/***************************************************************************************************************************************/
#include "general.h"
#include "pointer.h"
#include <QDebug>
#include <QQuickView>
#include <QProcess>

#include <QMetaObject>
#ifdef EN_CAN_DRIVER
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <sys/uio.h>
#include <net/if.h>
#include <linux/can.h>
#include <linux/can/raw.h>
#include <assert.h>
#include <stdio.h>
#include <QString>
#include <canworkerthread.h>
#endif
/***************************************************************************************************************************************/
/*                                                           MACRO DEFINITION                                                          */
/***************************************************************************************************************************************/
#define UCMAXSTEP 4

/***************************************************************************************************************************************/
/*                                                         VARIABLE DECLARATION                                                        */
/***************************************************************************************************************************************/
STEPPER_PARAM ST_step[UCMAXSTEP];

U2 speed;
U2 tach;
U2 fuel = 200;
U2 temp = 200;


S2 spd_deg;
S2 spd_x;
S2 spd_y;
S2 tach_deg;
S2 tach_x;
S2 tach_y;

U2 qml_val;
U1 ENABLE_CAN_DATA = 0;
U1 qml_slfchk_complete = 0 ;

U1 u1_Auto_demo;
U1 u1_Main_Menu;
U1 u1_Sub_Menu;
U1 u1_Ent_Menu;
U1 u1_Esc_Menu;

U2 fuel_y,temp_y;
/***************************************************************************************************************************************/
/*                                                         FUNCTION DECLARATION                                                        */
/***************************************************************************************************************************************/
static U1 s_u1TriangleToDecimal( U2 );   /* Conversion of Triangular number to Decimal number */

/******************************************************** FUNCTION DEFINITION **********************************************************/
/* FUNCTION NAME	:	sSTEP_vdInit    													                                           */
/* INTERFACE		:	void sSTEP_vdInit( void )             											                               */
/* PURPOSE		    :	Initialize Stepper Motor param                                                                                 */
/* ARGUMENT		    :	void              								                                                               */
/* RETURN TYPE		:	void              																                               */
/* AUTHOR			:	Anand kumar.P																	                               */
/* DATE			    :	FEB 2013													                                                   */
/* UPDATE			:																		                                           */
/***************************************************************************************************************************************/
void sSTEP_vdInit( void )
{
    U1 i;

    //hSTEP_vdInit( );        /* Initialize */
    for( i = 0; i < UCMAXSTEP; i++ )
    {
        ST_step[ i ].u2_cur = 0;
        ST_step[ i ].u2_out = 0;
        ST_step[ i ].u2_trgt = 0;
        ST_step[ i ].u4_trgt_sum = 0;
        ST_step[ i ].u2_diff = 0;
        ST_step[ i ].u1_new = 0;
        ST_step[ i ].u1_dir = 0;
    }
}

/******************************************************** FUNCTION DEFINITION **********************************************************/
/* FUNCTION NAME	:	sSTEP_u1SetCurPos    													                                       */
/* INTERFACE		:	U1 sSTEP_u1SetCurPos( U1 u1_Channel, U2 u2_Degree )             											   */
/* PURPOSE		    :	Send Current Position to Stepper Motor Channel                                                                 */
/* ARGUMENT		    :	U1 SM_Channel No, Electrical degrees             								                               */
/* RETURN TYPE		:	U1 SUCCESS, FAILURE              																               */
/* AUTHOR			:	Anand kumar.P																	                               */
/* DATE			    :	FEB 2013													                                                   */
/* UPDATE			:																		                                           */
/***************************************************************************************************************************************/
U1 sSTEP_u1SetCurPos( U1 u1_Channel, U2 u2_Degree )
{
    U1 u1_Status;

    u1_Status = FAILURE;
    if( u1_Channel < UCMAXSTEP )
    {
        ST_step[ u1_Channel ].u2_cur = u2_Degree;
        u1_Status = SUCCESS;
    }
    return( u1_Status );
}

/******************************************************** FUNCTION DEFINITION **********************************************************/
/* FUNCTION NAME	:	sSTEP_vdCalcAccDec    													                                       */
/* INTERFACE		:	void sSTEP_vdCalcAccDec( void )             											                       */
/* PURPOSE		    :	Calculating Acceleration and Decelaration for stepper motors                                                   */
/* ARGUMENT		    :	void              								                                                               */
/* RETURN TYPE		:	void              																                               */
/* AUTHOR			:	Anand kumar.P																	                               */
/* DATE			    :	NOVEMBER 2012														                                           */
/* UPDATE			:																		                                           */
/***************************************************************************************************************************************/
void sSTEP_vdCalcAccDec( void )
{
    U1 i;
    U1 u1_deci;
    U1 u1_AvailSM;

    u1_deci = 0;
    u1_AvailSM = 0x0F;//lSTEP_u1GetAvailSM( );                                   /* Get available stepper motors from hw */

    for( i = 0; i < UCMAXSTEP; i++ )                                    /* Check upto maximum available stepper motors */
    {
        if( ( ( (U1)1 << i ) & u1_AvailSM ) != FALSE )                  /* Check the availability of current motor */
        {
            ST_step[ i ].u4_trgt_sum += (U4)ST_step[ i ].u2_cur;        /* Get Target Elec Angle value from particular module */

            if( ST_step[ i ].u4_trgt_sum > U4_MAXELESTEPSUM )           /* If maximum Elec reached, keep maximum */
            {
                ST_step[ i ].u4_trgt_sum = U4_MAXELESTEPSUM;
            }

            ST_step[ i ].u2_trgt = (U2)( ST_step[ i ].u4_trgt_sum >> (U4)U1_DIV_RSFT_128 );          /* Weighted Average by 128 */
            ST_step[ i ].u4_trgt_sum -= ST_step[ i ].u2_trgt;

            if( ST_step[ i ].u2_trgt > ST_step[ i ].u2_out )                        /* If difference is positive */
            {
                if( ST_step[ i ].u1_dir == 1 )
                {
                    if( ST_step[ i ].u1_new > 0 )
                    {
                        ST_step[ i ].u1_new -= U1_STEPMIN;
                        ST_step[ i ].u2_out = ST_step[ i ].u2_out - ST_step[ i ].u1_new;
                    }
                    else
                    {
                       ST_step[ i ].u1_dir = 0;
                    }
                }
                else
                {
                    ST_step[ i ].u2_diff = ST_step[ i ].u2_trgt - ST_step[ i ].u2_out;

                    if( ST_step[ i ].u2_diff < U2_TRANGLOF88 )                          /* If distance is less for max acceleration */
                    {
                        u1_deci = s_u1TriangleToDecimal( ST_step[ i ].u2_diff );         /* calc acc value */
                    }
                    else
                    {
                        u1_deci = U1_STEPMAX;                                           /* setup max current acceleration */
                    }

                    if( ST_step[ i ].u1_new < u1_deci )
                    {                                                                   /* gradually increase upto max current */
                        ST_step[ i ].u1_new += U1_STEPMIN;    //FAcc
                        ST_step[ i ].u1_dir = 0;
                    }
                    else if( ST_step[ i ].u1_new > u1_deci )
                    {
                        ST_step[ i ].u1_new -= U1_STEPMIN;    //FDecc                          /* gradually increase upto max current */
                    }

                    ST_step[ i ].u2_out = ST_step[ i ].u2_out + ST_step[ i ].u1_new;
                }
            }
            else if( ST_step[ i ].u2_trgt < ST_step[ i ].u2_out )                   /* If difference is negative */
            {
                if( ST_step[ i ].u1_dir == 0 )
                {
                    if( ST_step[ i ].u1_new > 0 )
                    {
                        ST_step[ i ].u1_new -= U1_STEPMIN;
                        ST_step[ i ].u2_out = ST_step[ i ].u2_out + ST_step[ i ].u1_new;
                    }
                    else
                    {
                       ST_step[ i ].u1_dir = 1;
                    }
                }
                else
                {
                    ST_step[ i ].u2_diff = ST_step[ i ].u2_out - ST_step[ i ].u2_trgt;

                    if( ST_step[ i ].u2_diff < U2_TRANGLOF88 )                          /* If distance is less for max deceleration */
                    {
                        u1_deci = s_u1TriangleToDecimal( ST_step[ i ].u2_diff );         /* calc dec value */
                    }
                    else
                    {
                        u1_deci = U1_STEPMAX;                                           /* setup max current deceleration */
                    }

                    if( ST_step[ i ].u1_new < u1_deci )                                 /* gradually increase upto max current */
                    {
                        ST_step[ i ].u1_new += U1_STEPMIN;     //RAcc
                    }
                    else if( ST_step[ i ].u1_new > u1_deci )                            /* gradually decrease upto max current */
                    {
                        ST_step[ i ].u1_new -= U1_STEPMIN;     //RDecc
                    }

                    if( ST_step[ i ].u2_out > ST_step[ i ].u1_new )                     /* Guard for negative value */
                    {
                        ST_step[ i ].u2_out = ST_step[ i ].u2_out - ST_step[ i ].u1_new;
                    }
                    else if( ST_step[ i ].u2_out > 0 )
                    {
                        ST_step[ i ].u2_out = ST_step[ i ].u2_out - 1;
                        ST_step[ i ].u1_new = 0;
                    }
                }
            }
            else
            {
                ST_step[ i ].u2_diff = 0;
                ST_step[ i ].u1_dir = 0;
            }
        //hSTEP_vdDat2_Stepper( i, ST_step[ i ].u2_out );
        }
    }
}

/******************************************************** FUNCTION DEFINITION **********************************************************/
/* FUNCTION NAME	:	s_u1TriangleToDecimal													                                       */
/* INTERFACE		:	static U1 s_u1TriangleToDecimal(U2 u2trianglval)											                   */
/* PURPOSE			:	Conversion of Triangular number to Decimal number				                                               */
/* ARGUMENT		    :	U2 Triangle number								                                                               */
/* RETURN TYPE		:	U1 Decimal number 																                               */
/* AUTHOR			:	Anand kumar.P																	                               */
/* DATE			    :	NOVEMBER 2012														                                           */
/* UPDATE			:																		                                           */
/***************************************************************************************************************************************/
static U1 s_u1TriangleToDecimal( U2 u2trianglval )
{
    U1  u1_temp;

    u1_temp = 0;

    u2trianglval <<= U1_MUL_LSFT_2;                                                      /* Multiply by 2 */
    if( u2trianglval > (U2)0xFF )                                                   /* if greater than 8 bits */
    {
        if( u2trianglval > (U2)0xFFF )                                              /* if greater than 12 bits */
        {
            u1_temp = ( u1_STEP_SqrtTbl[ (U1)( u2trianglval >> (U2)U1_DIV_RSFT_64 ) ] >> U1_DIV_RSFT_2 ) + 1;
        }
        else if( u2trianglval > (U2)0x3FF )                                         /* if greater than 10 bits */
        {
            u1_temp = ( u1_STEP_SqrtTbl[ (U1)( u2trianglval >> (U2)U1_DIV_RSFT_16 ) ] >> U1_DIV_RSFT_4 ) + 1;
        }
        else                                                                        /* if less than 10 bits */
        {
            u1_temp = ( u1_STEP_SqrtTbl[ (U1)( u2trianglval >> (U2)U1_DIV_RSFT_4 ) ] >> U1_DIV_RSFT_8 ) + 1;
        }

        if( (U2)u1_temp * (U2)u1_temp > u2trianglval )                              /* rounding of fraction */
        {
            u1_temp--;
        }
        else
        {
          ;                                                                         /* nothing */
        }

        return( u1_temp );
    }
    else                                                                       /* if less than 256 get sqrt directly from lookup table */
        return( (U1)u1_STEP_SqrtTbl[ (U1)u2trianglval ] >> U1_DIV_RSFT_16 );
}

/******************************************************** FUNCTION DEFINITION **********************************************************/
/* FUNCTION NAME	:	sSTEP_u1Complete    													                                       */
/* INTERFACE		:	U1 sSTEP_u1Complete( void )             											                           */
/* PURPOSE		    :	Check for Stepper motor in zero position                                                                       */
/* ARGUMENT		    :	void              								                                                               */
/* RETURN TYPE		:	U1 OVER, NOTOVER             																                   */
/* AUTHOR			:	Anand kumar.P																	                               */
/* DATE			    :	FEB 2013													                                                   */
/* UPDATE			:																		                                           */
/***************************************************************************************************************************************/
U1 sSTEP_u1Complete( void )
{
    U1 i;
    U1 u1_Sts;

    u1_Sts = OVER;

    for( i = 0; i < UCMAXSTEP; i++ )
    {
        if( ST_step[ i ].u2_out != 0 )
        {
            u1_Sts = NOTOVER;
            break;
        }
    }
    return( u1_Sts );
}

U2	u2_Map1dU2(U2 u2_x, const U2 *u2_map)
{
    U4		u4_wka;							/* Map interpolation work value 1	*/
    U4		u4_wkb;							/* Map interpolation work value 2	*/
    U2		u2_xlo;							/* X-axis point area lower limit	*/
    U2		u2_xup;							/* X-axis point area upper limit	*/
    U2		u2_ylo;							/* Y-axis point area lower limit	*/
    U2		u2_yup;							/* Y-axis point area upper limit	*/
    U2		u2_xoff;						/* X-axis point area			*/
    U2		u2_yoff;						/* Y-axis point area			*/
    U2		u2_tblmax;					/* The number of table elements	*/
    U2		u2_y;							  /* Map interpolation value		*/

    u2_tblmax = *u2_map;			  /* The number acquisition of elements	*/
    if(u2_tblmax < (U2)1){
        return ((U2)0);						/* The number of elements abnormal guard	*/
    }

    for(u2_xoff = (U2)1; u2_xoff <= u2_tblmax; u2_xoff++){
                                            /* Applicable area judging		*/
        if(u2_x <= *(u2_map + u2_xoff)){	/* X[i-1] < input-value <= X[i]	*/
            break;
        }
    }
    u2_yoff = u2_xoff + u2_tblmax; 			/* Upper limit decision of Y	*/

    u2_ylo = *(u2_map + (u2_yoff - (U2)1));	/* Applicable area value acquisition	*/
    u2_yup = *(u2_map + u2_yoff);
    u2_xlo = *(u2_map + (u2_xoff - (U2)1));
    u2_xup = *(u2_map + u2_xoff);

    if(u2_xoff == (U2)1){					/* Input-value <= X[1] (minimum)	*/
        u2_y = u2_yup;
    }
    else if(u2_xoff > u2_tblmax){			/* X[n] < input-value(maximum over)	*/
        u2_y = u2_ylo;
    }
    else{									/* X[1] < input-value <= X[n]	*/
        u4_wka = (U4)u2_ylo * (U4)(u2_xup - u2_x) + (U4)u2_yup * (U4)(u2_x - u2_xlo);
        u4_wkb = (U4)(u2_xup - u2_xlo);
        if(u4_wkb != (U4)0){				/* 0 division check				*/
            u2_y = (U2)(u4_wka / u4_wkb);
        }
        else{
            u2_y = (U2)0;					/* "0" is returned if divided by 0	*/
        }
    }
    return(u2_y);
}


MainWindow::MainWindow(QObject *parent) : QObject(parent)
{
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    wnd_Normal = engine.rootObjects()[0]->findChild<QQuickWindow *>("base_window");

    timer.setInterval(2);

    connect(&timer,SIGNAL(timeout()),this,SLOT(timeOut()));
    timer.start();

    connect(this, SIGNAL(cppsignal(QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,
                                   QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)),
                         wnd_Normal, SLOT(qml_slot(QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,
                                                   QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant,QVariant)));

     connect(wnd_Normal, SIGNAL(qSig_Main_Menu(QString)),this, SLOT(cppSlot(QString)));
     connect(wnd_Normal, SIGNAL(qSig_Sub_Menu(QString)),this, SLOT(cppSlot1(QString)));
     connect(wnd_Normal, SIGNAL(qSig_Ent_Menu(QString)),this, SLOT(cppSlot2(QString)));
     connect(wnd_Normal, SIGNAL(qSig_Esc_Menu(QString)),this, SLOT(cppSlot3(QString)));
     port = new QextSerialPort("/dev/ttymxc4", QextSerialPort::EventDriven);
     port->setBaudRate(BAUD115200);
     port->setFlowControl(FLOW_OFF);
     port->setParity(PAR_NONE);
     port->setDataBits(DATA_8);
     port->setStopBits(STOP_1);
     connect(port, SIGNAL(readyRead()), this, SLOT(onDataAvailable()));
     if(!port->open(QIODevice::ReadWrite))
     {
         qDebug() << "Bluetooth device failed to open:" << port->errorString();
     }
     else
     {
          qDebug() << " Serial Port Opened:" << port->errorString();
     }
#ifdef EN_CAN_DRIVER
   can = new CanWrapper();
   m_workerThread = new CanWorkerThread();
connect(m_workerThread, SIGNAL(compass_signal(QVariant,QVariant,QVariant)),wnd_Normal, SLOT(setCompass(QVariant,QVariant,QVariant)));

   connect(m_workerThread, SIGNAL(update_Gears(QVariant,QVariant)),wnd_Normal, SLOT(setGears(QVariant,QVariant)));

   int ret = (bool) connect(m_workerThread, SIGNAL(msgReceived(QString)), this , SLOT(msgReceived(QString)));

   assert(ret);

   Intiate("can0");

#endif
     connect(wnd_Normal, SIGNAL(qSig_Self_chk_Gauges(QString,QString,QString,QString)),
                  this, SLOT(cppSlot_Self_chk_Gauges(QString,QString,QString,QString)));

     connect(wnd_Normal, SIGNAL(qSig_Menus(QString,QString,QString,QString,QString)),
                  this, SLOT(cppSlot_Menus(QString,QString,QString,QString,QString)));
				  
				   /* Bluetooth */

   connect(this,SIGNAL(bluetooth_alert(QVariant,QVariant)),wnd_Normal, SLOT(qml_bluetoothdata(QVariant,QVariant)));
   connect(wnd_Normal,SIGNAL(qSig_Selfchk_completed(QString)),this,SLOT(can_slfchk(QString)));


}


MainWindow::~MainWindow()
{
    //delete object;
}

void MainWindow::timeOut() // timer timout function for 1 secs
{
    test_cppcall();
}


void MainWindow::cppSlot(QString str)
{
  bool status;

    u1_Main_Menu = str.toInt(&status,10);
    if(status)
    {
        qDebug()<<"Main_Menu"<<u1_Main_Menu;
    }
    else
    {
        ;
    }
}

void MainWindow::cppSlot1(QString str)
{
  bool status;

    u1_Sub_Menu = str.toInt(&status,10);
    if(status)
    {
        qDebug()<<"Sub_Menu"<<u1_Sub_Menu;
    }
    else
    {
        ;
    }
}

void MainWindow::cppSlot2(QString str)
{
  bool status;

    u1_Ent_Menu = str.toInt(&status,10);
    if(status)
    {
        qDebug()<<"Ent_Menu"<<u1_Ent_Menu;
    }
    else
    {
        ;
    }
}

void MainWindow::cppSlot3(QString str)
{
  bool status;

    u1_Esc_Menu = str.toInt(&status,10);
    if(status)
    {
        qDebug()<<"Esc_Menu"<<u1_Esc_Menu;
    }
    else
    {
        ;
    }
}

void MainWindow::cppSlot_Menus(QString str0,QString str1,QString str2,QString str3,QString str4)
{
  bool status;
    u1_Auto_demo = str0.toInt(&status,10);

 /*   if( u1_Auto_demo == 0 )
    {
        u1_Main_Menu = str1.toInt(&status,10);
        u1_Sub_Menu = str2.toInt(&status,10);
        u1_Ent_Menu = str3.toInt(&status,10);
        u1_Esc_Menu = str4.toInt(&status,10);
    }*/
/*    qDebug()<<"Main_Menu"<<u1_Main_Menu;
    qDebug()<<"Sub_Menu"<<u1_Sub_Menu;
    qDebug()<<"Ent_Menu"<<u1_Ent_Menu;
    qDebug()<<"Esc_Menu"<<u1_Esc_Menu;*/
}

void MainWindow::cppSlot_Self_chk_Gauges(QString str1,QString str2,QString str3,QString str4)
{
  bool status;
    ST_step[ 0 ].u2_cur = str1.toInt(&status,10);
    ST_step[ 1 ].u2_cur = str2.toInt(&status,10);
    ST_step[ 2 ].u2_cur = str3.toInt(&status,10);
    ST_step[ 3 ].u2_cur = str4.toInt(&status,10);
}

void MainWindow::onDataAvailable()
{
    QString mobNo;

    if(port->bytesAvailable()>0)
    {
        QByteArray data = port->readAll();

        QString strData= QString::fromLatin1(data,data.length());
        strData=PreviousData+strData;
        if(!strData.contains("\r\n"))
        {
            PreviousData=strData;
            return;
        }

        PreviousData="";//strData.mid(strData.lastIndexOf('\r\n'));

        qDebug()<<"strdata"<<strData;

        if (strData.contains("CALLERID "))
        {
            int new_index = strData.indexOf("\"+");
            if(new_index != -1 )
            {
                new_index+= 1;
                int EndIndex=strData.indexOf("\"",new_index+2);
                mobNo=strData.mid(new_index,EndIndex-new_index);
                qDebug()<<"mob number"<<mobNo;
                emit bluetooth_alert(mobNo,1);
            }
        }
        if (strData.contains("RING 0 "))
        {
            // pairing Done
            emit bluetooth_alert("",1);
             qDebug()<<" pairing Done";
        }
        else if(strData.contains("\"callsetup\" 0"))
        {
            // call disconnected
            emit bluetooth_alert("",1);
            qDebug()<<" call discon ";
        }
        else if(strData.contains("NO CARRIER 0 "))
        {
            //device unpaired
            emit bluetooth_alert("",0);
            qDebug()<<" Device Unpaired";
        }
    }
}

void MainWindow::test_cppcall()
{
    sSTEP_vdCalcAccDec();

    speed = ST_step[ 0 ].u2_out;
    tach = ST_step[ 1 ].u2_out;
    fuel = ST_step[ 2 ].u2_out;
    temp = ST_step[ 3 ].u2_out;

    spd_deg = u2_Map1dU2(speed,&u2_TBL_SPD_MTR_DEG[0]);
    spd_x = u2_Map1dU2(speed,&u2_TBL_SPD_MTR_X[0]);
    spd_y = u2_Map1dU2(speed,&u2_TBL_SPD_MTR_Y[0]);

    tach_deg = u2_Map1dU2(tach,&u2_TBL_TACH_MTR_DEG[0]);
    tach_deg = tach_deg - U2_TACH_DEG_OFFSET;
    tach_x = u2_Map1dU2(tach,&u2_TBL_TACH_MTR_X[0]);
    tach_x = tach_x - U2_TACH_X_OFFSET;
    tach_y = u2_Map1dU2(tach,&u2_TBL_TACH_MTR_Y[0]);
    tach_y = tach_y - U2_TACH_Y_OFFSET;

    fuel_y = u2_Map1dU2(fuel,&u2_TBL_FUEL_TEMP_MTR_X[0]);
    temp_y = u2_Map1dU2(temp,&u2_TBL_FUEL_TEMP_MTR_X[0]);

   // emit cppsignal(u1_Main_Menu,u1_Sub_Menu,u1_Ent_Menu,u1_Esc_Menu,0,0);
    emit cppsignal(speed,tach,fuel,temp,spd_deg,spd_x,spd_y,tach_deg,tach_x,tach_y,fuel_y,temp_y,
                   u1_Main_Menu,u1_Sub_Menu,u1_Ent_Menu,u1_Esc_Menu);
}

void MainWindow::Intiate(QString device)
{
    int ret;
    int errorCode;

#ifdef EN_CAN_DRIVER

    // Close old connection (if there is one) and shut down worker threads
    can->Close();

    // Tell thread to shut down, force if problem
    m_workerThread->shutDown();

    if(!m_workerThread->wait(3000))
    {
        m_workerThread->terminate();
    }


    // Init new connection
    ret = can->Init(device.toUtf8(), errorCode);
    if(!ret)
    {
       qDebug()<<"Could not initialize CAN net. Error code: " + QString::number(errorCode);
        return;
    }

    // Enable error messages to be reported
    can->EnableErrorMessages();

    // initialize worker thread
    m_workerThread->Init(can);

    // Start thread
    m_workerThread->start();

#endif

}

void MainWindow::msgReceived(QString msg)
{
    // Append message to log
   qDebug()<<msg;
#ifdef EN_CAN_DRIVER
    // Increase message counter
    m_receivedMessages++;
#endif

}
void MainWindow::can_slfchk(QString get_slf_chk)
{
    bool status;
    if( get_slf_chk.toInt(&status,10) == 1)
    {
        qml_slfchk_complete = true;
    }
    else
    {
        qml_slfchk_complete = false;
    }
}
