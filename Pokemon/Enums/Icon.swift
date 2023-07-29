//
//  Icon.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit

enum Icon: String {
    case ic_titleview_logo
    case ic_invoice
    case ic_notification
    case ic_home_tab
    case ic_profile_tab
    case ic_settings_tab
    case ic_operations_tab
    case ic_right_arrow
    case ic_edit
    case ic_textfield_arrow
    case ic_change
    case ic_eye
    case ic_eye_closed
    case ic_locked
    case ic_lock_open
    case ic_placeholder
    case ic_call
    case ic_emergency
    case ic_bill
    case ic_location
    case ic_tutorial_signals

    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
