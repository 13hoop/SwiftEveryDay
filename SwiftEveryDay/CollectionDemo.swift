//
//  CollectionDemo.swift
//  SwiftEveryDay
//
//  Created by Naton on 2018/12/12.
//  Copyright © 2018 13hoop. All rights reserved.
//

import Foundation


/**--------  swift 集合类型解读 之 Collection - 1213/17

    通过定一个 队列 来熟悉 Collection协议
 其区别于 栈 ，栈的实现可以通过数组Array实现，但其会在练习内存中持有元素，这对 pop & push 来说很简单，但一旦有 remove(at: ) 这样的操作，时间复杂就会是 O(n)
 */

protocol YRQueen {
    associatedtype Element
    // 入队
    mutating func enQueen(_ newElement: Element)
    // 出队
    mutating func deQueen() -> Element?
}

/// 一个高效的 FIFO队列
struct YRFIFO<Element>: YRQueen {
    fileprivate var left: [Element] = []
    fileprivate var right: [Element] = []
    
    // O(1)
    mutating func enQueen(_ newElement: Element) {
        right.append(newElement)
    }
    
    // 队列为空时，返回 nil
    // 均摊复杂度 O(1)
    mutating func deQueen() -> Element? {
        if left.isEmpty {
            // 这一步其实是 O(n)，但总体 均摊之后 就是 O(1)， 因为并不需要总是 reverseda, 一个形象的理解就是 通过AB2个银行，A存钱，B取钱n，B没有就去A拿，所以无论如何 大量操作均摊之后都不会出现赤字
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

extension YRFIFO: Collection {
    public var startIndex: Int { return 0 }
    public var endIndex: Int { return left.count + right.count }
    
    public func index(after i: Int) -> Int {
        precondition(i < endIndex)
        return i + 1
    }
    
    // 返回下标元素
    public subscript(position: Int) -> Element {
        precondition((0 ..< endIndex).contains(position), "[Error]: index(\(position)) out of bounds")
        if position < left.endIndex {
            return left[left.count - position - 1]
        }else {
            return right[position - left.count]
        }
    }
}

// 允许以 自面量 "[1, 2 ...]" 创建队列
extension YRFIFO: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        self.init(left: elements.reversed(), right: [])
    }
}

