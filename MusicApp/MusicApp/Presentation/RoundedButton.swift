//
//  Created by Matt de Waard on 1/07/23.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import SwiftUI

struct RoundedButton<Label: View>: View {
    
    enum Style {
        case prominent
        case secondary
    }
    
    @State var isAnimating: Bool = false
    
    let label: Label
    let style: Style
    let wrapped: Bool
    let action: () async -> Void
    
    init(@ViewBuilder label: ()->Label, style: Style = .prominent, wrapped: Bool = false, action: @escaping () async -> Void) {
        self.label = label()
        self.style = style
        self.wrapped = wrapped
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            isAnimating = true
            Task {
                await action()
                isAnimating = false
            }
        }, label: {
            label
                .adaptiveForeground(foregroundColor)
                .padding(Theme.size(.size200))
                .frame(height: 50)
                .frame(maxWidth: wrapped ? nil : .infinity)
                .overlay(alignment: .trailing) {
                    if isAnimating {
                        ProgressView()
                    }
                }
        })
        .font(Theme.font(.body1(.bold)))
        .frame(minWidth: 50)
        .background() {
            RoundedRectangle(cornerRadius: 12)
                .adaptiveForeground(backgroundColor)
        }
    }
    
    private var foregroundColor: SemanticColor {
        switch style {
        case .prominent: .prominentForegroundTint
        case .secondary: .secondaryForegroundTint
        }
    }
    
    private var backgroundColor: SemanticColor {
        switch style {
        case .prominent: .prominentBackgroundTint
        case .secondary: .secondaryBackgroundTint
        }
    }
    
}

extension RoundedButton where Label == Text {
    
    init(_ title: String, style: Style = .prominent, wrapped: Bool = false, action: @escaping () async -> Void) {
        self.style = style
        self.action = action
        self.wrapped = wrapped
        self.label = Text(title)
    }
    
}

extension RoundedButton where Label == Image {
    
    init(systemImage: String, style: Style = .prominent, wrapped: Bool = false, action: @escaping () async -> Void) {
        self.style = style
        self.action = action
        self.wrapped = wrapped
        self.label = Image(systemName: systemImage)
    }
    
    init(image: String, style: Style = .prominent, wrapped: Bool = false, action: @escaping () async -> Void) {
        self.style = style
        self.action = action
        self.wrapped = wrapped
        self.label = Image(image)
    }
    
}

#Preview {
    VStack {
        RoundedButton("+", style: .prominent, wrapped: true, action: {})
        RoundedButton("Prominent", style: .prominent, action: {})
            .frame(width: 200)
        RoundedButton("Secondary", style: .secondary, action: {})
            .padding(.horizontal)
    }
}

