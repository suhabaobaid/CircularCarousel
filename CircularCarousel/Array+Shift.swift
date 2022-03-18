//
//  Array+Shift.swift
//  CircularCarousel
//
//  Created by Suha Baobaid on 3/18/22.
//

import Foundation

// Example: [1,2,3,4,5].shift(distance: 3) -> [4,5,1,2,3]
extension Array {
    func shift(distance: Int = 1) -> [Element] {
        let offsetIndex = distance >= 0 ?
            self.index(startIndex, offsetBy: distance, limitedBy: endIndex) :
            self.index(endIndex, offsetBy: distance, limitedBy: startIndex)

        guard let index = offsetIndex else { return self }
        // Note: Broken apart as the type checked was taking 500ms to compile
        let endRange = index..<endIndex
        let endOfArray = self[endRange]

        let startRange = startIndex..<index
        let startOfArray = self[startRange]
        return Array(endOfArray + startOfArray)
    }

    mutating func shiftInPlace(withDistance distance: Int = 1) {
        self = shift(distance: distance)
    }
}
