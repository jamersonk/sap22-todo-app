//
//  ContentView.swift
//  Todo
//
//  Created by James Kuang on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isSheetGiven = false
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        NavigationView {
            List {
                ForEach($todoManager.todos) { $todo in
                    NavigationLink {
                        DetailedView(todo: $todo)
                    } label: {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
                                .foregroundColor(todo.isPriority ? .red : todo.isCompleted ? .gray : .black)
                                .onTapGesture {
                                    if todo.isCompleted {
                                        todo.isCompleted = false
                                    } else {
                                        todo.isCompleted = true
                                        todo.isPriority = false
                                    }
                                }
                            VStack(alignment: .leading) {
                                Text(todo.title)
                                    .foregroundColor(todo.isPriority ? .red : todo.isCompleted ? .gray : .black)
                                    .strikethrough(todo.isCompleted)
                                if todo.isPriority {
                                    Text("This is urgent! Get on with it!")
                                        .font(.caption)
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    todoManager.todos.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    todoManager.todos.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
            .navigationTitle( "Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetGiven = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isSheetGiven) {
            CreateView(todos: $todoManager.todos)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
