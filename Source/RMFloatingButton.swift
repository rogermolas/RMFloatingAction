/*
 RMFloatingButton.swift
 
 Copyright (c) 2018 Roger Molas
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import Foundation
import UIKit

open class RMFloatingButton: UIButton {
    private var bgColor: UIColor!
    private var localTitle: String?
    var textLabel: UILabel?
    
    var index: Int!
    var title: String? { return localTitle == nil ? "": localTitle}
    
    public convenience init(title:String?, backgroundColor: UIColor = UIColor.green) {
        self.init()
        self.localTitle = title
        self.bgColor = backgroundColor
        setBackgroundImage(backgroundColor.pixelImage, for: .normal)
    }
    
    public convenience init(title:String?, image: UIImage?) {
        self.init()
        self.localTitle = title
        setImage(image, for: .normal)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        setup()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override open func awakeFromNib() {
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
