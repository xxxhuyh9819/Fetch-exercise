//
//  Item.swift
//  Fetch-exercise
//
//  Created by Yunhao Hu on 2024/3/11.
//

import Foundation

// the model for objects to be fetched
struct Item: Codable, Identifiable, Comparable {
    
    /// operator that compares by item name
    static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.name!.localizedStandardCompare(rhs.name!) == .orderedAscending
    }
    
    let id: Int
    let listId: Int
    let name: String?
}


