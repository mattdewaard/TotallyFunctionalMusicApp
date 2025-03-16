//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct DismissGesture: ViewModifier {
    
    @State private var offset: CGFloat = 0
    @State private var gestureOffset: CGFloat = 0
    
    let cornerRadius: CGFloat
    let threshold: CGFloat
    let onDismiss: () -> Void
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .mask {
                    RadiiRoundedRectangle(radii: .init(topLeading: radius, bottomLeading: 0, bottomTrailing: 0, topTrailing: radius))
                        .ignoresSafeArea()
                }
                .offset(y: actualOffset)
                .shadow(color: Color.black.opacity(shadowOpacity), radius: 16, x: 0, y: 0)
        }
        .animation(.spring(), value: offset)
        .gesture(
            DragGesture()
                .onChanged { value in
                    offset = max(0, value.translation.height)
                    gestureOffset = max(0, value.translation.height)
                }
                .onEnded { value in
                    if actualOffset > threshold {
                        onDismiss()
                    }
                    offset = 0
                }
        )
    }
    
    private var actualOffset: CGFloat {
        offset != gestureOffset ? offset : gestureOffset
    }
    
    private var radius: CGFloat {
        let value = max(0, min(offset, 100))
        return cornerRadius * (value / 100)
    }
    
    private var shadowOpacity: CGFloat {
        0.1 * (max(0, min(offset, 100)) / 100)
    }
    
}

struct RadiiRoundedRectangle: Shape {
    
    let radii: RectangleCornerRadii
    
    func path(in rect: CGRect) -> Path {
        Path(roundedRect: rect, cornerRadii: radii)
    }
}

#Preview {
    VStack {
        
    }
    .background(.blue)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .overlay {
        Rectangle()
            .foregroundStyle(.red)
            .modifier(DismissGesture(cornerRadius: 16, threshold: 400, onDismiss: {}))
    }
    
}
