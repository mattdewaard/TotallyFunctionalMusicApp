//
//  Created by Matt de Waard on 25/06/23.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import SwiftUI
import Foundation

public protocol ColorPaletteRepresentable: ColorRepresentable {
    
    associatedtype Palette: RawRepresentable<String>
    func palette(_ color: ColorType) -> Palette
    
}


public extension ColorPaletteRepresentable {
    
    func color(_ color: ColorType, in colorScheme: ColorScheme) -> Color {
        let palette: Palette = self.palette(color)
        return ColorValues(hex: palette.rawValue).color
    }
    
}
