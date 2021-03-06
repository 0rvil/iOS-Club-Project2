//
//  ViewController.swift
//  Project2
//
//  Created by student on 4/24/20.
//  Copyright © 2020 Orvil Billionaire club. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    
    var score = 0
    var countries = [String]()
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","us","uk"]
        Button1.layer.borderWidth = 1
        Button2.layer.borderWidth = 1
        Button3.layer.borderWidth = 1
        
        Button1.layer.borderColor = UIColor.lightGray.cgColor
        Button2.layer.borderColor = UIColor.lightGray.cgColor
        Button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
   
}
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        
        
        
        Button1.setImage(UIImage(named: countries[0]), for:.normal )
        Button2.setImage(UIImage(named: countries[1]), for:.normal )
        Button3.setImage(UIImage(named: countries[2]), for:.normal )
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title:String
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac,animated: true)
        
    }
    

}
