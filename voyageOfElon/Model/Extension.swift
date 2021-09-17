//
//  Extension.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 17.09.2021.
//

import Foundation

extension Sequence {
    
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
                return currentElement[keyPath: a]
            default:
                print("Warning - Sort options is nil!")
                return false
            }
        }
    }
}
