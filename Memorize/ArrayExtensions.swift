//
//  ArrayExtensions.swift
//  Memorize
//
//  Created by Chad Smith on 6/6/21.
//

import Foundation

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        }
        
        return nil
    }
}
