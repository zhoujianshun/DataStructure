//
//  File.swift
//  DataStructure
//
//  Created by 周建顺 on 2020/4/18.
//  Copyright © 2020 rippleinfo. All rights reserved.
//

import Foundation


public class Queue<E: Equatable> {
    let list = LinkedList<E>()
    
    public init() {
        
    }
    
    public func size() -> Int {
        list.size()
    }
    
    public func isEmpty() -> Bool {
        list.isEmpty()
    }
    
    public func enQueue(_ element: E) {
        list.add(element)
    }
    
    public func deQueue() -> E? {
        list.remove(at: 0)
    }
    
    public func front() -> E? {
        list.get(at: 0)
    }
    
    public func clear() {
        list.clear()
    }
}


