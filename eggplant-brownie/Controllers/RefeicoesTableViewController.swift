//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Alura on 18/05/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 4),
                     Refeicao(nome: "Comida Japonesa", felicidade: 5)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let path = getDirectory() else { return }
        
        guard let data = try? Data(contentsOf: path) else { return }
        guard let savedMeals = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Refeicao> else { return }
        refeicoes = savedMeals ?? []
        
    }
    
    private func getDirectory() -> URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let path = directory.appendingPathComponent("meal")
        return path
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        guard let path = getDirectory() else { return }
        
        guard let data =
                try? NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false) else { return }
        try? data.write(to: path)
        
        
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            RemoveMealViewController(controller: self).show(refeicao) { action in
                
            }
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
}
