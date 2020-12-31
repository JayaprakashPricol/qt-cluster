#ifndef POINTER_H
#define POINTER_H

#include "general.h"
#include "qextserialport.h"
#include <QObject>
#include <QQmlApplicationEngine>
#include <QTimer>
#include <QQuickWindow>
#include <QQmlComponent>
#ifdef EN_CAN_DRIVER
#include <canworkerthread.h>
#endif


#define U1_SPD_ELE_NUM 19
#define U1_SPD_RESL 10

const U2 u2_TBL_SPD_MTR_DEG[ U1_SPD_ELE_NUM * 2 + 1 ] =
{
    (U2)U1_SPD_ELE_NUM,

    /* KMPH */
    (U2)0 * U1_SPD_RESL,
    (U2)10 * U1_SPD_RESL,
    (U2)20 * U1_SPD_RESL,
    (U2)30 * U1_SPD_RESL,
    (U2)40 * U1_SPD_RESL,
    (U2)50 * U1_SPD_RESL,
    (U2)60 * U1_SPD_RESL,
    (U2)70 * U1_SPD_RESL,
    (U2)80 * U1_SPD_RESL,
    (U2)90 * U1_SPD_RESL,
    (U2)100 * U1_SPD_RESL,
    (U2)110 * U1_SPD_RESL,
    (U2)120 * U1_SPD_RESL,
    (U2)130 * U1_SPD_RESL,
    (U2)140 * U1_SPD_RESL,
    (U2)150 * U1_SPD_RESL,
    (U2)160 * U1_SPD_RESL,
    (U2)170 * U1_SPD_RESL,
    (U2)180 * U1_SPD_RESL,

    /* DEG ANGLE */
    (U2)585,
    (U2)565,
    (U2)585,
    (U2)595,
    (U2)620,
    (U2)650,
    (U2)675,
    (U2)705,
    (U2)735,
    (U2)770,
    (U2)835,
    (U2)865,
    (U2)905,
    (U2)960,
    (U2)1020,
    (U2)1070,
    (U2)1130,
    (U2)1190,
    (U2)1160
};


const U2 u2_TBL_SPD_MTR_X[ U1_SPD_ELE_NUM * 2 + 1 ] =
{
    (U2)U1_SPD_ELE_NUM,

    /* KMPH */
    (U2)0 * U1_SPD_RESL,
    (U2)10 * U1_SPD_RESL,
    (U2)20 * U1_SPD_RESL,
    (U2)30 * U1_SPD_RESL,
    (U2)40 * U1_SPD_RESL,
    (U2)50 * U1_SPD_RESL,
    (U2)60 * U1_SPD_RESL,
    (U2)70 * U1_SPD_RESL,
    (U2)80 * U1_SPD_RESL,
    (U2)90 * U1_SPD_RESL,
    (U2)100 * U1_SPD_RESL,
    (U2)110 * U1_SPD_RESL,
    (U2)120 * U1_SPD_RESL,
    (U2)130 * U1_SPD_RESL,
    (U2)140 * U1_SPD_RESL,
    (U2)150 * U1_SPD_RESL,
    (U2)160 * U1_SPD_RESL,
    (U2)170 * U1_SPD_RESL,
    (U2)180 * U1_SPD_RESL,

    /* X */
    (U2)789,
    (U2)695,
    (U2)630,
    (U2)553,
    (U2)480,
    (U2)480,
    (U2)480,
    (U2)480,
    (U2)480,
    (U2)480,
    (U2)480,
    (U2)480,
    (U2)480,
    (U2)850,
    (U2)850,
    (U2)850,
    (U2)850,
    (U2)850,
    (U2)920
};

const U2 u2_TBL_SPD_MTR_Y[ U1_SPD_ELE_NUM * 2 + 1 ] =
{
    (U2)U1_SPD_ELE_NUM,

    /* KMPH */
    (U2)0 * U1_SPD_RESL,
    (U2)10 * U1_SPD_RESL,
    (U2)20 * U1_SPD_RESL,
    (U2)30 * U1_SPD_RESL,
    (U2)40 * U1_SPD_RESL,
    (U2)50 * U1_SPD_RESL,
    (U2)60 * U1_SPD_RESL,
    (U2)70 * U1_SPD_RESL,
    (U2)80 * U1_SPD_RESL,
    (U2)90 * U1_SPD_RESL,
    (U2)100 * U1_SPD_RESL,
    (U2)110 * U1_SPD_RESL,
    (U2)120 * U1_SPD_RESL,
    (U2)130 * U1_SPD_RESL,
    (U2)140 * U1_SPD_RESL,
    (U2)150 * U1_SPD_RESL,
    (U2)160 * U1_SPD_RESL,
    (U2)170 * U1_SPD_RESL,
    (U2)180 * U1_SPD_RESL,

    /* Y */
    (U2)328,
    (U2)328,
    (U2)328,
    (U2)328,
    (U2)328,
    (U2)283,
    (U2)243,
    (U2)206,
    (U2)170,
    (U2)137,
    (U2)130,
    (U2)113,
    (U2)96,
    (U2)120,
    (U2)137,
    (U2)139,
    (U2)144,
    (U2)145,
    (U2)145
};

