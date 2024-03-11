//
//  DataManager.swift
//  Fetch-exercise
//
//  Created by Yunhao Hu on 2024/3/11.
//

import Foundation

@Observable 
class DataManager {
        
    private let url = "https://fetch-hiring.s3.amazonaws.com/hiring.json"

    // Singleton instance
    static let shared = DataManager()
    
    fileprivate init() {}
    
    // Fetch items from the URL
    func fetchItems() async throws -> [Int:[Item]] {
        guard let url = URL(string: url) else {
            fatalError("Invalid URL")
        }
        /// Fetch JSON data from URL
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        /// Parse the JSON into an array of Item objects
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedItems = try decoder.decode([Item].self, from: data)
        
        /// Filter out the items whose name is blank or null
        let filteredItems = decodedItems.filter {
            $0.name != nil && $0.name != ""
        }
        
        /// Sort the items based on the < operator defined in the Item model
        let sortedItems = filteredItems.sorted(by: <)
                
        /// Group the items by "listId"
        let categorizedItems = Dictionary(grouping: sortedItems) {$0.listId}
        
        return categorizedItems
    }
}
