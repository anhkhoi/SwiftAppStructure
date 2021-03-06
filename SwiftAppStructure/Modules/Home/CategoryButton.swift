//
//  CategoryButton.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 8/11/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import UIKit

class CategoryButton: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        imageView?.contentMode = .scaleAspectFit
    }
}
