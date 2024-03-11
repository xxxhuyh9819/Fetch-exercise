//
//  ContentView.swift
//  Fetch-exercise
//
//  Created by Yunhao Hu on 2024/3/11.
//

import SwiftUI


struct ContentView: View {
    
    // The viewModel introduced to ContentView
    private var viewModel = IssueViewModel()
    
    // A set used to record DisclosureGroups that are expanded
    @State private var expandedGroups = Set<Int>()
    
    var body: some View {
        NavigationStack {
            List {
                /// need to sort the keys (listId) here, because the dictionary created by grouping has no order
                ForEach(Array(viewModel.items.keys).sorted(), id: \.self) { key in
                    Section {
                        /// A custom binding is used to handle whether each DisclosureGroup expands or not
                        DisclosureGroup(isExpanded: Binding<Bool> (
                            get: {expandedGroups.contains(key)},
                            set: { isExpanding in
                                if (isExpanding) {
                                    expandedGroups.insert(key)
                                } else {
                                    expandedGroups.remove(key)
                                }
                            }
                        )) {
                            if let items = viewModel.items[key] {
                                ForEach(items) { item in
                                    HStack {
                                        Text(item.name!)
                                    }
                                }
                            }
                        } label: {
                            Text(expandedGroups.contains(key) ?  "Hide items" : "Show items")
                        }
                    } header: {
                        Text("listId: \(key)")
                    }
                    
                }
                .navigationTitle("Items")
                .navigationBarTitleDisplayMode(.inline)
            }
            .listStyle(.sidebar)
        }
    }
    
}

#Preview {
    ContentView()
}
