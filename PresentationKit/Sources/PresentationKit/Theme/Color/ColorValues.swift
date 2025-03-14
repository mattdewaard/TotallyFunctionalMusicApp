//
//  Created by Matt de Waard on 27/08/23.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import SwiftUI

public struct ColorValues {
    public let red: CGFloat
    public let green: CGFloat
    public let blue: CGFloat
    public let alpha: CGFloat
}

extension ColorValues {
    
    public init(hex: String) {
        var hex = hex
        var color: UInt64 = 0
        if hex.hasPrefix("#") {
            hex.removeFirst()
        }
        Scanner(string: hex).scanHexInt64(&color)
        
        func readBits(_ count: Int) -> [Double] {
            let mask = 0x000000FF
            return (0..<count).map { Double(mask & Int(color >> ($0 * 8)))/255 }.reversed()
        }
        if hex.count == 6 {
            let values = readBits(3)
            self = ColorValues(red: values[0], green: values[1], blue: values[2], alpha: 1)
        }
        else if hex.count == 8 {
            let values = readBits(4)
            self = ColorValues(red: values[0], green: values[1], blue: values[2], alpha: values[3])
        }
        else {
            self = ColorValues(red: 0, green: 0, blue: 0, alpha: 0)
        }
    }

    public var hexValue: String {
        [red, green, blue, alpha].reduce("", { $0 + String(format: "%02X", Int($1 * 255)) })
    }
        
}

extension ColorValues {
    
    public var color: Color {
        Color(red: red, green: green, blue: blue)
    }
    
}
