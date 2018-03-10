/*
 RMFloatingViewController.swift
 
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

public enum RMFloatingDirection {
    case up
    case down
    case left
    case right
    func offsetPoint(point: CGPoint, offset: CGFloat) -> CGPoint {
        switch self {
        case .up:
            return CGPoint(x: point.x, y: point.y - offset)
        case .down:
            return CGPoint(x: point.x, y: point.y + offset)
        case .left:
            return CGPoint(x: point.x - offset, y: point.y)
        case .right:
            return CGPoint(x: point.x + offset, y: point.y)
        }
    }
}

public protocol RMFloatingViewDelegate: NSObjectProtocol {
    func didTap(button: RMFloatingButton, At index: Int)
    func didClose(controller: RMFloatingViewController)
}

open class RMFloatingViewController : UIViewController {
    var closeButton: RMFloatingButton? = nil
    
    internal let fromView: UIView
    private let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    internal var buttonPadding: CGFloat = 70
    internal var buttonDirection = RMFloatingDirection.up
    private var labelDirection = RMFloatingDirection.left
    private var buttonItems = [RMFloatingButton]()
    private var buttonLabels = [UILabel]()
    
    public weak var delegate: RMFloatingViewDelegate? = nil
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIViewController
    public init(buttons: [RMFloatingButton], fromView: UIView) {
        self.fromView = fromView
        self.buttonItems = buttons
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    public func setDirection(button: RMFloatingDirection, label: RMFloatingDirection) {
        self.buttonDirection = button
        self.labelDirection = label
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        blurredView.frame = view.bounds
        view.addSubview(blurredView)
        
        if closeButton == nil {
            closeButton = RMFloatingButton(title: nil, backgroundColor: UIColor.red)
        }
        view.addSubview(closeButton!)

        for button in buttonItems {
            view.addSubview(button)
            if button.title != "" {
                let label = getLabel(title: button.title!)
                view.addSubview(label)
                buttonLabels.append(label)
            } else {
                let label = UILabel(frame: CGRect.zero)
                buttonLabels.append(label)
            }
            
        }
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateButtons(visible: true)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        animateButtons(visible: false)
    }
    
    private func getLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica Regular", size: 15)
        label.backgroundColor = UIColor.gray
        label.sizeToFit()
        label.bounds.size.height += 8
        label.bounds.size.width += 20
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        return label
    }
    
    private func animateButtons(visible: Bool) {
        configureButtons(initial: visible)
        UIView.animate(withDuration: 0.4, delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0,
                       options: .allowAnimatedContent,
                       animations: {
            self.configureButtons(initial: !visible)
        }, completion: nil)
    }
    
    private func configureButtons(initial: Bool) {
        let parentController = presentingViewController!
        let center = parentController.view.convert(fromView.center, from: fromView.superview)
        closeButton?.center = center
        closeButton?.addTarget(self, action: #selector(closeAction(_:)), for: .touchUpInside)
        
        for (index, button) in buttonItems.enumerated() {
            button.center = buttonDirection.offsetPoint(point: center, offset: buttonPadding * CGFloat(index+1))
        }
        
        if initial {
            closeButton?.alpha = 0
            closeButton?.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            for (index, button) in buttonItems.enumerated() {
                button.center = center
                button.alpha = 0
                button.index = index
                button.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                button.addTarget(self, action: #selector(didTap(button:)), for: .touchUpInside)
                
                let label = buttonLabels[index]
                let buttonCenter = buttonDirection.offsetPoint(point: center, offset: buttonPadding * CGFloat(index+1))
                let labelSize = labelDirection == .up || labelDirection == .down ? label.bounds.height : label.bounds.width
                let labelCenter = labelDirection.offsetPoint(point: buttonCenter, offset: buttonPadding/2 + labelSize)
                label.center = labelCenter
                label.alpha = 0
            }
        } else {
            closeButton?.alpha = 1
            closeButton?.transform = CGAffineTransform.identity
            for (index, button) in buttonItems.enumerated() {
                button.center = buttonDirection.offsetPoint(point: center, offset: buttonPadding * CGFloat(index+1))
                button.index = index
                button.alpha = 1
                button.transform = CGAffineTransform.identity
                button.addTarget(self, action: #selector(didTap(button:)), for: .touchUpInside)
                
                let label = buttonLabels[index]
                let buttonCenter = buttonDirection.offsetPoint(point: center, offset: buttonPadding * CGFloat(index+1))
                let labelSize = labelDirection == .up || labelDirection == .down ? label.bounds.height : label.bounds.width
                let labelCenter = labelDirection.offsetPoint(point: buttonCenter, offset: buttonPadding/2 + labelSize/2)
                label.center = labelCenter
                label.alpha = 1
            }
        }
    }
    
    @objc private func didTap(button: RMFloatingButton) {
        delegate?.didTap(button: button, At: button.index)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func closeAction(_ sender: UIButton) {
        delegate?.didClose(controller: self)
        self.dismiss(animated: true, completion: nil)
    }
}
