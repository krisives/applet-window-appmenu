/*
 * Copyright 2018 Michail Vourlakos <mvourlakos@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: layout
     clip: true

    property real leftIndicatorOpacity: 0
    property real rightIndicatorOpacity: 0

    readonly property int shadow: 24

    Rectangle {
        width: 2 * layout.shadow
        height: parent.height
        anchors.right: parent.left
        anchors.verticalCenter: parent.verticalCenter
        color: enforceLattePalette ? root.latteBridge.palette.backgroundColor : theme.backgroundColor
        opacity: leftIndicatorOpacity

        layer.enabled: opacity > 0
        layer.effect: DropShadow{
            radius: layout.shadow
            samples: 2 * radius
            color: enforceLattePalette ? root.latteBridge.palette.textColor : theme.textColor
        }
    }

    Rectangle {
        width: 2 * layout.shadow
        height: parent.height
        anchors.left: parent.right
        anchors.verticalCenter: parent.verticalCenter
        color: enforceLattePalette ? root.latteBridge.palette.backgroundColor : theme.backgroundColor
        opacity: rightIndicatorOpacity

        layer.enabled: opacity > 0
        layer.effect: DropShadow{
            radius: layout.shadow
            samples: 2 * radius
            color: enforceLattePalette ? root.latteBridge.palette.textColor : theme.textColor
        }
    }
}
