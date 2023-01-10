//
//  TestsTests.swift
//  TestsTests
//
//  Created by Tyler Radke on 1/3/23.
//

import XCTest
@testable import Tests

final class TestsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Person_Init() {
        let person = Person(name: "Dave", age: 42)
        
        XCTAssert(person.name == "Dave")
        
        
        
    }
    func test_EvenNumbers_FirstFiveNumbers_EvensReturned() throws {
        let array: [Int] = EvenNumbers.evenNums(arr: [1,2,3,4,5])
        XCTAssert(array.contains([2,4]))
     
    }
    
    func test_EvenNumbers_Negative_NegativeEvensReturned() {
        let array: [Int] = EvenNumbers.evenNums(arr: [-5,-6,-7,-8])
        XCTAssert(array.contains([-6,-8]))
    }
    
    func test_HigherNumbers_HighEvens() {
        let array: [Int] = EvenNumbers.evenNums(arr: [900,901,902,903,904,905,906,907])
        XCTAssert(array.contains([900,902,904]))
    }
    
    func test_RandomNumbers_StillEvens() {
        let array: [Int] = EvenNumbers.evenNums(arr: [1,24,46,659,547])
        XCTAssert(array.contains([24,46]))
        
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
