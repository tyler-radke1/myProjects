//
//  List.swift
//  toDoList
//
//  Created by Tyler Radke on 11/3/22.
//

import Foundation

struct Task: Equatable, Codable {
  
    
    let id: UUID
    var title: String
    var isCompleted: Bool
    var dueDate: Date
    var notes: String?
    
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
  
    static func loadSampleTasks() -> [Task] {
        let taskOne = Task(id: UUID(), title: "Task 1", isCompleted: false, dueDate: Date())
        let taskTwo = Task(id: UUID(), title: "Task 2", isCompleted: false, dueDate: Date())
        let taskThree = Task(id: UUID(), title: "Task 3", isCompleted: false, dueDate: Date())
       return [taskOne,taskTwo,taskThree]
    }
    
    static var saveLocation: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
         return documentsDirectory.appendingPathComponent("tasks").appendingPathExtension("json")
    }
    
    static func saveToFile(tasks: [Task]) {
        
        do {
            let dataToEncode = try? JSONEncoder().encode(tasks)
            try dataToEncode?.write(to: saveLocation)
        } catch {
            print(error)
        }
        

        
    }
    
    
    static func loadFromFile() -> [Task] {
         
         var newTasks: [Task] = []
        
     
        //Using a guard here makes it so it checks for emojis.JSON, and if it doesn't exist uses defaultEmojis
        guard let data: Data = try? Data(contentsOf: saveLocation) else { return loadSampleTasks() }
        
         do {
             let tasksArray: [Task] = try JSONDecoder().decode([Task].self, from: data)
             newTasks = tasksArray
         } catch {
             print(error)
         }
        
         
        return newTasks
         
         
     }
    
}
