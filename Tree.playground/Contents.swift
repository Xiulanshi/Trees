//: Playground - noun: a place where people can play

import UIKit
/*
/*
   4
 2   6
1 3 5 7
*/

class Node<T: Comparable> {
    let value: T
    var left: Node<T>?
    var right: Node<T>?
    init(value: T) {
        self.value = value
    }
}

extension Node {
    func bfs(value: T) -> Node? {
        // Check the current node (self)'s value
        if self.value == value {
            // If it matches, return self
            return self
        }
        // Check each of this node's child nodes
        for child in [left, right] {
            if child?.value == value {
                return child
            }
        }
        // Repeat this whole process for each of the child nodes
        for child in [left, right] {
            if let result = child?.bfs(value) {
                return result
            }
        }
        return nil
    }
}

let a = Node(value: 1)
let b = Node(value: 2)
let c = Node(value: 3)
let d = Node(value: 4)
let e = Node(value: 5)
let f = Node(value: 6)
let g = Node(value: 7)

d.left = b
b.left = a
b.right = c
d.right = f
f.left = e
f.right = g



d.bfs(5)

*/

/*
   4
 2   6
1 3 5 7

4.printInorder()
2.printInorder()
1.printInorder()
(left is nil)
print 1
(right is nil)
print 2
3.printInorder()
(left is nil)
print 3
(right is nil)
print 4
6.printInorder()
5.printInorder()
(left is nil)
print 5
(right is nil)
print 6
7.printInorder()
(left is nil)
print 7
(right is nil)
*/
/*
class Node<T: Comparable> {
    let value: T
    var left: Node<T>?
    var right: Node<T>?

    init(value: T) {
        self.value = value
    }
    
    func bfs(value: T) -> Node? {
        //print("Visited: \(self)")

        // Check the current node (self)'s value
        if self.value == value {
            // If it matches, return self
            return self
        }
        // Check each of this node's child nodes
        let children: [Node<T>?] = [left, right]
        for child in children {
            if child != nil {
                print("Visited: \(child!)")
            }
            if child?.value == value {
                return child
            }
        }
        // Repeat this whole process for each of the child nodes
        for child in [left, right] {
            if let result = child?.bfs(value) {
                return result
            }
        }
        return nil
    }
    
    func printInorder() {
        if let l = left {
            l.printInorder()
        }
        print(value)
        if let r = right {
            r.printInorder()
        }
    }
    
    func printPreorder() {
        print(value)
        left?.printPreorder()
        right?.printPreorder()
    }
    
    func printPostorder() {
        left?.printPostorder()
        right?.printPostorder()
        print(value)
    }
}
extension Node: CustomStringConvertible {
    var description: String {
        return "\(value)"
    }
}

let a = Node(value: 1)
let b = Node(value: 2)
let c = Node(value: 3)
let d = Node(value: 4)
let e = Node(value: 5)
let f = Node(value: 6)
let g = Node(value: 7)

d.left = b
b.left = a
b.right = c
d.right = f
f.left = e
f.right = g

d.bfs(5)

*/

func insertionsort<T: Comparable>(inout values: [T]) -> Void {
    for i in 1..<values.count {
        var j = i
        while j > 0 && values[j - 1] > values[j] {
            swap(&values[j], &values[j - 1])
            j -= 1
        }
    }
}

func quicksort<T: Comparable>(inout values: [T], lo: Int, hi: Int) {
    if lo < hi {
        let p = partition(&values, lo: lo, hi: hi)
        quicksort(&values, lo: lo, hi: p - 1)
        quicksort(&values, lo: p + 1, hi: hi)
    }
}

func partition<T: Comparable>(inout values: [T], lo: Int, hi: Int) -> Int {
    let pivot = values[hi]
    var i = lo
    for j in lo..<hi {
        if values[j] <= pivot {
            if i != j {
                swap(&values[i], &values[j])
            }
            i += 1
        }
    }
    if i != hi {
        swap(&values[i], &values[hi])
    }
    return i
}

var values = [1, 5, 2, 1, 5, 6]
quicksort(&values, lo: 0, hi: values.count - 1)
