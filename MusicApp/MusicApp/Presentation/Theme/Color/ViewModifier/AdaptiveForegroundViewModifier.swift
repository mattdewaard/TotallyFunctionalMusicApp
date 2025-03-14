//
//  Created by Matt de Waard on 18/11/2024.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import SwiftUI
import PresentationKit

struct AdaptiveForegroundViewModifier: ViewModifier {

    @Environment(\.colorScheme) var colorScheme
    
    let light: Color
    let dark: Color
    
    func body(content: Content) -> some View {
        content.foregroundStyle(color)
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
    
    func adaptiveForeground(_ color: SemanticColor) -> some View {
        self.modifier(AdaptiveForegroundViewModifier(
            light: Theme.color(color, in: .light),
            dark: Theme.color(color, in: .dark)
        ))
    }
    
}
