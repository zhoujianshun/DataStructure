//
//  List.swift
//  DataStructure
//
//  Created by 周建顺 on 2020/4/18.
//  Copyright © 2020 rippleinfo. All rights reserved.
//

import Foundation


public protocol List {
    associatedtype E
    
    func clear()

    func size() -> Int

    func isEmpty() -> Bool

    func contains(_ element: E) -> Bool

    func add(_ element: E)

    func get(at index: Int) -> E?

    func set(_ element: E, at index: Int) -> E?

    func add(_ element: E, at index: Int)

    func remove(at index: Int ) -> E?

    func indexOf(_ element:E) -> Int?
}
