//
//  GuessScreenVC.swift
//  GuessTheNumber
//
//  Created by MAC on 16.07.2022.
//

import UIKit

class GuessScreenVC: UIViewController {

    @IBOutlet weak var labelRemainedChance: UILabel!
    @IBOutlet weak var labelHelp: UILabel!
    @IBOutlet weak var requestText: UITextField!
    
    
    var randomNumber : Int?
    var remainedChance = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomNumber = Int.random(in: 0...100)
        print("random number : \(randomNumber!)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let recievedData = sender as? Bool {
            let destinationVC = segue.destination as! ResultScreenVC
            destinationVC.result = recievedData
        }
    }
    
    @IBAction func guessBtn(_ sender: Any) {
        labelHelp.isHidden = false
        remainedChance -= 1
        
        if let data = requestText.text {
            if let guess = Int(data) {
                if guess == randomNumber! {
                    let result = true
                    performSegue(withIdentifier: "guessToResultScreen", sender: result)
                    return
                }
                if guess > randomNumber! {
                    labelHelp.text = "Decrease"
                    labelRemainedChance.text = "Remained Chance : \(remainedChance)"
                }
                if guess < randomNumber! {
                    labelHelp.text = "Increase"
                    labelRemainedChance.text = "Remained Chance : \(remainedChance)"
                }
                if remainedChance == 0 {
                    let result = false
                    performSegue(withIdentifier: "guessToResultScreen", sender: result)
                }
                
                requestText.text = ""
            }
        }
            
    }
    
}
