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
            } label: {
                Text("\(todo.isCompleted ? "Mark as incomplete." : "I did it!")")
            }
            .padding()
            Button{
                todo.isPriority.toggle()
            } label: {
                Text("\(todo.isPriority ? "Mark as not urgent." : "Mark as Urgent")")
            }
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(todo: .constant(Todo(title: "Feed the cat.")))
    }
}
