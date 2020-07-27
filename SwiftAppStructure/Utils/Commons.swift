//
//  Commons.swift
//  SwiftAppStructure
//
//  Created by Khoi Tran on 7/28/20.
//  Copyright © 2020 Khoi Tran. All rights reserved.
//

import UIKit

struct Commons {

    static func initViewController(
        _ storyboardName: String = StoryboardName.main.rawValue,
        _ identifier: String
    ) -> UIViewController {
        let sb = UIStoryboard(name: storyboardName, bundle: nil)
        return sb.instantiateViewController(
            withIdentifier: identifier
        ) as UIViewController
    }
}
