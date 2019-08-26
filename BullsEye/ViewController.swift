//
//  ViewController.swift
//  BullsEye
//
//  Created by Maciej Jordanek on 25.08.19.
//  Copyright © 2019 Maciej Jordanek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is now: \(currentValue)"
        let alert = UIAlertController(title: "New counter:", message: message, preferredStyle: .alert )
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        updateScore()
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }

    func updateScore() {
        var difference = 0;
        
        if (currentValue > targetValue) {
            difference = currentValue - targetValue
        }
        
        if (targetValue > currentValue) {
            difference = targetValue - currentValue
        }
        
        score = score + difference
    }
    
}
