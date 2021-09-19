//
//  Extension.swift
//  voyageOfElon
//
//  Created by Jakub Bednář on 17.09.2021.
//

import Foundation
import UIKit

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

extension UIViewController {
    func showError(text: String) {
        let alert = UIAlertController(title: "Chybyčka se vbloudila", message: "\(text)", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
}
