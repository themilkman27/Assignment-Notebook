//
//  WhatToDo.swift
//  Assignment Notebook
//
//  Created by Owen Johnson on 2/7/23.
//

import Foundation
class ToDoList: ObservableObject {
    @Published var items : [Plans] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode( [Plans].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}
