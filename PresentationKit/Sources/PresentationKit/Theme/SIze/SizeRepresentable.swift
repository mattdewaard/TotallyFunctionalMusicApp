//
//  Created by Matt de Waard on 25/06/23.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import Foundation

public protocol SizeRepresentable {
    associatedtype SizeType
    func callAsFunction(_ size: SizeType) -> CGFloat
}
