//
//  DetailedView.swift
//  Todo
//
//  Created by James Kuang on 25/6/22.
//

import SwiftUI

struct DetailedView: View {
    
    @State var todo = Todo(title: "Water the cat")
    
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
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView()
    }
}
