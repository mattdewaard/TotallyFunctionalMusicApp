//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct PlaybackProgressView: View {
    
    @EnvironmentObject var viewModel: PlaybackViewModel
    @State private var progressWidth: CGFloat = 0
    
    var body: some View {
        HStack {
            Text(viewModel.currentTimeText)
                .frame(width: 60, alignment: .trailing)
            
            ProcessView(progress: viewModel.progress)
                .adaptiveForeground(.tint)
                .animation(.linear(duration: 1), value: viewModel.currentTime)
                .frame(height: 5)
                .background {
                    GeometryReader { proxy in
                        Capsule()
                            .adaptiveForeground(.tint)
                            .opacity(0.1)
                            .preference(key: FramePreferenceKey.self, value: proxy.frame(in: .named("Scroll")))
                    }
                    .onPreferenceChange(FramePreferenceKey.self) { value in
                        progressWidth = value.size.width
                    }
                }
                .clipShape(Capsule())
                .gesture(DragGesture()
                    .onChanged { value in
                        let location = value.location
                        viewModel.setCurrentTime(location.x / progressWidth)
                    }
                    .onEnded { value in
                        viewModel.resumeIfNeeded()
                    })
            
            Text(viewModel.durationText)
                .frame(width: 60, alignment: .leading)
        }
        .adaptiveFont(.body3)
        .adaptiveForeground(.subtext)
    }
    
}

#Preview {
    VStack {
        PlaybackProgressView()
            .environmentObject(PlaybackViewModel(duration: 221))
        Spacer()
    }
}
