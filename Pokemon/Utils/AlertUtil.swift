//
//  AlertUtil.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit

class AlertUtil {
    public static func showStandardAlert(parentController: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            switch action.style {
                case .default:
                    alertController.dismiss(animated: true, completion: nil)
                case .cancel:
                    break
                case .destructive:
                    break
            @unknown default:
                break
            }
        }))
        parentController.present(alertController, animated: true, completion: nil)
    }
}
