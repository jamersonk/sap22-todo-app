//
//  ContentView.swift
//  Todo
//
//  Created by James Kuang on 25/6/22.
//
import SwiftUI

struct ContentView: View {
    
    var todos = [
        Todo(title: "Watch some Paw Patrol", isCompleted: true),
        Todo(title: "Conduct a giveaway"),
        Todo(title: "Randomly deduct some points")
    ]
    
    var body: some View {
        NavigationView {
            List(todos) { todo in
                HStack {
                    Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
                    Text(todo.title)
                }
            }
            .navigationTitle( "Todo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
