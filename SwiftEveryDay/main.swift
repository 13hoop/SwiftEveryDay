//
//  main.swift
//  SwiftEveryDay
//
//  Created by Naton on 2018/12/12.
//  Copyright © 2018 13hoop. All rights reserved.
//

import Foundation

print("This is the main for CL_App by 13hoop!")


func demo1217_2() {
    let queen: YRFIFO = [1, 2, 3]
}

demo1217_2()


func demo1217() {
    var queen = YRFIFO<String>()
    for x in ["a", "b", "c", "d", "e"] {
        queen.enQueen(x)
    }
    
    for s in queen {
        print(s, separator: "", terminator: " ~ ")
    }
    print("\n")
    
    var a = Array(queen)
    a.append(contentsOf: queen[2...3])
    for s in a {
        print(s, separator: "", terminator: " ~ \n")
    }
    
    let c = a.map { (elm) -> String in
        elm.uppercased()
    }
    for s in c {
        print(s)
    }

}

//demo1217()




func demo111213() {
    //--------  swift 集合类型解读 之 Sequence - 1212
    /*
     一般说来，Iterator 都是只类型的，但是如果想要 引用类型
     就使用 AnyIterator 包装一下
     
     */
    // let seq = stride(from: 0, to: 10, by: 1)
    // var it1 = seq.makeIterator()
    // it1.next()
    
    
    /*
     序列Sequence 操作元素是延时的跟不稳定的，所以序列不会提供 fist，end这样的“显而易见”的操作
     而集合Collection 是 稳定的
     
     一个可消耗不稳定Sequence的例子，如对一个 readLine 函数的封装，其作用为读取 标准输入的一行
     */
    let standartIn = AnyIterator {
        return AnyIterator {
            readLine()
        }
    }
    
    let numberedStdIn = standartIn.enumerated()
    for (num, line) in numberedStdIn {
        print("\([num]): \(line)" )
    }
}


