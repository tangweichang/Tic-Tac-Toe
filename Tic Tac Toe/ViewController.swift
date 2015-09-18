//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by TangWeichang on 8/10/15.
//  Copyright © 2015 TangWeichang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 1 = noughts and 2 = crosses
    
    var activePlayer = 1
    var gameActive = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var playAgainButtion: UIButton!
    
    @IBAction func palyAgainPressed(sender: AnyObject) {
        // Reset everything
        activePlayer = 1
        gameActive = true
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        var button : UIButton
        for var i = 1; i < 10; i++ {
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        gameOverLabel.hidden = true
        
        playAgainButtion.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400 , gameOverLabel.center.y)
        
        playAgainButtion.center = CGPointMake(playAgainButtion.center.x - 400 , playAgainButtion.center.y)

        
    }
    
    @IBOutlet var button: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        if gameState[sender.tag - 1] == 0 && gameActive == true {
            var image = UIImage()
            gameState[sender.tag - 1] = activePlayer
            
            if activePlayer == 1 {
                image = UIImage(named: "nought.png")!
                activePlayer = 2
            } else {
                image = UIImage(named: "cross.png")!
                activePlayer = 1
            }
            
            sender.setImage(image, forState:  .Normal)
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    var labelText = "Nought has won!"
                    if gameState[combination[0]] == 2 {
                        labelText = "Crosses has won!"
                    }
                    gameOverLabel.text = labelText
                    
                    gameOverLabel.hidden = false
                    playAgainButtion.hidden = false
                    
                    UIView.animateWithDuration(0.2, animations: { () -> Void in
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400 , self.gameOverLabel.center.y)
                        
                        self.playAgainButtion.center = CGPointMake(self.playAgainButtion.center.x + 400 , self.playAgainButtion.center.y)
                    })
                    gameActive = false
                    
                }
                
            }
            
           

        }
        
        
    } // Connect every button with this action and change the button to sender
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameOverLabel.hidden = true
        
        playAgainButtion.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400 , gameOverLabel.center.y)
        
        playAgainButtion.center = CGPointMake(playAgainButtion.center.x - 400 , playAgainButtion.center.y)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Created but not on the screen
    override func viewDidLayoutSubviews() {
        
    }

}

