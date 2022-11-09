//
//  List.swift
//  toDoList
//
//  Created by Tyler Radke on 11/3/22.
//

import Foundation

struct Task: Equatable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var dueDate: Date
    var notes: String?
    
    static func ==(lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func loadSampleTasks() -> [Task] {
        let taskOne = Task(id: UUID(), title: "Task 1", isCompleted: false, dueDate: Date())
        let taskTwo = Task(id: UUID(), title: "Task 2", isCompleted: false, dueDate: Date())
        let taskThree = Task(id: UUID(), title: "Task 3", isCompleted: false, dueDate: Date())
       return [taskOne,taskTwo,taskThree]
    }
    
}
