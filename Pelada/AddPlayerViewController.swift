//
//  AddPlayerViewController.swift
//  Pelada
//
//  Created by El Capitan on 7/20/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController {
    var player: Player?
    @IBOutlet weak var initialTextField: UITextField!
    @IBOutlet weak var positionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var preferredFootSegmentedControl: UISegmentedControl!
    @IBOutlet weak var skillsRatingSegCtrl: UISegmentedControl!
    
    
    
    @IBAction func pickImage(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "save" {
                    
                    //initialTextField.text = player.initial
                    
                    var position = ""
                    
                    switch positionSegmentedControl.selectedSegmentIndex {
                    case 0:
                        position = "GK"
                    case 1:
                        position = "BAC"
                    case 2:
                        position = "MID"
                    case 3:
                        position = "FOR"
                    default:
                        break
                    }
                    
                    var foot = ""
                    
                    switch preferredFootSegmentedControl.selectedSegmentIndex {
                    case 0:
                        foot = "LEFT"
                    case 1:
                        foot = "RIGHT"
                    case 2:
                        foot = "BOTH"
                    default:
                        break
                    }
                    
                    var rating = 0
                    
                    
                    switch skillsRatingSegCtrl.selectedSegmentIndex {
                        
                    case 0:
                        rating = 0
                    case 1:
                        rating = 1
                    case 2:
                        rating = 2
                    case 3:
                        rating = 3
                    case  4:
                        rating = 4
                    case 5:
                        rating = 5
                    default:
                        break
                    }

                
                let player = Player()
                player.initial = initialTextField.text ?? ""
                player.position = position
                player.foot = foot
                player.rating = rating
                
                let listPlayersViewController = segue.destination as! ListPlayersViewController
                // 2
                listPlayersViewController.players.append(player)
                
                print("Save button tapped")
            }
        }
    }
}

