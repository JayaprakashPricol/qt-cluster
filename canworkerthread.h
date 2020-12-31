// Copyright 2012 CrossControl

#ifndef CANWORKERTHREAD_H
#define CANWORKERTHREAD_H
#include "general.h"

#ifdef EN_CAN_DRIVER

#include <QThread>


#include "canwrapper.h"

class CanWorkerThread : public QThread
{
    Q_OBJECT
public:
    explicit CanWorkerThread(QObject *parent = 0);

    void Init(CanWrapper *wrapper); // Initialize

    void run();         // start thread

    void shutDown();    // Make thread shut down


signals:
    void msgReceived(QString msg);
    //void mode_control(QVariant mode,QVariant submode,QVariant highlite_item,QVariant clicked);
    void update_Gears(QVariant,QVariant);
    //void sgnl_canid1(CAN_IO st_canid1);
    void compass_signal(QVariant E_Compass_Data, QVariant Restart_stat, QVariant can_notactive);



private:
    CanWrapper *m_can;  // Pointer to can wrapper class

   void key_scan(union CAN_IO key_status);

    bool m_running;     // Set to false to stop thread



};

#endif

#endif // CANWORKERTHREAD_H
