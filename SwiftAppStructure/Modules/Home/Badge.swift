//
//  Badge.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 8/11/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import UIKit

class Badge: UILabel {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = 7
        clipsToBounds = true
    }

}
