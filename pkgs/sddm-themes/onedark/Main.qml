import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import SddmComponents 2.0

Rectangle {
    id: root
    color: "#121212"

    // --- Palette ---
    readonly property string bg:      "#121212"
    readonly property string bgAlt:   "#1a1a1a"
    readonly property string fg:      "#abb2bf"
    readonly property string accent:  "#61afef"
    readonly property string green:   "#98c379"
    readonly property string red:     "#e06c75"
    readonly property string border:  "#3e4451"
    readonly property string muted:   "#5c6370"

    // --- SDDM connections ---
    Connections {
        target: sddm
        function onLoginFailed() {
            passwordField.text = ""
            passwordField.focus = true
            errorMsg.visible = true
        }
        function onLoginSucceeded() {
            errorMsg.visible = false
        }
    }

    // --- Background subtle gradient ---
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: "#141414" }
            GradientStop { position: 1.0; color: "#0e0e0e" }
        }
    }

    // --- Center card ---
    Rectangle {
        id: card
        anchors.centerIn: parent
        width: 340
        height: col.implicitHeight + 56
        radius: 12
        color: root.bgAlt
        border.color: root.border
        border.width: 1

        layer.enabled: true
        layer.effect: null

        ColumnLayout {
            id: col
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                topMargin: 32
                leftMargin: 28
                rightMargin: 28
            }
            spacing: 0

            // Clock
            Text {
                id: clockLabel
                Layout.alignment: Qt.AlignHCenter
                color: root.accent
                font.pixelSize: 52
                font.family: "monospace"
                font.weight: Font.Light
                text: Qt.formatTime(new Date(), "HH:mm")

                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: clockLabel.text = Qt.formatTime(new Date(), "HH:mm")
                }
            }

            // Date
            Text {
                id: dateLabel
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 4
                color: root.muted
                font.pixelSize: 13
                text: Qt.formatDate(new Date(), "dddd, MMMM d")

                Timer {
                    interval: 60000
                    running: true
                    repeat: true
                    onTriggered: dateLabel.text = Qt.formatDate(new Date(), "dddd, MMMM d")
                }
            }

            // Divider
            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 24
                Layout.bottomMargin: 20
                height: 1
                color: root.border
            }

            // Username field
            Rectangle {
                Layout.fillWidth: true
                height: 40
                radius: 6
                color: root.bg
                border.color: userField.activeFocus ? root.accent : root.border
                border.width: userField.activeFocus ? 2 : 1

                TextInput {
                    id: userField
                    anchors {
                        fill: parent
                        leftMargin: 12
                        rightMargin: 12
                    }
                    verticalAlignment: TextInput.AlignVCenter
                    text: userModel.lastUser
                    color: root.fg
                    font.pixelSize: 14
                    font.family: "monospace"
                    selectionColor: root.accent
                    selectedTextColor: root.bg
                    KeyNavigation.tab: passwordField
                    Keys.onReturnPressed: passwordField.focus = true
                }

                Text {
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: 12
                    }
                    text: "Username"
                    color: root.muted
                    font.pixelSize: 14
                    font.family: "monospace"
                    visible: userField.text === ""
                }
            }

            // Password field
            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 10
                height: 40
                radius: 6
                color: root.bg
                border.color: passwordField.activeFocus ? root.accent : root.border
                border.width: passwordField.activeFocus ? 2 : 1

                TextInput {
                    id: passwordField
                    anchors {
                        fill: parent
                        leftMargin: 12
                        rightMargin: 12
                    }
                    verticalAlignment: TextInput.AlignVCenter
                    echoMode: TextInput.Password
                    passwordCharacter: "•"
                    color: root.fg
                    font.pixelSize: 14
                    font.family: "monospace"
                    selectionColor: root.accent
                    selectedTextColor: root.bg
                    KeyNavigation.tab: loginBtn
                    Keys.onReturnPressed: sddm.login(userField.text, passwordField.text, sessionModel.lastIndex)
                    Component.onCompleted: focus = true
                }

                Text {
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: 12
                    }
                    text: "Password"
                    color: root.muted
                    font.pixelSize: 14
                    font.family: "monospace"
                    visible: passwordField.text === ""
                }
            }

            // Error message
            Text {
                id: errorMsg
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 8
                color: root.red
                font.pixelSize: 12
                font.family: "monospace"
                text: "Incorrect password"
                visible: false
            }

            // Login button
            Rectangle {
                id: loginBtn
                Layout.fillWidth: true
                Layout.topMargin: errorMsg.visible ? 4 : 12
                height: 40
                radius: 6
                color: loginBtnMouse.containsMouse ? Qt.lighter(root.accent, 1.1) : root.accent

                Behavior on color { ColorAnimation { duration: 120 } }

                Text {
                    anchors.centerIn: parent
                    text: "Login"
                    color: root.bg
                    font.pixelSize: 14
                    font.weight: Font.Medium
                    font.family: "monospace"
                }

                MouseArea {
                    id: loginBtnMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: sddm.login(userField.text, passwordField.text, sessionModel.lastIndex)
                }

                Keys.onReturnPressed: sddm.login(userField.text, passwordField.text, sessionModel.lastIndex)
                activeFocusOnTab: true
            }

            // Bottom spacing
            Item { Layout.preferredHeight: 28 }
        }
    }

    // --- Power row (bottom center) ---
    Row {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 24
        }
        spacing: 12

        Repeater {
            model: [
                { label: "Reboot",   fn: function() { sddm.reboot() } },
                { label: "Shutdown", fn: function() { sddm.powerOff() } },
            ]

            delegate: Rectangle {
                width: 90
                height: 30
                radius: 6
                color: powerMouse.containsMouse ? root.bgAlt : "transparent"
                border.color: powerMouse.containsMouse ? root.border : "transparent"
                border.width: 1

                Behavior on color { ColorAnimation { duration: 120 } }

                Text {
                    anchors.centerIn: parent
                    text: modelData.label
                    color: root.muted
                    font.pixelSize: 12
                    font.family: "monospace"
                }

                MouseArea {
                    id: powerMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: modelData.fn()
                }
            }
        }
    }

    // --- Session indicator (top right) ---
    Text {
        anchors {
            top: parent.top
            right: parent.right
            topMargin: 16
            rightMargin: 20
        }
        text: sessionModel.data(sessionModel.index(sessionModel.lastIndex, 0), Qt.DisplayRole) || ""
        color: root.muted
        font.pixelSize: 12
        font.family: "monospace"
    }
}
