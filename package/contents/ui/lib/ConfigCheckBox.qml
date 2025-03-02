// Version 2

import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts

import ".."

CheckBox {
	id: configCheckBox

	property string configKey: ''
	checked: plasmoid.configuration[configKey]
	onClicked: plasmoid.configuration[configKey] = !plasmoid.configuration[configKey]
}
