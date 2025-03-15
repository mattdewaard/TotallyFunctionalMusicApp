//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    
    let url: String
    
    var body: some View {
        PortionallyRoundedRectangle()
            .foregroundStyle(LinearGradient(colors: [.purple, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
            .opacity(0.4)
    }
    
}

struct PortionallyRoundedRectangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) * 0.20
        return Path(roundedRect: rect, cornerRadius: radius)
    }
    
}
