//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct PlayButtonView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var isPlaying: Bool
    
    var body: some View {
        ZStack {
            let insetValue = 0.2
            let percentage: Double = isPlaying ? 0 : 1
            PlayButtonPrimaryShape(insetValue: insetValue, percentage: percentage)
                .stroke(Theme.color(.tint, in: colorScheme), style: .init(lineWidth: 4, lineJoin: .round))
                .fill(Theme.color(.tint, in: colorScheme))
            PlayButtonSecondaryShape(insetValue: insetValue, percentage: percentage)
                .stroke(Theme.color(.tint, in: colorScheme), style: .init(lineWidth: 4, lineJoin: .round))
                .fill(Theme.color(.tint, in: colorScheme))
        }
    }
    
}

private struct PlayButtonPrimaryShape: Shape {
    
    let insetValue: Double
    var percentage: Double
    
    var animatableData: Double {
        get { percentage }
        set { percentage = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let inset = (rect.width * insetValue) * (1-percentage)
        path.move(to: CGPoint(x: inset + rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: inset + rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: inset + rect.width * percentage, y: rect.midY))
        path.addLine(to: CGPoint(x: inset + rect.width * percentage, y: rect.midY))
        path.addLine(to: CGPoint(x: inset + rect.minX, y: rect.minY))
        path.closeSubpath()
        return path
    }
    
}

private struct PlayButtonSecondaryShape: Shape {
    
    let insetValue: Double
    var percentage: Double
    
    var animatableData: Double {
        get { percentage }
        set { percentage = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let inset = (rect.width * insetValue) * (1 - percentage)
        let topPosition = percentage * rect.midY
        let bottomPosition = rect.maxY - (percentage * rect.midY)
        
        path.move(to: CGPoint(x: rect.maxX - inset, y: topPosition))
        path.addLine(to: CGPoint(x: rect.maxX - inset, y: topPosition))
        path.addLine(to: CGPoint(x: rect.maxX - inset, y: bottomPosition))
        path.addLine(to: CGPoint(x: rect.maxX - inset, y: bottomPosition))
        path.closeSubpath()
        
        return path

    }
    
}

