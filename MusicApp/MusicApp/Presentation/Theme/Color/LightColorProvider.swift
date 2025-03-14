//
//  Created by Matt de Waard on 24/06/23.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import SwiftUI
import PresentationKit

struct LightColorProvider: ColorPaletteRepresentable {
    
    typealias ColorType = SemanticColor
    
    func palette(_ color: SemanticColor) -> PaletteElement {
        switch color {
        case .background: .black10
        case .backgroundContent: .white
        case .backgroundElevated: .black20
            
        case .text: .black70
        case .subtext: .black50
        case .invertedText: .white
            
        case .prominentForegroundTint: .white
        case .prominentBackgroundTint: .purple80
            
        case .secondaryForegroundTint: .purple80
        case .secondaryBackgroundTint: .white
            
        case .tint: .purple60
        case .clear: .clear
        }
    }
    
}
