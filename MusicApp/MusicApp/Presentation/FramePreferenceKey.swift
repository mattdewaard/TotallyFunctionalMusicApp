//
//  MusicApp
//  Created by Matt de Waard on 15/03/2025.
//  Copyright © 2025. All rights reserved.
//

import SwiftUI

struct FramePreferenceKey: PreferenceKey {
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
    
}
