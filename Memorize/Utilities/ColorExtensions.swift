//
//  C4.swift
//  Memorize
//
//  Created by Chad Smith on 7/4/21.
//

import SwiftUI

extension Color {
    /// Initializes a  Color from an RGBAColor
    /// - Parameter rgbaColor: The RGBAColor
    init(rgbaColor: RGBAColor) {
        self.init(.sRGB, red: rgbaColor.red, green: rgbaColor.green, blue: rgbaColor.blue, opacity: rgbaColor.alpha)
    }
}

extension RGBAColor {
    
    /// Initializes an RGBAColor from a Color
    /// - Parameter color: The color
    init(color: Color) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var opacity: CGFloat = 0
        
        if let cgColor = color.cgColor {
            UIColor(cgColor: cgColor).getRed(&red, green: &green, blue: &blue, alpha: &opacity)
        }
        
        self.init(red: Double(red), green: Double(green), blue: Double(blue), alpha: Double(opacity))
    }
}
