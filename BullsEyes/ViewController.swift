//
//  ViewController.swift
//  BullsEyes
//
//  Created by Sahadat  Hossain on 11/10/18.
//  Copyright © 2018 Sahadat  Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue : Int = 0
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var lblRandomNumber : UILabel!
    var randomNumber : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRandomNumber()
        updateLbl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRandomNumber () {
        randomNumber = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    @IBAction func slideMoved ( _ slider : UISlider){
        
        currentValue = lroundf(slider.value)
        
    }

    @IBAction func showAlert (){
        
        var different : Int
        if currentValue > randomNumber {
            different = currentValue - randomNumber
        }else if currentValue < randomNumber {
            different = randomNumber - currentValue
        }else{
            different = 0
        }
        
        let message = "Current value is : \(currentValue)" + "\nRandom Value \(randomNumber)" + "\nThe differnt is \(different)"
        let alert = UIAlertController(title: "This is Alert Title", message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Good Job", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
        startNewRandomNumber()
        updateLbl()
    }
    func updateLbl() {
        lblRandomNumber.text = String(randomNumber)
    }
    
    @IBAction func showInfo (){
        let alert = UIAlertController(title: "Information", message: "Bull's Eye is a simple game. which is developed by Md Sahadat.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

