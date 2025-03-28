//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct DismissGesture: ViewModifier {
    
    @State private var offset: CGFloat = 0
    @State private var gestureOffset: CGFloat = 0
    
    let threshold: CGFloat
    let onDismiss: () -> Void
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .offset(y: actualOffset)
        }
        .animation(.spring(), value: offset)
        .gesture(
            DragGesture()
                .onChanged { value in
                    offset = max(0, value.translation.height)
                    gestureOffset = max(0, value.translation.height)
                }
                .onEnded { value in
                    if actualOffset > threshold || value.velocity.height > 1500 {
                        onDismiss()
                    }
                    offset = 0
                }
        )
    }
    
    private var actualOffset: CGFloat {
        offset != gestureOffset ? offset : gestureOffset
    }
    
    private var shadowOpacity: CGFloat {
        0.1 * (max(0, min(offset, 100)) / 100)
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
            .modifier(DismissGesture(threshold: 400, onDismiss: {}))
    }
    
}
