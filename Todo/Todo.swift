//
//  Todo.swift
//  Todo
//
//  Created by James Kuang on 25/6/22.
//

import Foundation


struct Todo: Identifiable {
    
    let id = UUID()
    
    var title: String
    var isCompleted = false
    var priority = false
    
    func complete() {
        
    }
}