/****************************************************** TACHOMETER ******************************************************/
#define U1_TACH_ELE_NUM 19
#define U1_TACH_RESL 10

#define U2_TACH_DEG_OFFSET 335

const U2 u2_TBL_TACH_MTR_DEG[ U1_TACH_ELE_NUM * 2 + 1 ] =
{
    (U2)U1_TACH_ELE_NUM,

    /* RPM */
    (U2)0 * U1_TACH_RESL,
    (U2)10 * U1_TACH_RESL,
    (U2)20 * U1_TACH_RESL,
    (U2)30 * U1_TACH_RESL,
    (U2)40 * U1_TACH_RESL,
    (U2)50 * U1_TACH_RESL,
    (U2)60 * U1_TACH_RESL,
    (U2)70 * U1_TACH_RESL,
    (U2)80 * U1_TACH_RESL,
    (U2)90 * U1_TACH_RESL,
    (U2)100 * U1_TACH_RESL,
    (U2)110 * U1_TACH_RESL,
    (U2)120 * U1_TACH_RESL,
    (U2)130 * U1_TACH_RESL,
    (U2)140 * U1_TACH_RESL,
    (U2)150 * U1_TACH_RESL,
    (U2)160 * U1_TACH_RESL,
    (U2)170 * U1_TACH_RESL,
    (U2)180 * U1_TACH_RESL,

    /* DEG ANGLE */
    (U2)(320 + U2_TACH_DEG_OFFSET),
    (U2)(335 + U2_TACH_DEG_OFFSET),
    (U2)(320 + U2_TACH_DEG_OFFSET),
    (U2)(300 + U2_TACH_DEG_OFFSET),
    (U2)(280 + U2_TACH_DEG_OFFSET),
    (U2)(250 + U2_TACH_DEG_OFFSET),
    (U2)(230 + U2_TACH_DEG_OFFSET),
    (U2)(200 + U2_TACH_DEG_OFFSET),
    (U2)(165 + U2_TACH_DEG_OFFSET),
    (U2)(130 + U2_TACH_DEG_OFFSET),
    (U2)(70 + U2_TACH_DEG_OFFSET),
    (U2)(30 + U2_TACH_DEG_OFFSET),
    (U2)(-5 + U2_TACH_DEG_OFFSET),
    (U2)(-60 + U2_TACH_DEG_OFFSET),
    (U2)(-110 + U2_TACH_DEG_OFFSET),
    (U2)(-170 + U2_TACH_DEG_OFFSET),
    (U2)(-230 + U2_TACH_DEG_OFFSET),
    (U2)(-300 + U2_TACH_DEG_OFFSET),
    (U2)(-270 + U2_TACH_DEG_OFFSET),
};

#define U2_TACH_X_OFFSET 178

const U2 u2_TBL_TACH_MTR_X[ U1_SPD_ELE_NUM * 2 + 1 ] =
{
    (U2)U1_TACH_ELE_NUM,

    /* RPM */
    (U2)0 * U1_TACH_RESL,
    (U2)10 * U1_TACH_RESL,
    (U2)20 * U1_TACH_RESL,
    (U2)30 * U1_TACH_RESL,
    (U2)40 * U1_TACH_RESL,
    (U2)50 * U1_TACH_RESL,
    (U2)60 * U1_TACH_RESL,
    (U2)70 * U1_TACH_RESL,
    (U2)80 * U1_TACH_RESL,
    (U2)90 * U1_TACH_RESL,
    (U2)100 * U1_TACH_RESL,
    (U2)110 * U1_TACH_RESL,
    (U2)120 * U1_TACH_RESL,
    (U2)130 * U1_TACH_RESL,
    (U2)140 * U1_TACH_RESL,
    (U2)150 * U1_TACH_RESL,
    (U2)160 * U1_TACH_RESL,
    (U2)170 * U1_TACH_RESL,
    (U2)180 * U1_TACH_RESL,

    /* X */
    (U2)(-118 + U2_TACH_X_OFFSET),
    (U2)(-32 + U2_TACH_X_OFFSET),
    (U2)(39 + U2_TACH_X_OFFSET),
    (U2)(101 + U2_TACH_X_OFFSET),
    (U2)(178 + U2_TACH_X_OFFSET),
    (U2)(178 + U2_TACH_X_OFFSET),
    (U2)(178 + U2_TACH_X_OFFSET),
    (U2)(178 + U2_TACH_X_OFFSET),
    (U2)(178 + U2_TACH_X_OFFSET),
    (U2)(178 + U2_TACH_X_OFFSET),
    (U2)(178 + U2_TACH_X_OFFSET),
    (U2)(178 + U2_TACH_X_OFFSET),
    (U2)(178 + U2_TACH_X_OFFSET),
    (U2)(90 + U2_TACH_X_OFFSET),
    (U2)(29 + U2_TACH_X_OFFSET),
    (U2)(-8 + U2_TACH_X_OFFSET),
    (U2)(-39 + U2_TACH_X_OFFSET),
    (U2)(-59 + U2_TACH_X_OFFSET),
    (U2)(-115 + U2_TACH_X_OFFSET),
};

