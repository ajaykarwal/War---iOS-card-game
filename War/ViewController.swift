//
//  ViewController.swift
//  War
//
//  Created by Ajay Karwal on 29/06/2016.
//  Copyright © 2016 AjayKarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var enemyScoreLabel: UILabel!
    
    var playerScore:Int = 0
    var enemyScore:Int = 0

    var cardsArray:[String] = ["card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king", "ace"]

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.playRoundButton.setTitle("Deal", forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playRoundTapped(sender: UIButton) {
        
        // Set random numbers
        let randomNumber1 = Int(arc4random_uniform(13))
        let randomNumber2 = Int(arc4random_uniform(13))
        
        // Use the random number to select a card number
        let firstRandomCard:String = self.cardsArray[randomNumber1]
        let secondRandomCard:String = self.cardsArray[randomNumber2]
        
        // Assign the random card image to each UIImageView
        self.firstCardImageView.image = UIImage(named: firstRandomCard)
        self.secondCardImageView.image = UIImage(named: secondRandomCard)
        
        
        // Determine the winning card
        if (randomNumber1 > randomNumber2) {
            playerScore += 1
            playerScoreLabel.text = String(self.playerScore)
        }
        else if (randomNumber1 < randomNumber2) {
            enemyScore += 1
            enemyScoreLabel.text = String(self.enemyScore)
        }
        else {
            // Draw
        }
    }
    
    @IBAction func resetTapped(sender: UIButton) {
        playerScore = 0
        enemyScore = 0
        
        playerScoreLabel.text = String("0")
        enemyScoreLabel.text = String("0")
        
        firstCardImageView.image = UIImage(named: "back")
        secondCardImageView.image = UIImage(named: "back")
    }
    

}

