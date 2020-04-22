//
//  Heap.swift
//  DataStructure
//
//  Created by 周建顺 on 2020/4/21.
//  Copyright © 2020 rippleinfo. All rights reserved.
//

import Foundation

protocol Heap {
    associatedtype E
    
    init(comparator: @escaping ((E, E) -> ComparisonResult));
    
    func size() -> Int
    func isEmpty() -> Bool
    func clear()
    func add(_ element:E)
    func get() -> E?
    func remove() -> E?
    func replace(_ element:E) -> E?
}


//init()
//
//init<S>(_ s: S) where E == S.Element, S : Sequence
//
//init<S>(_ s: S, compator:Comparator) where E == S.Element, S : Sequence
