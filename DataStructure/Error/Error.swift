//
//  Error.swift
//  DataStructure
//
//  Created by 周建顺 on 2020/4/18.
//  Copyright © 2020 rippleinfo. All rights reserved.
//

import Foundation

enum DataStructError: Error {
    case indexOutOfBounds(index: Int, bounds: Int)
}
