/********************************************************************
 * Copyright 2016 Chinmoy Ranjan Pradhan <chinmoyrp65@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License or (at your option) version 3 or any later version
 * accepted by the membership of KDE e.V. (or its successor approved
 * by the membership of KDE e.V.), which shall act as a proxy
 * defined in Section 14 of version 3 of the license.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 **********************************************************************/

import QtQuick 2.0
import QtQuick.Controls 1.0 as Controls
import QtQuick.Layouts 1.1

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: configGeneral

    property alias cfg_compactView: compactViewRadioButton.checked
    property alias cfg_filterByActive: activeChk.checked
    property alias cfg_filterChildrenWindows: childrenChk.checked
    property alias cfg_filterByScreen: screenAwareChk.checked

    property bool disableSetting: plasmoid.formFactor === PlasmaCore.Types.Vertical

    // used from the ui
    readonly property real centerFactor: 0.3
    readonly property int minimumWidth: 220

    ColumnLayout {
        id:mainColumn
        spacing: units.largeSpacing
        Layout.fillWidth: true

        GridLayout{
            columns: 2

            Controls.ExclusiveGroup {
                id: viewOptionGroup
            }

            Controls.Label{
                Layout.minimumWidth: Math.max(centerFactor * root.width, minimumWidth)
                text: i18n("Buttons:")
                horizontalAlignment: Text.AlignRight
            }

            Controls.RadioButton {
                id: fullViewRadioButton
                //this checked binding is just for the initial load in case
                //compactViewCheckBox is not checked. Then exclusive group manages it
                enabled: !disableSetting
                checked: !compactViewRadioButton.checked
                text: i18n("Show full application menu")
                exclusiveGroup: viewOptionGroup
            }

            Controls.Label{
            }

            Controls.RadioButton {
                id: compactViewRadioButton
                enabled: !disableSetting
                text: i18n("Use single button for application menu")
                exclusiveGroup: viewOptionGroup
            }
        }

        GridLayout{
            columns: 2

            Controls.Label{
                Layout.minimumWidth: Math.max(centerFactor * root.width, minimumWidth)
                text: i18n("Filters:")
                horizontalAlignment: Text.AlignRight
            }

            Controls.CheckBox {
                id: screenAwareChk
                text: i18n("Show only menus from current screen")
            }

            Controls.Label{}

            Controls.CheckBox {
                id: activeChk
                text: i18n("Show only menus from active applications")
            }

            Controls.Label{}

            Controls.CheckBox {
                id: childrenChk
                text: i18n("Show only menus from main window")
            }
        }

        Item {
            Layout.fillHeight: true
        }

    }
}
