//
//  Todo.swift
//  Todo
//
//  Created by James Kuang on 25/6/22.
//

import Foundation


struct Todo: Identifiable, Codable {
    
    var id = UUID()
    
    var title: String
    var isCompleted = false
    var isPriority = false
    
    func complete() {
        
    }
}
