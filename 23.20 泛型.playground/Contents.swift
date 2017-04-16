//: Playground - noun: a place where people can play

import UIKit
/*********************泛型函数*****************/
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var one = 1,two = 2
swapTwoValues(&one, &two)
print("One=\(one),Two=\(two)")
//打印：One=2,Two=1
var strOne = "One", strTwo = "Two"
swapTwoValues(&strOne, &strTwo)
print("One=\(strOne),Two=\(strTwo)")
//打印：One=Two,Two=One
var doubleOne = 1.0,doubleTwo = 2.0
swapTwoValues(&doubleOne, &doubleTwo)
print("One=\(doubleOne),Two=\(doubleTwo)")
//打印：One=2.0,Two=1.0

/*******************泛型类型*****************/

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    func toString() {
        for item in items {
            print("\(item)",terminator:",")
        }
    }
}

var stack = Stack<String>()
stack.push("东")
stack.push("西")
stack.push("南")
stack.push("北")
stack.toString()
print()
stack.pop()
stack.toString()
print()
stack.pop()
stack.pop()
stack.toString()
print()
/*******************类型约束*****************/

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

var arr = ["北京","上海","广州","深圳"]

let pos = findIndex(of: "广州", in: arr)

if let p = pos {
    print("在位置\(p)找到元素'广州'")
}else{
    print("没有找到元素'广州'")
}

let pos1 = findIndex(of: "南京", in: arr)

if let p = pos1 {
    print("在位置\(p)找到元素'南京'")
}else{
    print("没有找到元素'南京'")
}

