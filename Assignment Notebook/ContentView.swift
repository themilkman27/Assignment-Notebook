//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Owen Johnson on 2/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        
        
    }
}
        
        
        struct Plans: Identifiable, Codable {
            var id = UUID()
            var priority = String()
            var description = String()
            var dueDate = Date()
        }
