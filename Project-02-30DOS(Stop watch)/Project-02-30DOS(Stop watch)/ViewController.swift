//
//  ViewController.swift
//  Project-02-30DOS(Stop watch)
//
//  Created by Naveen Naidu  on 15/06/17.
//  Copyright © 2017 Naveen Naidu . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    var Counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.default
    }
    
    override func viewDidLoad() {
        timeLabel.text = String(Counter)
        super.viewDidLoad()
    }
    
    @IBOutlet weak var timeLabel: UILabel!

    @IBAction func resetBtn(_ sender: Any) {
        timer.invalidate()
        isPlaying = false
        Counter = 0
        timeLabel.text = String(Counter)
        startBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    @IBAction func startButtonDidTouch(_ sender: Any) {
        if isPlaying {
            return
        }
        startBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    @IBAction func pauseButtonDidTouch(_ sender: Any) {
        startBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    
    func updateTimer(){
        Counter += 0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }
}

