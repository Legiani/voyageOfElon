//
//  Extension.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 16.09.2021.
//

import Foundation

extension Sequence {
//    func sorted<Value: Comparable>(on keyPath: KeyPath<Self.Element, Value>) -> [Element] {
//        return sorted { a, b in
//            return a[keyPath: keyPath] < b[keyPath: keyPath]  // read
//        }
//    }
    
//    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
//        return sorted { a, b in
//            return a[keyPath: keyPath] < b[keyPath: keyPath]  // read
//        }
//    }
    
    func sorted(by keyPath: AnyKeyPath) -> [Element] {
        return sorted { currentElement, nextElement in
            switch keyPath {
            case let a as KeyPath<Self.Element, String>:
                return currentElement[keyPath: a] < nextElement[keyPath: a]
            case let a as KeyPath<Self.Element, Int>:
                return currentElement[keyPath: a] < nextElement[keyPath: a]
            case let a as KeyPath<Self.Element, Float>:
                return currentElement[keyPath: a] < nextElement[keyPath: a]
            case let a as KeyPath<Self.Element, Bool>:
                return currentElement[keyPath: a] == nextElement[keyPath: a]
            default:
                return true
                //fatalError("Unable to sort value")
            }
        }
    }
}
