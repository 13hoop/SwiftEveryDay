# SwiftEveryDay

- [1217 -- ExpressibleByArrayLiteral](https://gist.github.com/13hoop/619c6c54c22610c13bfddcd8455a77a2)        
`ExpressibleByArrayLiteral`协议，允许使用`[a, b, c]`这样的字面量形式，创建一个`Collection`类型，这就意味着它不光可以创建`Array`,比如下边这样：
```swift
func foo(sets: Sets<String>) {}

// 调用
foo(sets: ["aaa", "bbb", "ccc"])
```

- [1219  -- IndexingIterator](https://github.com/apple/swift/blob/master/stdlib/public/core/Collection.swift#L360-L407)         
标准库中，跟`Collection`协议一样，它其中的迭代器是通过`IndexingIterator`实现的，它利用集合本事的索引来迭代元素，核心代码
```swift
public mutating func next() -> Elements.Element? {
    if _position == _elements.endIndex { 
        return nil 
    }

    let element = _elements[_position]
    _elements.formIndex(after: &_position)
    return element
}
```