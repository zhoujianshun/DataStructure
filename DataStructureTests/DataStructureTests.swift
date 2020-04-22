//
//  DataStructureTests.swift
//  DataStructureTests
//
//  Created by 周建顺 on 2020/4/18.
//  Copyright © 2020 rippleinfo. All rights reserved.
//

import XCTest
@testable import DataStructure

class DataStructureTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLinkedList() {
        let linkedList = LinkedList<Int>()
        linkedList.add(0)
        linkedList.add(1)
        linkedList.add(2)
        linkedList.add(3)
        linkedList.add(4)
        linkedList.add(5)
        linkedList.add(6)

        print(linkedList)
        
        XCTAssertTrue(linkedList.get(at: 2) == 2)
        XCTAssertTrue(linkedList.get(at: 5) == 5)
        XCTAssertTrue(linkedList.get(at: 5) != 4)
        XCTAssertTrue(linkedList.remove(at: 4) == 4)
        XCTAssertTrue(linkedList.get(at: 5) == 6)
        
        XCTAssertTrue(linkedList.set(10, at: 2) == 2)
        XCTAssertTrue(linkedList.get(at: 2) == 10)
        
        linkedList.add(30, at: 0)
        XCTAssertTrue(linkedList.get(at: 0) == 30)
        
        print("----------")
        print(linkedList)
    }
    
    func testQueue() {
        let queue = Queue<Int>()
        XCTAssertTrue(queue.deQueue() == nil)
        queue.enQueue(0)
        queue.enQueue(1)
        queue.enQueue(2)
        queue.enQueue(3)
        queue.enQueue(4)
        
        XCTAssertTrue(queue.front() == 0)
        XCTAssertTrue(queue.deQueue() == 0)
        XCTAssertTrue(queue.front() == 1)
        XCTAssertTrue(queue.deQueue() == 1)
        XCTAssertTrue(queue.front() == 2)
        XCTAssertTrue(queue.deQueue() == 2)
        queue.enQueue(50)
        XCTAssertTrue(queue.front() == 3)
        XCTAssertTrue(queue.deQueue() == 3)
    }
    
    func testStack() {
        let stack = Stack<String>()
        print("\(stack.pop() as Any)")
        stack.push("a")
        stack.push("b")
        stack.push("c")
        stack.push("d")
        stack.push("e")
        XCTAssert(stack.top() == "e")
        XCTAssert(stack.pop() == "e")
 
        XCTAssert(stack.pop() == "d")
        XCTAssert(stack.top() == "c")
        
        stack.push("f")
        XCTAssert(stack.top() == "f")
        XCTAssert(stack.pop() == "f")
    }
    
    func testBinaryHeap() {
        let heap = BinaryHeap([2,3,4,10,20,1,0]) { (e1, e2) -> ComparisonResult in
            return e1 < e2 ? .orderedDescending : .orderedAscending
        }
        
        heap.add(30)
        heap.add(40)
        while !heap.isEmpty() {
            print(heap.remove())
        }
    }

}
