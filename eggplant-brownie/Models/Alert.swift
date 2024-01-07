//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Yuri Cunha on 07/01/24.
//  Copyright © 2024 Alura. All rights reserved.
//

import UIKit

final class Alert {
    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(title: String = "Atenção!",message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(ok)
        controller.present(alert,animated: true)
    }
}
