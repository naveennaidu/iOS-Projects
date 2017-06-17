//
//  ViewController.swift
//  Project-04-100DOS(Tap or Hold Counter)
//
//  Created by Naveen Naidu  on 16/06/17.
//  Copyright © 2017 Naveen Naidu . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countNumber: UILabel!
    @IBOutlet weak var tapOrHoldButton: UIButton!
    
    var counter = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnce(_:)))
        let holdGestrue = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapOrHoldButton.addGestureRecognizer(tapGesture)
        tapOrHoldButton.addGestureRecognizer(holdGestrue)
        
        updateCountNumber()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapOnce(_ sender: UIGestureRecognizer) {
        
        counter += 1
        updateCountNumber()
    }
    
    func longTap(_ sender: UIGestureRecognizer) {
        if sender.state == .ended {
            timer.invalidate()
        } else if sender.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(countNumberPlusOne), userInfo: nil, repeats: true)
        }
    }
    
    func countNumberPlusOne() {
        counter += 1
        updateCountNumber()
    }
    
    
    
    func updateCountNumber() {
        countNumber.text = String(counter)
    }
    
    @IBAction func resetCountNumber(_ sender: AnyObject) {
        counter = 0
        updateCountNumber()
    }
    
}
