//
//  LinkedList.swift
//  DataStructure
//
//  Created by 周建顺 on 2020/4/18.
//  Copyright © 2020 rippleinfo. All rights reserved.
//

import Foundation

public class LinkedList<E: Equatable>: List {
    private var nodeSize:Int = 0
    
    private var first:Node<E>?
    private var last:Node<E>?
    
    public func clear() {
        first = nil
        last = nil
        nodeSize = 0
    }
    
    public func size() -> Int {
        nodeSize
    }
    
    public func isEmpty() -> Bool {
        nodeSize == 0
    }
    
    public func contains(_ element: E) -> Bool {
        indexOf(element) != nil
    }
    
    public func add(_ element: E) {
        add(element, at: nodeSize)
    }
    
    public func get(at index: Int) -> E? {
        guard let target = node(at: index) else {
            return nil
        }
        return target.element
    }
    
    public func set(_ element: E, at index: Int) -> E? {
        guard let target = node(at: index) else {
            return nil
        }
        let old = target.element
        target.element = element
        return old
    }
    
    public func add(_ element: E, at index: Int) {
        checkRanegForAdd(nodeSize)
        
        if index == nodeSize {
            // 添加到最后
            let newNode = Node(prev: last, element: element, next: nil)
            if isEmpty() {
                first = newNode
            }
            last?.next = newNode
            last = newNode
        }else {
            // 添加到其他位置
            let next = node(at: index)!
            let prev = next.prev
            let newNode = Node(prev: prev, element: element, next: next)
            next.prev = newNode
            if prev == nil {
                first = newNode
            }else {
                prev!.next = newNode
            }
        }
        nodeSize += 1
    }
    
    public func remove(at index: Int) -> E? {
        guard checkRange(at: index) else {
            return nil
        }
        
        let curNode = node(at: index)!
        let prev = curNode.prev
        let next = curNode.next

        prev?.next = next
        next?.prev = prev
        if prev == nil {
            // 删除的是头节点
            first = next
            
        }
        
        if next == nil {
            // 删除的是尾节点
            last = prev
        }
        nodeSize -= 1
        return curNode.element
    }
    
    public func indexOf(_ element: E) -> Int? {
        if isEmpty() {
            return nil
        }
        
        var cur = first
        var index = 0
        while cur != nil {
            if cur?.element == element {
                break
            }
            index += 1
            cur = cur?.next
        }
        return index
    }
    
    private func node(at index:Int) -> Node<E>?{
        var cur = first
        var curIndex = 0
        while cur != nil {
            if curIndex == index  {
                return cur
            }
            curIndex += 1
            cur = cur?.next
        }
        return nil
    }
    
    
    private class Node<E> {
        var element:E
        var next:Node<E>?
        weak var prev:Node<E>?
        
        init(prev:Node<E>?, element: E, next: Node<E>?) {
            self.prev = prev
            self.element = element
            self.next = next
        }
    }
    
    private func checkRanegForAdd(_ index: Int){
        if index > nodeSize {
            fatalError("index out of bounds. index: \(index), bounds: \(nodeSize)")
        }
    }
    
    private func checkRange(at index: Int) -> Bool{
        index < nodeSize
    }
}

extension LinkedList: CustomStringConvertible, CustomDebugStringConvertible{
    public var description: String {
       
        var str = "size=\(nodeSize),[ "
        
        var cur = first
        
        while cur != nil {
            str.append(",")
            str.append("\(cur!.prev?.element as Any)_\(cur!.element)_\(cur!.next?.element as Any)")
            
            cur = cur?.next
        }
         
        str.append(" ]")
        return str
    }
    
    public var debugDescription: String {
         var str = "size=\(nodeSize),[ "
               
               var cur = first
               
               while cur != nil {
                   str.append(",")
                   str.append("\(cur!.prev?.element as Any)_\(cur!.element)_\(cur!.next?.element as Any)")
                   
                   cur = cur?.next
               }
                
               str.append(" ]")
               return str
    }
    
    
}
