//
//  UIFont+Ext.swift
//  CircularCarousel
//
//  Created by Suha Baobaid on 3/19/22.
//


import UIKit

extension UIFont {
    static func preferredFont(forTextStyle: TextStyle, weight: Weight) -> UIFont {
        // NOTE: This is to support scalable custom fonts in the app
        let metrics = UIFontMetrics(forTextStyle: forTextStyle)
        // NOTE: used to create or modify UIFont object
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: forTextStyle)
        let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
        // NOTE: To get the dynamic type of text
        return metrics.scaledFont(for: font)
    }
}
