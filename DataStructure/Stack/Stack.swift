//
//  Stack.swift
//  DataStructure
//
//  Created by 周建顺 on 2020/4/19.
//  Copyright © 2020 rippleinfo. All rights reserved.
//

import Foundation
/// Stack使用可变数组实现
public class Stack<E> {
    private var array: [E] = []
    
    public init() {
//        Array([])
    }
    
    public func size() -> Int {
        array.count
    }
    
    public func isEmpty() -> Bool {
        array.count == 0
    }
    
    public func push(_ element:E) {
        array.append(element)
    }
    
    @discardableResult
    public func pop() -> E? {
//        array.remove(at: array.count - 1)
        isEmpty() ? nil: array.remove(at: array.count - 1)
    }
    
    public func top() -> E? {
        isEmpty() ? nil: array[array.count - 1]
    }
}
