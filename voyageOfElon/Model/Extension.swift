//
//  Extension.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 16.09.2021.
//

import Foundation

extension Sequence {
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted { a, b in
            return a[keyPath: keyPath] < b[keyPath: keyPath]  // read
        }
    }
}
