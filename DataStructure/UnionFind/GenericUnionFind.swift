//
//  GenericUnionFind.swift
//  DataStructure
//
//  Created by 周建顺 on 2020/4/22.
//  Copyright © 2020 rippleinfo. All rights reserved.
//

import Foundation

/// quick union 基于rank、路径减半的优化
public class GenericUnionFind<V>: UF where V : Hashable{
    var dict:Dictionary<V,Node<V>> = [:]
    
    public init() {
        
    }
    
    public func makeSets<S>(_ s:S) where V == S.Element, S:Sequence  {
        for v in s {
            if dict[v] == nil {
                let node = Node(with: v)
                dict[v] = node
            }
        }
    }
    
    public func makeSet(_ v:V)  {
        if dict[v] == nil {
            let node = Node(with: v)
            dict[v] = node
        }
    }
    
    
    public func find(_ v: V) -> V? {
        return findRootNode(v)?.value
    }
    
    public func union(_ v1: V, _ v2: V) {
 
        guard let node1 = findRootNode(v1), let node2 = findRootNode(v2) else {
            return
        }
        if node1.value == node2.value {
            return
        }
        
        if node1.rank < node2.rank {
            node1.parent = node2
        } else if node1.rank > node2.rank {
            node2.parent = node1
        } else {
            node1.parent = node2
            node2.rank += 1
        }
    }
    
    public func isSame(_ v1: V, _ v2: V) -> Bool {
        guard let p1 = find(v1), let p2 = find(v2) else {
            return false
        }
        return p1 == p2
    }
    
    private func findRootNode(_ v:V) -> Node<V>? {
        
        guard var node = dict[v] else {
            return nil
        }
        while  node.value != node.parent.value {
            node.parent = node.parent.parent
            node = node.parent
        }

        return node
    }
    
    
    class Node<V>{

        var value:V
        lazy var parent:Node<V> = self
        var rank = 1
        init(with v:V) {
            self.value = v

        }
    }
    
}
