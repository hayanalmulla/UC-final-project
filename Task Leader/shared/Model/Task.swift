//
//  Task.swift
//  Task Leader
//
//  Created by macbook on 29/09/2022.
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

func getSampleDate(offset:Int)->Date{
    let calender = Calendar.current
    let date = calender.date(byAdding:.day, value: offset,to: Date())
    return date ?? Date()
}
var tasks: [TaskMetaData] = [
    TaskMetaData(task: [
        Task(title: "Meeting with tom cook")
], taskDate: getSampleDate(offset: -8)),
    
    TaskMetaData(task: [
        Task(title: "Next Version of SwiftUi")
], taskDate: getSampleDate(offset: 10)),
    
    TaskMetaData(task: [
        Task(title: "Nothing much workout!!")
], taskDate: getSampleDate(offset: -22)),
    
    TaskMetaData(task: [
        Task(title: "Iphone 13 great Design change")
], taskDate: getSampleDate(offset: 15)),
    
    TaskMetaData(task: [
        Task(title: "Kavsoft App Updates...")
], taskDate: getSampleDate(offset: -20)),
    ]
    
  


struct Task_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

