//
//  DetailedView.swift
//  Todo
//
//  Created by James Kuang on 25/6/22.
//

import SwiftUI

struct DetailedView: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        VStack {
            TextField("Todo title", text: $todo.title)
                .multilineTextAlignment(.center)
                .padding()
            Button {
                todo.isCompleted.toggle()
                if todo.isCompleted {
                    todo.isPriority = false
                }
            } label: {
                Text("\(todo.isCompleted ? "Mark as incomplete." : "I did it!")")
                    .padding(5)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.trailing)
            .padding(.leading)
            Button{
                todo.isPriority.toggle()
            } label: {
                Text("Mark as \(todo.isPriority ? "not urgent." : "urgent").")
            }
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(todo: .constant(Todo(title: "Feed the cat.")))
    }
}
