//
//  Item.swift
//  eggplant-brownie
//
//  Created by Alura on 16/03/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class Item: NSObject,NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "calorias") as! String
        calorias = coder.decodeDouble(forKey: "nome")
    }
    
    
    // MARK: - Atributos
    
    let nome: String
    let calorias: Double
    
    // MARK: - Init
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