#define U2_TACH_Y_OFFSET 0

const U2 u2_TBL_TACH_MTR_Y[ U1_SPD_ELE_NUM * 2 + 1 ] =
{
    (U2)U1_TACH_ELE_NUM,

    /* RPM */
    (U2)0 * U1_TACH_RESL,
    (U2)10 * U1_TACH_RESL,
    (U2)20 * U1_TACH_RESL,
    (U2)30 * U1_TACH_RESL,
    (U2)40 * U1_TACH_RESL,
    (U2)50 * U1_TACH_RESL,
    (U2)60 * U1_TACH_RESL,
    (U2)70 * U1_TACH_RESL,
    (U2)80 * U1_TACH_RESL,
    (U2)90 * U1_TACH_RESL,
    (U2)100 * U1_TACH_RESL,
    (U2)110 * U1_TACH_RESL,
    (U2)120 * U1_TACH_RESL,
    (U2)130 * U1_TACH_RESL,
    (U2)140 * U1_TACH_RESL,
    (U2)150 * U1_TACH_RESL,
    (U2)160 * U1_TACH_RESL,
    (U2)170 * U1_TACH_RESL,
    (U2)180 * U1_TACH_RESL,

    /* Y */
    (U2)(308 + U2_TACH_Y_OFFSET),
    (U2)(308 + U2_TACH_Y_OFFSET),
    (U2)(308 + U2_TACH_Y_OFFSET),
    (U2)(308 + U2_TACH_Y_OFFSET),
    (U2)(308 + U2_TACH_Y_OFFSET),
    (U2)(266 + U2_TACH_Y_OFFSET),
    (U2)(224 + U2_TACH_Y_OFFSET),
    (U2)(191 + U2_TACH_Y_OFFSET),
    (U2)(159 + U2_TACH_Y_OFFSET),
    (U2)(128 + U2_TACH_Y_OFFSET),
    (U2)(122 + U2_TACH_Y_OFFSET),
    (U2)(112 + U2_TACH_Y_OFFSET),
    (U2)(96 + U2_TACH_Y_OFFSET),
    (U2)(94 + U2_TACH_Y_OFFSET),
    (U2)(94 + U2_TACH_Y_OFFSET),
    (U2)(94 + U2_TACH_Y_OFFSET),
    (U2)(94 + U2_TACH_Y_OFFSET),
    (U2)(94 + U2_TACH_Y_OFFSET),
    (U2)(94 + U2_TACH_Y_OFFSET),
};

/*************************************** FUEL/TEMP ********************************/

#define U1_FUEL_TEMP_ELE_NUM 11
#define U1_FUEL_TEMP_RESL 10

const U2 u2_TBL_FUEL_TEMP_MTR_X[ U1_SPD_ELE_NUM * 2 + 1 ] =
{
    (U2)U1_FUEL_TEMP_ELE_NUM,

    /* KMPH */
    (U2)0 * U1_FUEL_TEMP_RESL,
    (U2)10 * U1_FUEL_TEMP_RESL,
    (U2)20 * U1_FUEL_TEMP_RESL,
    (U2)30 * U1_FUEL_TEMP_RESL,
    (U2)40 * U1_FUEL_TEMP_RESL,
    (U2)50 * U1_FUEL_TEMP_RESL,
    (U2)60 * U1_FUEL_TEMP_RESL,
    (U2)70 * U1_FUEL_TEMP_RESL,
    (U2)80 * U1_FUEL_TEMP_RESL,
    (U2)90 * U1_FUEL_TEMP_RESL,
    (U2)100 * U1_FUEL_TEMP_RESL,

    /* X */
    (U2)151,
    (U2)140,
    (U2)129,
    (U2)118,
    (U2)107,
    (U2)96,
    (U2)85,
    (U2)74,
    (U2)63,
    (U2)52,
    (U2)41,
};

