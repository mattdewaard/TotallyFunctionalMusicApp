//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI
import Combine

@MainActor
final class PlaybackViewModel: ObservableObject {
    
    @Published var isPlaying: Bool = false
    @Published private(set) var currentTime: TimeInterval = 0
    @Published private var scrubTime: TimeInterval = 0
    
    var publisher: Publishers.Autoconnect<Timer.TimerPublisher>?
    var cancellable: AnyCancellable?
    
    let duration: TimeInterval
    
    init(duration: TimeInterval) {
        self.duration = duration
    }
    
    private func enableTimer() {
        let publisher = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
        self.publisher = publisher
        self.cancellable = publisher.sink { [weak self] date in
            guard let self else { return }
            let newTime = min(self.actualTime + 1, self.duration)
            self.scrubTime = newTime
            self.currentTime = newTime
        }
    }
    
    private func disableTimer() {
        cancellable?.cancel()
        publisher?.upstream.connect().cancel()
        publisher = nil
        cancellable = nil
    }
    
    private var actualTime: TimeInterval {
        scrubTime != currentTime ? scrubTime : currentTime
    }
    
}

extension PlaybackViewModel {
    
    func setCurrentTime(_ progress: Double) {
        disableTimer()
        scrubTime = duration * max(0, min(1, progress))
    }
    
    func resumeIfNeeded() {
        currentTime = scrubTime
        if isPlaying {
            enableTimer()
        }
    }
    
    func start() {
        isPlaying = true
        enableTimer()
    }
    
    func stop() {
        isPlaying = false
        disableTimer()
    }
    
    func next() {
        // Go to next song :)
    }
    
    func previous() {
        if currentTime < 5 {
            // Go to previous song
        } else {
            scrubTime = 0
//            currentTime = 0
        }
    }
    
}

extension PlaybackViewModel {
    
    var progress: Double {
        actualTime / duration
    }
    
    var currentTimeText: String {
        Duration.seconds(actualTime).formatted(.time(pattern: .minuteSecond))
    }
    
    var durationText: String {
        Duration.seconds(duration).formatted(.time(pattern: .minuteSecond))
    }
    
}
