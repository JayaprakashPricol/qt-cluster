TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
    pointer.cpp \
    canworkerthread.cpp \
    canwrapper.cpp

RESOURCES += qml.qrc

include(./qextserialport-1.2rc/src/qextserialport.pri)
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    pointer.h \
    general.h \
    canworkerthread.h \
    canwrapper.h

OTHER_FILES += \
    main.qml
