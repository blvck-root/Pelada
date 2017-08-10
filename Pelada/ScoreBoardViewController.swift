//
//  ScoreBoard.swift
//  Pelada
//
//  Created by El Capitan on 7/30/17.
//  Copyright © 2017 Make School. All rights reserved.
//

//import
import UIKit
import MZTimerLabel

class ScoreBoardViewController: UIViewController {
    var score1 = 0
    var score2 = 0
    let coinOptions = [#imageLiteral(resourceName: "heads-1"), #imageLiteral(resourceName: "tails")]
    var interval: TimeInterval = 0
    var firstHalf = true
    var secondHalf = false
    var transition = CATransform3DMakeRotation(CGFloat(4.0*Double.pi), 0.0, 1.0, 0.0)
    
    
    @IBOutlet weak var scoreA: UIButton!
    @IBOutlet weak var scoreB: UIButton!
    @IBOutlet weak var flipCoinButton: UIButton!
    @IBOutlet weak var periodButton: UIButton!
    @IBOutlet weak var timerLabel: MZTimerLabel!
    @IBOutlet weak var backButton: UIButton!
    //@IBOutlet weak var timePicker: UIPickerView!

    
    @IBAction func coinFLip(_ sender: UIButton) {
        //simple coin flip
        sender.setTitle("", for: .normal)
        let ranIndex = Int(arc4random_uniform(UInt32(2)))
        
        flipCoinButton.clipsToBounds = true
//        flipCoinButton.layer.masksToBounds = true
//        flipCoinButton.layer.cornerRadius = 85
        flipCoinButton.setImage(coinOptions[ranIndex], for: .normal)

        UIView.transition(with: flipCoinButton, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: nil)

        
    }
    
    @IBAction func scoreACount(_ sender: UIButton) {
        score1 = score1 + 1
        sender.setTitle("\(score1)", for: .normal)
    }
    
    @IBAction func scoreBCount(_ sender: UIButton) {
        score2 = score2 + 1
        sender.setTitle("\(score2)", for: .normal)
    }
    
    @IBAction func timerControl(_ sender: UIButton) {
        if sender.title(for: .normal) == "START" {
            timerLabel.start()
            sender.setTitle("PAUSE", for: .normal)
        } else if sender.title(for: .normal) == "PAUSE" {
            sender.setTitle("RESUME", for: .normal)
            timerLabel.pause()
        } else if sender.title(for: .normal) == "RESUME" {
            timerLabel.start()
            sender.setTitle("PAUSE", for: .normal)
        }
    }

    
    @IBAction func swipeButtonA(_ sender: UISwipeGestureRecognizer) {
        if score1 > 0 {
            score1 = score1 - 1
        }
        scoreA.setTitle("\(score1)", for: .normal)
        
    }
    
    @IBAction func swipeButtonB(_ sender: UISwipeGestureRecognizer) {
        if score2 > 0 {
          score2 = score2 - 1
        }
        scoreB.setTitle("\(score2)", for: .normal)
        
    }
    
    @IBAction func resetScore(_ sender: UIButton) {
        score1 = 0
        score2 = 0
        scoreA.setTitle("\(score1)", for: .normal)
        scoreB.setTitle("\(score2)", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
        
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        timerLabel.delegate = self
        timerLabel.timerType = MZTimerLabelTypeTimer
        timerLabel.timeFormat = "mm:ss"
        timerLabel.resetTimerAfterFinish = true
        timerLabel.setCountDownTime(interval*60)
        backButton.setImage(#imageLiteral(resourceName: "icons8-Down Button Filled-50"), for: .normal)
    
        
    }
    
    @IBAction func unwindToScoreBoardViewController(_ segue: UIStoryboardSegue) {
        
    }
}

extension ScoreBoardViewController: MZTimerLabelDelegate {
    func timerLabel(_ timerLabel: MZTimerLabel!, finshedCountDownTimerWithTime countTime: TimeInterval) {
        //timerLabel.pause()
        if firstHalf {
            timerLabel.setCountDownTime(interval*60)
            let alert = UIAlertController(title: "HALF TIME", message: "\(score1) : \(score2)", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Game On!", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            firstHalf = false
            secondHalf = true
            
            periodButton.setTitle("START", for: .normal)
        } else if secondHalf {
            timerLabel.setCountDownTime(0)
            let alert = UIAlertController(title: "FINAL SCORE", message: "\(score1) : \(score2)", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Nice Play!", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            periodButton.setTitle("FINAL TIME", for: .normal)
            secondHalf = false
            
        }
        
    }
}

/*
 var transition = CATransition.animation()
 transition.startProgress = 0
 transition.endProgress = 1.0
 transition.type = "flip"
 transition.subtype = "fromRight"
 transition.duration = 0.3
 transition.repeatCount = 2
 yourView.layer.add(transition, forKey: "transition")
 */
