//
//  Created by Matt de Waard on 19/08/23.
//  Copyright © 2023. All rights reserved.
//

import Foundation
import PresentationKit

struct DarkColorProvider: ColorPaletteRepresentable {

    typealias ColorType = SemanticColor
    
    func palette(_ color: SemanticColor) -> PaletteElement {
        switch color {
        case .background: .black100
        case .backgroundContent: .black80
        case .backgroundElevated: .black60
            
        case .text: .white
        case .subtext: .black50
        case .invertedText: .black70
            
        case .prominentForegroundTint: .white
        case .prominentBackgroundTint: .purple50
            
        case .secondaryForegroundTint: .purple50
        case .secondaryBackgroundTint: .black80
            
        case .tint: .purple60
            
        case .clear: .clear
        }
    }
    
}