typedef struct            /* Stepper motor parameters */
{
    U2  u2_cur;
    U2  u2_out;
    U2  u2_trgt;
    U4  u4_trgt_sum;
    U2  u2_diff;
    U1  u1_new;
    U1  u1_dir;
}STEPPER_PARAM;

/***************************************************************************************************************************************/
/*                                                           MACRO DEFINITION                                                          */
/***************************************************************************************************************************************/
#define U4_MAXELESTEPSUM    (U4)4480000     /* Maximum sum of electrical angle (3500 * 128) */
#define U2_TRANGLOF88       (U2)3962        /* Triangle equivalent of 88 */
#define U1_STEPMIN          (U1)1           /* Minimum possible step for stepper motor */
#define U1_STEPMAX          (U1)89          /* Maximum possible step for stepper motor */

/***************************************************************************************************************************************/
/*                                                       CONSTANT DATA DEFINITION                                                      */
/***************************************************************************************************************************************/
const U1 u1_STEP_SqrtTbl[256] =    /* Square root Table */
{
    0, 16, 22, 27, 32, 35, 39, 42, 45, 48, 50, 53, 55, 57, 59, 61, 64, 65, 67,
    69, 71, 73, 75, 76, 78, 80, 81, 83, 84, 86, 87, 89, 90, 91, 93, 94, 96, 97,
    98, 99, 101, 102, 103, 104, 106, 107, 108, 109, 110, 112, 113, 114, 115,
    116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 128, 128, 129, 130,
    131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 144,
    145, 146, 147, 148, 149, 150, 150, 151, 152, 153, 154, 155, 155, 156, 157,
    158, 159, 160, 160, 161, 162, 163, 163, 164, 165, 166, 167, 167, 168, 169,
    170, 170, 171, 172, 173, 173, 174, 175, 176, 176, 177, 178, 178, 179, 180,
    181, 181, 182, 183, 183, 184, 185, 185, 186, 187, 187, 188, 189, 189, 190,
    191, 192, 192, 193, 193, 194, 195, 195, 196, 197, 197, 198, 199, 199, 200,
    201, 201, 202, 203, 203, 204, 204, 205, 206, 206, 207, 208, 208, 209, 209,
    210, 211, 211, 212, 212, 213, 214, 214, 215, 215, 216, 217, 217, 218, 218,
    219, 219, 220, 221, 221, 222, 222, 223, 224, 224, 225, 225, 226, 226, 227,
    227, 228, 229, 229, 230, 230, 231, 231, 232, 232, 233, 234, 234, 235, 235,
    236, 236, 237, 237, 238, 238, 239, 240, 240, 241, 241, 242, 242, 243, 243,
    244, 244, 245, 245, 246, 246, 247, 247, 248, 248, 249, 249, 250, 250, 251,
    251, 252, 252, 253, 253, 254, 254, 255
};

class MainWindow : public QObject
{
    Q_OBJECT

    public:
    QTimer timer;
    QQmlApplicationEngine engine;
    MainWindow(QObject *parent = 0);
    QQuickWindow *wnd_Normal;

    void test_cppcall();

    ~MainWindow();
     void Intiate(QString device);

    signals:
    void  cppsignal(QVariant value1,QVariant value2,QVariant value3,QVariant value4,
                    QVariant value5,QVariant value6,QVariant value7,QVariant value8,
                    QVariant value9,QVariant value10,QVariant value11,QVariant value12,
                    QVariant value13,QVariant value14,QVariant value15,QVariant value16);
    void bluetooth_alert(QVariant,QVariant);

    public slots:
    void timeOut();
    void cppSlot(QString);
    void cppSlot1(QString);
    void cppSlot2(QString);
    void cppSlot3(QString);

    void cppSlot_Self_chk_Gauges(QString,QString,QString,QString);
    void cppSlot_Menus(QString,QString,QString,QString,QString);
    void onDataAvailable();
    void msgReceived(QString msg);
    void can_slfchk(QString get_slf_chk);

private:
     QextSerialPort *port;
     QString PreviousData;

#ifdef EN_CAN_DRIVER
    CanWrapper *can;                    // Can wrapper class

    int m_receivedMessages;             // Number of received messages

    CanWorkerThread *m_workerThread;    // Thread that blocks and listens for CAN messages.

#endif

};



#endif // POINTER_H

