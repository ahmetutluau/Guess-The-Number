//
//  ResultScreenVC.swift
//  GuessTheNumber
//
//  Created by MAC on 16.07.2022.
//

import UIKit

class ResultScreenVC: UIViewController {
    @IBOutlet weak var imageViewResult: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    
    var result : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        if result! {
            labelResult.text = "Win"
            imageViewResult.image = UIImage(named: "happy_picture")
            
        }else {
            labelResult.text = "Lost"
            imageViewResult.image = UIImage(named: "sad_picture")
        }
    }
    
    @IBAction func startGameBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    

}
