//
//  MusicApp
//  Created by Matt de Waard on 16/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct ProcessView: Shape {
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    var progress: Double
    
    init(progress: Double) {
        self.progress = max(0, min(1, progress))
    }
    
    func path(in rect: CGRect) -> Path {
        let bounds = CGRect(x: rect.minX,
                            y: rect.minY,
                            width: rect.width * progress,
                            height: rect.height)
        return Path(bounds)
    }
    
}

