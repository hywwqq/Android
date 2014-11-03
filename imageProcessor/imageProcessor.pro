QT += gui widgets
INCLUDEPATH+=D:\Opencv2.4.1mw4.8\include\opencv\
D:\Opencv2.4.1mw4.8\include\opencv2\
D:\Opencv2.4.1mw4.8\include

LIBS+=D:\Opencv2.4.1mw4.8\lib\libopencv_calib3d243.dll.a\
D:\Opencv2.4.1mw4.8\lib\libopencv_contrib243.dll.a\
D:\Opencv2.4.1mw4.8\lib\libopencv_core243.dll.a\
D:\Opencv2.4.1mw4.8\lib\libopencv_features2d243.dll.a\
D:\Opencv2.4.1mw4.8\lib\libopencv_flann243.dll.a\
D:\Opencv2.4.1mw4.8\lib\libopencv_gpu243.dll.a\
D:\Opencv2.4.1mw4.8\lib\libopencv_highgui243.dll.a\
D:\Opencv2.4.1mw4.8\lib\libopencv_imgproc243.dll.a\
D:\Opencv2.4.1mw4.8\lib\libopencv_legacy243.dll.a\
D:\Opencv2.4.1mw4.8\lib\libopencv_ml243.dll.a\
D:\Opencv2.4.1mw4.8\lib\libopencv_objdetect243.dll.a\
D:\Opencv2.4.1mw4.8\lib\libopencv_video243.dll.a

# Add more folders to ship with the application, here
folder_01.source = qml/imageProcessor
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    imageProcessor.cpp

android-g++ {
    LIBS += -lgnustl_shared
}

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    imageProcessor.h

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += \
    android/AndroidManifest.xml \
    C:/Documents and Settings/Administrator/×ÀÃæ/Jiker20124105450825.jpg \
    C:/Documents and Settings/Administrator/×ÀÃæ/Jiker20124105450825.jpg

RESOURCES += \
    Source.qrc
