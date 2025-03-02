// Version 3

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
	id: configSpinBox

	property string configKey: ''
	readonly property var configValue: configKey ? plasmoid.configuration[configKey] : 0
	// property alias decimals: spinBox.decimals
	// property alias horizontalAlignment: spinBox.horizontalAlignment
	property alias maximumValue: spinBox.to
	property alias minimumValue: spinBox.from
	property alias prefix: spinBox.prefix
	property alias stepSize: spinBox.stepSize
	property alias suffix: spinBox.suffix
	property alias value: spinBox.value

	property alias before: labelBefore.text
	property alias after: labelAfter.text

	Label {
		id: labelBefore
		text: ""
		visible: text
	}
	
	SpinBox {
		id: spinBox

    	property string prefix: ""
    	property string suffix: ""
		textFromValue: function(value, locale) {
			return prefix + Number(value).toLocaleString(locale, 'f', 0) + suffix
		}
		value: configValue
		onValueChanged: serializeTimer.start()
		to: 2147483647
	}

	Label {
		id: labelAfter
		text: ""
		visible: text
	}

	Timer { // throttle
		id: serializeTimer
		interval: 300
		onTriggered: {
			if (configKey) {
				plasmoid.configuration[configKey] = value
			}
		}
	}
}
