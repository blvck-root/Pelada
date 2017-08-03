//
//  ScoreBoard.swift
//  Pelada
//
//  Created by El Capitan on 7/30/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import MZTimerLabel

class ScoreBoardViewController: UIViewController {
    var score1: Int = 0
    var score2: Int = 0
    
    @IBOutlet weak var scoreA: UIButton!
    @IBOutlet weak var scoreB: UIButton!
    @IBOutlet weak var flipCoinButton: UIButton!
    @IBOutlet weak var periodButton: UIButton!
    @IBOutlet weak var timerLabel: MZTimerLabel!
    @IBOutlet weak var timerLabel2: MZTimerLabel!

    let coinOptions = [#imageLiteral(resourceName: "heads"), #imageLiteral(resourceName: "tails")]
    
    @IBAction func coinFLip(_ sender: UIButton) {
        //simple coin flip
        sender.setTitle("", for: .normal)
        let ranIndex = Int(arc4random_uniform(UInt32(2)))
        
        flipCoinButton.clipsToBounds = true
        flipCoinButton.setImage(coinOptions[ranIndex], for: .normal)
        
    }
    
    @IBAction func scoreACount(_ sender: UIButton) {
        score1 = score1 + 1
        sender.setTitle("\(score1)", for: .normal)
    }
    
    @IBAction func scoreBCount(_ sender: UIButton) {
        score2 = score2 + 1
        sender.setTitle("\(score2)", for: .normal)
    }
    
    @IBAction func period(_ sender: UIButton) {
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
        print("A swiped")
    }
    
    @IBAction func swipeButtonB(_ sender: UISwipeGestureRecognizer) {
        if score2 > 0 {
          score2 = score2 - 1
        }
        scoreB.setTitle("\(score2)", for: .normal)
        print("B swiped")
    }
    
    @IBAction func resetScore(_ sender: UIButton) {
        score1 = 0
        score2 = 0
        scoreA.setTitle("\(score1)", for: .normal)
        scoreB.setTitle("\(score2)", for: .normal)
    }
    override func viewDidLoad() {
        timerLabel.delegate = self
        timerLabel.timerType = MZTimerLabelTypeTimer
        timerLabel.timeFormat = "mm:ss"
        timerLabel.setCountDownTime(5)
        
    }
}

extension ScoreBoardViewController: MZTimerLabelDelegate {
    func timerLabel(_ timerLabel: MZTimerLabel!, finshedCountDownTimerWithTime countTime: TimeInterval) {
        periodButton.setTitle("START", for: .normal)
        
        let alert = UIAlertController(title: "HALF TIME", message: "\(score1) : \(score2)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
