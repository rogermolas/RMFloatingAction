//
//  RMFloatingButton.swift
//  RMFloatingAction
//
//  Created by Roger Molas on 09/03/2018.
//  Copyright © 2018 Roger Molas. All rights reserved.
//

import Foundation
import UIKit

class RMFloatingButton: UIButton {
    private var bgColor: UIColor!
    private var localTitle: String?
    private var localLabel: UILabel?
    
    var index: Int!
    var title: String? { return localTitle }
    
    convenience init(title:String?, backgroundColor: UIColor = UIColor.green) {
        self.init()
        self.localTitle = title
        self.bgColor = backgroundColor
        setBackgroundImage(backgroundColor.pixelImage, for: .normal)
    }
    
    convenience init(title:String?, image: UIImage?) {
        self.init()
        self.localTitle = title
        setImage(image, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        tintColor = UIColor.white
        if backgroundImage(for: .normal) == nil {
            setBackgroundImage(self.bgColor?.pixelImage, for: .normal)
        }
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
    }
}
