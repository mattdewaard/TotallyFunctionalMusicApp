//
//  Created by Matt de Waard on 25/06/23.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import SwiftUI

public protocol PaletteRepresentable {
    associatedtype Palette: RawRepresentable<String>
}

public extension PaletteRepresentable {
    
    func callAsFunction(_ palette: Palette) -> Color {
        ColorValues(hex: palette.rawValue).color
    }
    
}
