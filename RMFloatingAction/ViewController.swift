//
//  ViewController.swift
//  RMFloatingAction
//
//  Created by Roger Molas on 09/03/2018.
//  Copyright © 2018 Roger Molas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapMenuUp(_ sender: UIButton) {
        let buttons = [
            RMFloatingButton(title: "Chris", image: UIColor.red.pixelImage),
            RMFloatingButton(title: nil, image: UIColor.green.pixelImage),
            RMFloatingButton(title: "Ariel", image: UIColor.blue.pixelImage)]
        let floatingVc = RMFloatingViewController(buttons: buttons, fromView: sender)
        floatingVc.delegate = self
        floatingVc.labelDirection = .Right
        floatingVc.buttonDirection = .Up
        self.present(floatingVc, animated: true, completion: nil)
    }
    
    @IBAction func didTapMenuDown(_ sender: UIButton) {
        let buttons = [
            RMFloatingButton(title: "Chris", backgroundColor: UIColor.red),
            RMFloatingButton(title: "Edward", backgroundColor: UIColor.green),
            RMFloatingButton(title: "Ariel", backgroundColor: UIColor.blue)]
        
        let floatingVc = RMFloatingViewController(buttons: buttons, fromView: sender)
        floatingVc.delegate = self
        floatingVc.labelDirection = .Right
        floatingVc.buttonDirection = .Down
        self.present(floatingVc, animated: true, completion: nil)
    }
}

extension ViewController: TFloatingViewDelegate {
    func didTap(button: RMFloatingButton, At index: Int) {
        print(index)
    }
    
    func didClose(controller: RMFloatingViewController) {
        print("close")
    }
}
