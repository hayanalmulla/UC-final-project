//
//  AddTaskView.swift
//  Task Leader
//
//  Created by macbook on 30/09/2022.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title:String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create a new task")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter the task here", text:$title)
                .textFieldStyle(.roundedBorder)
            
            Button{
                print("task added!")
                dismiss()
            } label: {
             Text("add task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
                    .cornerRadius(30)
            }
            Spacer()
        }
        .padding(.top,40)
        .padding(.horizontal)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
