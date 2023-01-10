//
//  Person.swift
//  DirectoryAppTests
//
//  Created by Tyler Radke on 1/6/23.
//
import UIKit
import Foundation
struct Person: Equatable {
    let name: String
    var phoneNumber: String
    
    static var people: [Person] = []
    
    
    
    static func addPerson(person: Person) {
        people.append(person)
    }
    
}
