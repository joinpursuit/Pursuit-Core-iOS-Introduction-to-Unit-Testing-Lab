//
//  stringExtension.swift
//  IntroToUnitTestingLab
//
//  Created by Sam Roman on 8/29/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func noPercentEncoding() -> String {
        return self.removingPercentEncoding ?? "no string"
    }
}
