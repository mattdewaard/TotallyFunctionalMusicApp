//
//  Created by Matt de Waard on 18/11/2024.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import SwiftUI
import PresentationKit

struct AdaptiveTintViewModifier: ViewModifier {

    @Environment(\.colorScheme) var colorScheme
    
    let light: Color
    let dark: Color
    
    func body(content: Content) -> some View {
        content.tint(color)
    }

    private var color: Color {
        switch colorScheme {
        case .light: light
        case .dark: dark
        @unknown default: light
        }
    }
    
}

extension View {
    
    func adaptiveTint(_ color: SemanticColor) -> some View {
        self.modifier(AdaptiveTintViewModifier(
            light: Theme.color(color, in: .light),
            dark: Theme.color(color, in: .dark)
        ))
    }
    
}
