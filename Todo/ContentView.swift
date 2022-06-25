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
        Todo(title: "Conduct a giveaway", priority:  true),
        Todo(title: "Randomly deduct some points")
    ]
    
    var body: some View {
        NavigationView {
            List(todos) { todo in
                HStack {
                    Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
                        .foregroundColor(todo.priority ? .red : todo.isCompleted ? .gray : .black)
                    Text(todo.title)
                        .foregroundColor(todo.priority ? .red : todo.isCompleted ? .gray : .black)
                        .strikethrough(todo.isCompleted)
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
