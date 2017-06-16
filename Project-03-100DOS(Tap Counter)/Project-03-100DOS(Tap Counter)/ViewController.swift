//
//  ViewController.swift
//  Project-03-100DOS(Tap Counter)
//
//  Created by Naveen Naidu  on 16/06/17.
//  Copyright © 2017 Naveen Naidu . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countNumber: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countNumber.text = String(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func tapOnce(_ sender: UIButton) {
        countNumber.text = String(Int(countNumber.text!)! + 1)
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        countNumber.text = "0"
    }
}

