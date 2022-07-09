//
//  CreateView.swift
//  Todo
//
//  Created by James Kuang on 2/7/22.
//

import SwiftUI

struct CreateView: View {
    
    @State var todoTitle = ""
    @Binding var todos: [Todo]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Title", text: $todoTitle)
            Button("Save Todo") {
                let todo = Todo(title: todoTitle)
                todos.append(todo)
                dismiss()
            }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView(todos: .constant([]))
    }
}
