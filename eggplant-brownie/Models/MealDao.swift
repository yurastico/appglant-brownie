//
//  MealDao.swift
//  eggplant-brownie
//
//  Created by Yuri Cunha on 09/01/24.
//  Copyright © 2024 Alura. All rights reserved.
//

import Foundation

final class MealDao {
    
    private func getDirectory() -> URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let path = directory.appendingPathComponent("meal")
        return path
    }
    
    func getMeals() -> [Refeicao] {
        
        guard let path = getDirectory() else { return [] }
        
        guard let data = try? Data(contentsOf: path) else { return [] }
        guard let savedMeals = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Refeicao> else { return [] }
        return savedMeals ?? []
    }
    
    func save(_ meals: [Refeicao]) {
        guard let path = getDirectory() else { return }
        
        do {
            let data =
                   try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
           try data.write(to: path)
        } catch {
            print(error)
        }

    }
}

