//
//  Created by Matt de Waard on 19/08/23.
//  Copyright © 2023. All rights reserved.
//

import SwiftUI
import PresentationKit

struct ColorProvider: ColorRepresentable {
    
    func color(_ color: SemanticColor, in colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .light: LightColorProvider().color(color, in: .light)
        case .dark: DarkColorProvider().color(color, in: .dark)
        @unknown default: LightColorProvider().color(color, in: .light)
        }
    }    
    
}
