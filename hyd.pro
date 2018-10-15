#-------------------------------------------------
#
# Project created by QtCreator 2018-10-10T14:05:41
#
#-------------------------------------------------

QT       += core gui



greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = hyd
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11

SOURCES += \
    baselecontrol.cpp \
    mainwindow.cpp \
    main.cpp

HEADERS +=\
        mainwindow.h\
        basilecontrol.h\

FORMS += \
        mainwindow.ui

##  for add the pylon5'include and lib path
############################################
QMAKE_CXXFLAGS+=$(shell /opt/pylon5/bin/pylon-config --cflags)
QMAKE_LFLAGS+=$(shell /opt/pylon5/bin/pylon-config --libs-rpath)
LIBS+=$(shell /opt/pylon5/bin/pylon-config --libs)


unix{
INCLUDEPATH +=/opt/pylon5/include \
                /home/su/下载/pylon-5.1.0.12682-x86_64/Samples/C++/include
LIBS += -L/opt/pylon5/lib64/
}
# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    application.qrc
