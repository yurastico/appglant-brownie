//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Yuri Cunha on 09/01/24.
//  Copyright © 2024 Alura. All rights reserved.
//

import Foundation

final class ItemDao {
    func save(_ items: [Item]) {
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false) else { return }
        guard let path = getDirectory() else { return }
        try? data.write(to: path)
    }
    
    func getItems() -> [Item] {
        guard let path = getDirectory() else { return [] }
        guard let data = try? Data(contentsOf: path) else { return [] }
        guard let savedItems = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Item] else { return [] }
        
        return savedItems ?? []
    }
    
    private func getDirectory() -> URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let path = directory.appendingPathComponent("itens")
        return path
    }
    
}
