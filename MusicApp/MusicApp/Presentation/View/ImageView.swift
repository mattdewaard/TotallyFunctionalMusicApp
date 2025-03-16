//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

// This should be an image handling View
struct ImageView: View {
    
    var colorCombinations: [[Color]] = [
        [.purple, .orange],
        [.red, .green],
        [.blue, .orange],
        [.yellow, .purple],
        [.pink, .cyan]
    ]
    
    let url: String
    
    var body: some View {
        PortionallyRoundedRectangle()
            .foregroundStyle(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
            .opacity(0.6)
    }
    
    var colors: [Color] {
        let bytes = url.data(using: .utf8)!
        let result = bytes.reduce(Int.zero, { $0 + Int($1) })
        let index = result % colorCombinations.count
        return colorCombinations[index]
    }
}

struct PortionallyRoundedRectangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) * 0.10
        return Path(roundedRect: rect, cornerRadius: radius)
    }
    
}
