# RMFloatingAction

[![Build Status](https://travis-ci.org/rogermolas/RMFloatingAction.svg?branch=master)](https://travis-ci.org/rogermolas/RMFloatingAction)
![Status](https://img.shields.io/badge/status-active-brightgreen.svg?style=flat) [![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)](https://github.com/rogermolas/RMSpriteButton/blob/master/LICENSE)
[![Contact](https://img.shields.io/badge/contact-@roger_molas-yellowgreen.svg?style=flat)](https://twitter.com/roger_molas)

RMFloatingAction is a Android like floating action button, support both custom backgoround image and color.

![Demo](https://github.com/rogermolas/RMFloatingAction/blob/master/Demo.gif)

## Installation

RMFloatingAction is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RMFloatingAction"
```

### Using background image
```swift
let buttons = [
    RMFloatingButton(title: "1", image:  UIImage(named: "closeButton")),
    RMFloatingButton(title: "2", image:  UIImage(named: "closeButton")),
    RMFloatingButton(title: "3", image:  UIImage(named: "closeButton"))]
let floatingVc = RMFloatingViewController(buttons: buttons, fromView: sender)
floatingVc.delegate = self
floatingVc.setDirection(button: .up, label: .left)
self.present(floatingVc, animated: true, completion: nil)
```

### Using background color
```swift
let buttons = [
    RMFloatingButton(title: "Name: 1", backgroundColor: UIColor.red),
    RMFloatingButton(title: "Name: 2", backgroundColor: UIColor.green),
    RMFloatingButton(title: "Name: 3", backgroundColor: UIColor.blue)]
let floatingVc = RMFloatingViewController(buttons: buttons, fromView: sender)
floatingVc.delegate = self
floatingVc.setDirection(button: .down, label: .right)
self.present(floatingVc, animated: true, completion: nil)
```
All buttons and labels can use positioning options ( e.g.  `up`, `down`,` left`, `right`) that defined in public enum `RMFloatingDirection`

## Author

rogermolas, contact@rogermolas.com

## License

The MIT License (MIT)

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
