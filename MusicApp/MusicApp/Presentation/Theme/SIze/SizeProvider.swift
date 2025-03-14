//
//  Created by Matt de Waard on 19/08/23.
//  Copyright © 2023. All rights reserved.
//

import Foundation
import PresentationKit

struct SizeProvider: SizeRepresentable {
    
    func callAsFunction(_ size: SizeType) -> CGFloat {
        let base: CGFloat = 8
        return base * size.multiplier
    }
    
}

fileprivate extension SizeType {
    
    var multiplier: CGFloat {
        switch self {
        case .size050: 0.50
        case .size100: 1.00
        case .size150: 1.50
        case .size200: 2.00
        case .size250: 2.50
        case .size300: 3.00
        case .size400: 4.00
        case .size500: 5.00
        case .size600: 6.00
        }
    }
    
}
