//
//  RMFloating+UIColor.swift
//  RMFloatingAction
//
//  Created by Roger Molas on 09/03/2018.
//  Copyright © 2018 Roger Molas. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    var pixelImage: UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        self.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
