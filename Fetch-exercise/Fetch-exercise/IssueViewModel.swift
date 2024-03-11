//
//  viewModel.swift
//  Fetch-exercise
//
//  Created by Yunhao Hu on 2024/3/11.
//

import Foundation

@Observable
class IssueViewModel {
    
    var items = [Int:[Item]]()
    
    init() {
        Task {
            await getItems()
        }
    }
    
    @MainActor
    func getItems() async {
        Task {
            items = try await DataManager.shared.fetchItems()
        }
    }
}
