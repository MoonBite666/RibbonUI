import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import RibbonUI
import "components"

RibbonWindow {
    id:root
    width: 1200
    height: 800
    title: qsTr("RibbonUI APP")
    comfirmedQuit: true
    property bool modernStyle: RibbonTheme.modernStyle
    RibbonTour{
        id: tour
        RibbonTourItem{
            title: qsTr("Tab Bar")
            text: qsTr("A tab bar for window, let user choose the controllers.")
            target: tab_bar
            enterFunc: ()=>{
                tab_bar.folded = false
                tour.refresh(300) // Use it if has animation
            }
        }
        RibbonTourItem{
            title: qsTr("Tab Bar Buttons")
            text: qsTr("Tool buttons at the top of tab bar.")
            target: tab_bar.tab_bar_tool
        }
        RibbonTourItem{
            title: qsTr("Sliders")
            text: qsTr("Vertical/Horizental sliders with/without buttons.")
            target: tab_bar.slider_layout
            enterFunc: ()=>{
                tab_bar.setPage(0)
                tab_bar.slider_with_btn.value = 70
                tab_bar.slider_without_btn.value = 70
                tour.refresh(500)
            }
            exitFunc: ()=>{
                tab_bar.slider_with_btn.value = 50
                tab_bar.slider_without_btn.value = 50
            }
        }
        RibbonTourItem{
            title: qsTr("Switch Buttons")
            text: qsTr("Switch buttons with/without background color or grabber text.")
            target: tab_bar.switch_layout
            enterFunc: ()=>tab_bar.btn_with_color_and_grabberText.checked = true
            exitFunc: ()=>tab_bar.btn_with_color_and_grabberText.checked = false
        }
        RibbonTourItem{
            title: qsTr("CheckBoxs")
            text: qsTr("CheckBoxs with colorful background or with/without label text.")
            target: tab_bar.checkbox_layout
        }
        RibbonTourItem{
            title: qsTr("Buttons")
            text: qsTr("Buttons with/without background or label text.")
            target: tab_bar.button_layout
            enterFunc: ()=>tab_bar.btn_without_bg_and_label.checked = true
            exitFunc: ()=>tab_bar.btn_without_bg_and_label.checked = false
        }
        RibbonTourItem{
            title: qsTr("Push Buttons")
            text: qsTr("Push buttons with/without sub menu.")
            target: tab_bar.pushbutton_layout
        }
        RibbonTourItem{
            title: qsTr("Line Edits")
            text: qsTr("Line edits with/without icon.")
            target: tab_bar.lineedit_layout
            enterFunc: ()=>{
                tab_bar.setPage(1)
                tab_bar.lineedit_with_icon.text = "Line Edit with icon."
                tour.refresh(300)
            }
            exitFunc: ()=>{
                tab_bar.setPage(0)
                tab_bar.lineedit_with_icon.clear()
                tour.refresh(400)
            }
        }
        RibbonTourItem{
            title: qsTr("Bottom Bar")
            text: qsTr("A bottom bar for window.")
            target: bottom_bar
        }
        target: windowItems
        blurEnabled: true
        targetRect: Qt.rect(windowItems.x + x, windowItems.y + y, width, height)
    }
    Component.onCompleted: tour.open()

    // RibbonToolBar{
    //
    // }not work :-(

    TabBar{
        id: tab_bar
        onSettingsBtnClicked:{
            backstagepopup.open()
        }
    }

    RibbonPaperView{
        id: view
        anchors.fill: parent
        pageWidth: (page_slider.value / 100.0) * width
        spacing: 0
        isMainView: true
        ColumnLayout{
            Layout.alignment: Qt.AlignCenter
            Layout.topMargin: 30
            spacing: 20
            RibbonText{
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 50
                text: "RibbonUI"
                font{
                    pixelSize: 50
                    bold: true
                    italic: true
                }
            }
            Image {
                source: "qrc:/qt/qml/RibbonUI/resources/imgs/icon.png"
                fillMode:Image.PreserveAspectFit
                mipmap: true
                autoTransform: true
                Layout.preferredHeight: 300
                Layout.preferredWidth: height
                Layout.alignment: Qt.AlignHCenter
                layer.enabled: true
                layer.effect: RibbonShadow{}
            }
            RibbonText{
                Layout.alignment: Qt.AlignHCenter
                text: "A Lightweight, minimalist and \nelegant Qt component library."
                font{
                    pixelSize: 30
                    bold: true
                    italic: true
                }
            }
            RibbonText{
                Layout.alignment: Qt.AlignHCenter
                text: "Author: mentalfl0w"
                font{
                    pixelSize: 25
                    bold: true
                    italic: true
                }
            }
            RibbonText{
                Layout.alignment: Qt.AlignHCenter
                text: "Email: mentalflow@ourdocs.cn"
                font{
                    pixelSize: 25
                    bold: true
                    italic: true
                }
            }
            RibbonText{
                Layout.alignment: Qt.AlignHCenter
                text: `Current Version: V${RibbonUI.version}`
                font{
                    pixelSize: 20
                    bold: true
                    italic: true
                }
            }
        }
    }

    RibbonBottomBar{
        id: bottom_bar
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        rightContent: RowLayout{
            clip: true
            spacing:1
            Layout.preferredHeight: parent.height
            layoutDirection: Qt.RightToLeft
            RibbonSlider{
                id: page_slider
                slideWidth: 80
                showFilledColor: false
                value: 70
            }
            RibbonButton{
                text:"Test Button 3"
                showBg:false
                adaptHeight:true
                iconSource: RibbonIcons.Airplane
            }
            RibbonButton{
                text:"Test Button 4"
                showBg:false
                adaptHeight:true
            }
        }
        RibbonButton{
            text:"Test Button 5"
            showBg:false
            adaptHeight:true
            iconSource: RibbonIcons.AccessTime
            checkable: true
        }
        RibbonButton{
            text:"Test Button 6"
            showBg:false
            adaptHeight:true
        }
        RibbonButton{
            showBg:false
            adaptHeight:true
            iconSource: RibbonIcons.StoreMicrosoft
            checkable: true
            tipText: "Test Button 7"
        }
    }

    titleBar.titleIconSource: "qrc:/qt/qml/RibbonUI/resources/imgs/icon.png"
    titleBar.rightContent:RowLayout{
        spacing: 1
        layoutDirection: Qt.RightToLeft
        RibbonButton{
            showBg:false
            iconSource: RibbonIcons.Info
            iconSourceFilled: RibbonIcons_Filled.Info
            tipText: qsTr("About")
            hoverColor: Qt.rgba(0,0,0, 0.3)
            pressedColor: Qt.rgba(0,0,0, 0.4)
            textColor: titleBar.titleTextColor
            textColorReverse: false
            onClicked: root.showWindow(Qt.resolvedUrl("about.qml"))
        }
        RibbonButton{
            showBg:false
            iconSource: RibbonIcons.Map
            iconSourceFilled: RibbonIcons_Filled.Map
            tipText: qsTr("Tour")
            hoverColor: Qt.rgba(0,0,0, 0.3)
            pressedColor: Qt.rgba(0,0,0, 0.4)
            textColor: titleBar.titleTextColor
            textColorReverse: false
            onClicked: tour.open()
        }

    }
    titleBar.leftContent:RowLayout{
        spacing: 1
        RibbonButton{
            showBg:false
            iconSource: RibbonIcons.ChevronDown
            tipText: "Test Button 8"
            hoverColor: Qt.rgba(0,0,0, 0.3)
            pressedColor: Qt.rgba(0,0,0, 0.4)
            textColor: titleBar.titleTextColor
            textColorReverse: false
            RibbonMenu{
                id:menu
                width: 200
                Action{
                    text: "Test Long Text Test Long Text Test Long Text"
                    checkable: true
                }
                RibbonMenuSeparator{}
                Action{
                    text: "Test Item 1"
                    enabled: false
                }
                RibbonMenu{
                    width: parent.width
                    title: "Sub Menu"
                    Action { text: qsTr("Test Item 2") }
                    Action { text: qsTr("Test Item 3") }
                }
            }
            onClicked:menu.popup()
        }
        RibbonButton{
            showBg:false
            iconSource: RibbonIcons.Apps
            iconSourceFilled: RibbonIcons_Filled.Apps
            checkable: true
            tipText: "Test Button 9"
            hoverColor: Qt.rgba(0,0,0, 0.3)
            pressedColor: Qt.rgba(0,0,0, 0.4)
            textColor: titleBar.titleTextColor
            textColorReverse: false
            enabled: false
        }
    }
    Component{
        id: t_content
        RibbonBackStagePage{
            onPageNameChanged: t_text.text = pageName
            Rectangle{
                anchors.fill: parent
                color: "transparent"
                RibbonText{
                    id: t_text
                    anchors.centerIn: parent
                    font.pixelSize: 20
                }
            }
        }
    }

    RibbonBackStageView{
        id: backstagepopup
        implicitHeight: root.height - root.borderWidth * 2
        implicitWidth: root.width - root.borderWidth * 2
        blurEnabled: true
        blurTarget: root.windowItems
        radius: borderRadius
        RibbonBackStageMenuItem{
            menuText: "Home"
            menuIcon: RibbonIcons.Home
            type: RibbonBackStageView.MenuItemLocation.Head
            sourceComponent: t_content
            sourceArgs:{'pageName':"Home"}
        }
        RibbonBackStageMenuItem{
            menuText: "File"
            menuIcon: RibbonIcons.Document
            type: RibbonBackStageView.MenuItemLocation.Head
            sourceComponent: t_content
            sourceArgs:{'pageName':"File"}
        }
        RibbonBackStageMenuItem{
            menuText: "Search"
            menuIcon: RibbonIcons.Search
            type: RibbonBackStageView.MenuItemLocation.Body
            sourceComponent: t_content
            sourceArgs:{'pageName':"Search"}
        }
        RibbonBackStageMenuItem{
            menuText: "Account"
            menuIcon: RibbonIcons.PersonAccounts
            type: RibbonBackStageView.MenuItemLocation.Tail
            clickOnly: true
            clickFunc: ()=>console.log("Menu Account clicked")
        }
        RibbonBackStageMenuItem{
            menuText: "About"
            menuIcon: RibbonIcons.Info
            type: RibbonBackStageView.MenuItemLocation.Tail
            clickOnly: true
            clickFunc: ()=>root.showWindow(Qt.resolvedUrl("about.qml"))
        }
        RibbonBackStageMenuItem{
            menuText: "Settings"
            menuIcon: RibbonIcons.Settings
            type: RibbonBackStageView.MenuItemLocation.Tail
            sourceUrl: Qt.resolvedUrl("pages/SettingsMenuPage.qml")
        }
    }
}
