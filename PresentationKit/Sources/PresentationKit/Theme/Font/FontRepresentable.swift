//
//  Created by Matt de Waard on 24/06/23.
//  Copyright © 2023 Owl Labs. All rights reserved.
//

import SwiftUI

public protocol FontRepresentable {
    associatedtype FontType
    func callAsFunction(_ font: FontType) -> Font    
}
