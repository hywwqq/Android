import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Dialogs 1.1
import an.qt.ImageProcessor 1.0
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: rectangle1
    width: 640;
    height: 480;
    Image {
        id: bg;
        asynchronous: true;
        anchors.fill: parent;
        //fillMode: Image.PreserveAspectFit;
        source: "g.jpg";
    }
    BusyIndicator {
        id: busy;
        running: false;
        anchors.centerIn: parent;
        z: 2;
    }

    Label {
        id: stateLabel;
        visible: false;
        anchors.centerIn: parent;
    }

    Image {
        objectName: "imageViewer";
        id: imageViewer;
//        sourceSize.width: 400
//        sourceSize.height: 600
        fillMode: Image.PreserveAspectFit

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        asynchronous: true;
        onStatusChanged: {
            if (imageViewer.status === Image.Loading) {
                busy.running = true;
                stateLabel.visible = false;
            }
            else if(imageViewer.status === Image.Ready){
                busy.running = false;
            }
            else if(imageViewer.status === Image.Error){
                busy.running = false;
                stateLabel.visible = true;
                stateLabel.text = "ERROR";
            }
        }
    }

    ImageProcessor {
        id: processor;
        onFinished: {
            imageViewer.source = "file:///" +newFile;
        }
    }

    FileDialog {
        id: fileDialog;
        title: "Please choose a file";
        nameFilters: ["Image Files (*.jpg *.png *.gif)"];
//        FileDialog.favoriteFolders: mnt/sdcard ;
        onAccepted: {
           //console.log(fileDialog.fileUrl);
            imageViewer.source = fileDialog.fileUrl;
        }
    }

    Component{
        id: btnStyle;
        ButtonStyle {
            background: Rectangle {
                implicitWidth: 70
                implicitHeight: 25
                border.width: control.pressed ? 2 : 1
                border.color: (control.pressed || control.hovered) ? "#00A060" : "#888888"
                radius: 6
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#cccccc" : "#e0e0e0" }
                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                }
            }
        }
    }
    Grid {
        id: op;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.right: parent.right;
        anchors.rightMargin: 4;
        anchors.top:  parent.top;
        anchors.topMargin: 4;
        rows: 2;
        //columns: 10;
        rowSpacing: 4;
        columnSpacing: 4;
        z: 1;

        Button {
            id: openFile;
            text: "打开";
            onClicked: {
                fileDialog.visible = true;
                fileDialog.selectedNameFilter = fileDialog.nameFilters[1];
                fileDialog.open();
            }
            style: btnStyle;
            z: 1;
        }

        Button {
            text: "柔化";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor.Soften);
            }
        }

        Button {
            text: "灰度";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor.Gray);
            }
        }
        Button {
            text: "横百叶";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor.H_Shades);
            }
        }

        Button {
            text: "浮雕";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor.Emboss);
            }
        }
        Button {
            text: "黑白";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor.Binarize);
            }
        }

        Button {
            text: "底片";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor.Negative);
            }
        }

        Button {
            text: "锐化";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor.Sharpen);
            }
        }


        Button {
            text: "竖百叶";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor.S_Shades);
            }
        }
        Button {
            id: quit;
            text: "退出";
            onClicked: {
                Qt.quit()
            }
            style: btnStyle;
            z: 1;
        }
    }
}
