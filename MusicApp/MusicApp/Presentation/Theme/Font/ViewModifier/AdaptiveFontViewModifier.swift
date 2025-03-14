//
//  Created by Matt de Waard on 18/11/2024.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import SwiftUI
import PresentationKit

struct AdaptiveFontViewModifier: ViewModifier {

    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    let font: FontType
    
    func body(content: Content) -> some View {
        content.font(Theme.font(font))
    }
    
}

extension View {
    
    func adaptiveFont(_ font: FontType) -> some View {
        self.modifier(AdaptiveFontViewModifier(font: font))
    }
    
}
