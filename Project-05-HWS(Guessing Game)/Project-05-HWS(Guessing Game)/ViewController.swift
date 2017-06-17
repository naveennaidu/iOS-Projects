//
//  ViewController.swift
//  Project-05-HWS(Guessing Game)
//
//  Created by Naveen Naidu  on 17/06/17.
//  Copyright © 2017 Naveen Naidu . All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var scoreNum: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1.layer.borderWidth = 1
        btn2.layer.borderWidth = 1
        btn3.layer.borderWidth = 1
        
        btn1.layer.borderColor = UIColor.lightGray.cgColor
        btn2.layer.borderColor = UIColor.lightGray.cgColor
        btn3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion(action: nil)

        scoreNum.text = String(score)
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        btn1.setImage(UIImage(named: countries[0]), for: .normal)
        btn2.setImage(UIImage(named: countries[1]), for: .normal)
        btn3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        
        title = countries[correctAnswer].uppercased()
    
    }

    @IBAction func btnTapped(_ sender: UIButton) {
        var name: String
        
        if sender.tag == correctAnswer{
            name = "Correct"
            score += 1
        } else {
            name = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: name, message: "Your Score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        scoreNum.text = String(score)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

