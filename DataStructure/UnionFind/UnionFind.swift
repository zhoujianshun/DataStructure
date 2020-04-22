//
//  UnionFind.swift
//  DataStructure
//
//  Created by 周建顺 on 2020/4/22.
//  Copyright © 2020 rippleinfo. All rights reserved.
//

import Foundation

protocol UF {
    associatedtype V
    func find(_ v:V) -> V?
    func union(_ v1:V, _ v2:V)
    func isSame(_ v1:V, _ v2:V) -> Bool
}
