//
//  Helper.swift
//  cocktailApp
//
//  Created by Anne-Marie Champoux on 2022-03-20.
//

import Foundation

class Helper {
    
    static let share = Helper()
    let ud = UserDefaults.standard
    let key = "KEY"
    
    func arrayFromUD() -> [[String: String]] {
        return ud.array(forKey: key) as? [[String: String]] ?? []
    }
    
    func getString() -> [Item] {
        var resultArray: [Item] = []
        let array = arrayFromUD()
            array.forEach { dict in
                resultArray.append(Item(dict: dict))
            }
        return resultArray
    }
    
    func add(_ item: Item) {
        var array = arrayFromUD()
        array.append(item.toDict())
        ud.set(array, forKey: key)
    }
    
    func remove(_ item: Item) {
        var array = arrayFromUD()
        if let index = array.firstIndex(where: {$0 == item.toDict()}) {
            array.remove(at: index)
        }
        ud.set(array, forKey: key)
    }

}
