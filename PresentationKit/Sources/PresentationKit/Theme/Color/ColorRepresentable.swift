//
//  Created by Matt de Waard on 25/06/23.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import SwiftUI

public protocol ColorRepresentable {
    
    associatedtype ColorType
    func color(_ color: ColorType, in colorScheme: ColorScheme) -> Color
    
}

public extension ColorRepresentable {
    
    func callAsFunction(_ color: ColorType, in colorScheme: ColorScheme) -> Color {
        self.color(color, in: colorScheme)
    }
    
}
