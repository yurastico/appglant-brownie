//
//  RemoveMealViewController.swift
//  eggplant-brownie
//
//  Created by Yuri Cunha on 07/01/24.
//  Copyright © 2024 Alura. All rights reserved.
//

import UIKit

final class RemoveMealViewController {
    
    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
 
    
    func show(_ meal: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title:meal.nome, message: meal.details, preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel)
        alert.addAction(cancelButton)
        let removeButton = UIAlertAction(title: "Remover", style: .destructive,handler: handler)
        alert.addAction(removeButton)
        
        controller.present(alert,animated: true)
    }
}
