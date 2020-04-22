//
//  BinaryHeap.swift
//  DataStructure
//
//  Created by 周建顺 on 2020/4/21.
//  Copyright © 2020 rippleinfo. All rights reserved.
//

import Foundation

public class BinaryHeap<E>: Heap {

    var comparator: ((E, E) -> ComparisonResult)?
    var elementSize: Int
    var elements:[E]
    
    public required init(comparator: @escaping (E, E) -> ComparisonResult) {
         self.comparator = comparator
         self.elementSize = 0
         self.elements = []
     }
    
    public convenience init<S>(_ elements:S, comparator: @escaping (E, E) -> ComparisonResult)  where E == S.Element, S : Sequence {
        self.init(comparator:comparator)

        self.elements.append(contentsOf: elements)
        self.elementSize = self.elements.count
        
        if self.elements.count > 1 {
            heapify()
        }
    }
     
    public func size() -> Int {
        elementSize
    }
    
    public func isEmpty() -> Bool {
        elementSize == 0
    }
    
    func compare(e1:E, e2:E) -> ComparisonResult{
        guard let cmp = comparator else {
          fatalError("compare(e1:E, e2:E)")
        }
        
        return cmp(e1, e2)
    }
    
    public func clear() {
        elements.removeAll()
        elementSize = 0
    }
    
    public func add(_ element: E) {
        elements.append(element)
        elementSize += 1
        siftUp(elementSize - 1);
    }
    
    public func add<S>(contentsOf eles: S) where E == S.Element, S : Sequence {
        elements.append(contentsOf: eles)
        elementSize = self.elements.count
        if self.elements.count > 1 {
            heapify()
        }
    }
    
    public func get() -> E? {
        if isEmpty() {
            return nil
        }
        return elements[0]
    }
    
    public func remove() -> E? {
        if isEmpty() {
            return nil
        }
        
        let last  = elementSize - 1
        let root = elements[0]
        elements[0] = elements[last]
        elements.remove(at: last)
        elementSize -= 1
        
        siftDown(0)
        return root
    }
    
    public func replace(_ element: E) -> E? {
        var root:E? = nil
        if isEmpty() {
            elements.append(element)
            elementSize += 1
        } else {
            root = elements[0]
            elements[0] = element
            siftDown(0)
            
        }
        return root
    }
    
    fileprivate func heapify() {
        // 两只方式
        // 1.自上而下上滤
        // 2.自下而上下滤（复杂度较低）

        // 自下而上下滤
        let half = elementSize >> 1 - 1
        for i in (0 ... half).reversed() {
            siftDown(i)
        }
    }
    
    fileprivate func siftUp(_ currentIndex:Int) {
        
        var index = currentIndex
        var cmp:ComparisonResult = .orderedSame
        var parentIndex = 0
        let e = elements[index]
        
        while index > 0 {
            parentIndex = (index - 1) >> 1
            cmp = compare(e1: e, e2: elements[parentIndex])
            if cmp == .orderedDescending {
                elements[index] = elements[parentIndex]
            }else{
                break
            }
            
            index = parentIndex
        }
        
        elements[index] = e
    }
    
    fileprivate func siftDown(_ currentIndex:Int) {
        if isEmpty() {
            return
        }
        var index = currentIndex
        let element = elements[index]
        let half = elementSize >> 1
        
        while index < half {
            var childIndex = index << 1 + 1
            var child = elements[childIndex]
            
            let rightIndex = childIndex + 1
            if rightIndex < elementSize && compare(e1: child, e2: elements[rightIndex]) == .orderedAscending {
                child = elements[rightIndex]
                childIndex = rightIndex
            }
            
            if compare(e1: element, e2: child) == .orderedAscending{
                elements[index] = child
                index = childIndex
            }else{
                break;
            }
            
        }
        
        elements[index] = element
    }
    
}
