//
//  ViewController.swift
//  RMFloatingAction
//
//  Created by Roger Molas on 09/03/2018.
//  Copyright © 2018 Roger Molas. All rights reserved.
//

import UIKit
import RMFloatingAction

class ViewController: UIViewController {
    
    @IBAction func upRight(_ sender: UIButton) {
        let buttons = [
            RMFloatingButton(title: "1", image: #imageLiteral(resourceName: "closeButton")),
            RMFloatingButton(title: "2", image: #imageLiteral(resourceName: "closeButton")),
            RMFloatingButton(title: "3", image: #imageLiteral(resourceName: "closeButton"))]
        let floatingVc = RMFloatingViewController(buttons: buttons, fromView: sender)
        floatingVc.delegate = self
        floatingVc.setDirection(button: .up, label: .right)
        self.present(floatingVc, animated: true, completion: nil)
    }
    
    @IBAction func upLeft(_ sender: UIButton) {
        let buttons = [
            RMFloatingButton(title: "1", image: UIImage(named: "closeButton")),
            RMFloatingButton(title: "2", image: #imageLiteral(resourceName: "closeButton")),
            RMFloatingButton(title: "3", image: #imageLiteral(resourceName: "closeButton"))]
        let floatingVc = RMFloatingViewController(buttons: buttons, fromView: sender)
        floatingVc.delegate = self
        floatingVc.setDirection(button: .up, label: .left)
        self.present(floatingVc, animated: true, completion: nil)
    }
    
    @IBAction func downLeft(_ sender: UIButton) {
        let buttons = [
            RMFloatingButton(title: "Name: 1", backgroundColor: UIColor.red),
            RMFloatingButton(title: "Name: 2", backgroundColor: UIColor.green),
            RMFloatingButton(title: "Name: 3", backgroundColor: UIColor.blue)]
        
        let floatingVc = RMFloatingViewController(buttons: buttons, fromView: sender)
        floatingVc.delegate = self
        floatingVc.setDirection(button: .down, label: .left)
        self.present(floatingVc, animated: true, completion: nil)
    }
    
    @IBAction func downRight(_ sender: UIButton) {
        let buttons = [
            RMFloatingButton(title: "Name: 1", backgroundColor: UIColor.red),
            RMFloatingButton(title: "Name: 2", backgroundColor: UIColor.green),
            RMFloatingButton(title: "Name: 3", backgroundColor: UIColor.blue)]
        
        let floatingVc = RMFloatingViewController(buttons: buttons, fromView: sender)
        floatingVc.delegate = self
        floatingVc.setDirection(button: .down, label: .right)
        self.present(floatingVc, animated: true, completion: nil)
    }
    
    @IBAction func midRight(_ sender: UIButton) {
        let buttons = [
            RMFloatingButton(title: "1", image: #imageLiteral(resourceName: "closeButton")),
            RMFloatingButton(title: "2", image: #imageLiteral(resourceName: "closeButton")),
            RMFloatingButton(title: "3", image: #imageLiteral(resourceName: "closeButton"))]
        let floatingVc = RMFloatingViewController(buttons: buttons, fromView: sender)
        floatingVc.delegate = self
        floatingVc.setDirection(button: .right, label: .down)
        self.present(floatingVc, animated: true, completion: nil)
    }
    
    @IBAction func midLeft(_ sender: UIButton) {
        let buttons = [
            RMFloatingButton(title: "1", image: #imageLiteral(resourceName: "closeButton")),
            RMFloatingButton(title: "2", image: #imageLiteral(resourceName: "closeButton")),
            RMFloatingButton(title: "3", image: #imageLiteral(resourceName: "closeButton"))]
        let floatingVc = RMFloatingViewController(buttons: buttons, fromView: sender)
        floatingVc.delegate = self
        floatingVc.setDirection(button: .left, label: .up)
        self.present(floatingVc, animated: true, completion: nil)
    }
}

extension ViewController: RMFloatingViewDelegate {
    func didTap(button: RMFloatingButton, At index: Int) {
        print(index)
    }
    
    func didClose(controller: RMFloatingViewController) {
        print("close")
    }
}
