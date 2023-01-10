//
//  DirectoryAppTests.swift
//  DirectoryAppTests
//
//  Created by Tyler Radke on 1/6/23.
//

import XCTest
@testable import DirectoryApp

final class DirectoryAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let employee = Person(name: "Dave", phoneNumber: "801-456-0091")
        
        XCTAssertNotNil(employee)
        XCTAssertNotEqual(employee.name, "Dpencer")
        XCTAssertEqual(employee.phoneNumber, "801-456-0091")
       
    
    }
    
    func test_PersonStruct_AddFunction() {
        
        
        let newPerson = Person(name: "Dpencer", phoneNumber: "801-934-0912")
        
        Person.addPerson(person: newPerson)
        
        XCTAssert(Person.people.contains(newPerson))
        
    }
    
    func test_DetailTableViewController_ViewFunctionality() {
        let detailViewController = DetailTableViewController()
        XCTAssertNotNil(detailViewController)
        
        XCTAssertNotEqual(detailViewController.tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(detailViewController.tableView.numberOfRows(inSection: 0), 0)
        
}

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
