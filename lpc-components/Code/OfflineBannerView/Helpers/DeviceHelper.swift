//
//  DeviceHelper.swift
//  lpc-components
//
//  Created by Alaeddine Ouertani on 15/02/2018.
//  Copyright © 2018 Lakooz. All rights reserved.
//

import UIKit

enum DeviceHelper {
    
    static var isWithNotch: Bool {
        if UIDevice.current.userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136, 1334, 1920, 2208:
                return false
            case 2436, 2688, 1792:
                return true
            default:
                return false
            }
        }
        // iPad
        return false
    }
}
