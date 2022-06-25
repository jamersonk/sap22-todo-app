//
//  ContentView.swift
//  Todo
//
//  Created by James Kuang on 25/6/22.
//
import SwiftUI

struct ContentView: View {
    
    @State var todos = [
        Todo(title: "Watch some Paw Patrol", isCompleted: true),
        Todo(title: "Conduct a giveaway", priority:  true),
        Todo(title: "Randomly deduct some points")
    ]
    
    var body: some View {
        NavigationView {
            List($todos) { $todo in
                NavigationLink {
                    DetailedView(todo: $todo)
                } label: {
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
                            .foregroundColor(todo.priority ? .red : todo.isCompleted ? .gray : .black)
                            .onTapGesture {
                                if todo.isCompleted {
                                    todo.isCompleted = false
                                } else {
                                    todo.isCompleted = true
                                }
                            }
                        VStack(alignment: .leading) {
                            Text(todo.title)
                                .foregroundColor(todo.priority ? .red : todo.isCompleted ? .gray : .black)
                                .strikethrough(todo.isCompleted)
                            if todo.priority {
                                Text("Overdue.")
                                    .font(.caption)
                                    .foregroundColor(.red)
                            }
                        }
                    }
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
