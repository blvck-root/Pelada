//
//  AddPlayerViewController.swift
//  Pelada
//
//  Created by El Capitan on 7/20/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var player: Player = Player()
    var editingPlayer: Bool = false
    
    @IBOutlet weak var initialTextField: UITextField!
    @IBOutlet weak var positionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var preferredFootSegmentedControl: UISegmentedControl!
    @IBOutlet weak var skillsRatingSegCtrl: UISegmentedControl!
    @IBOutlet weak var pickImageButton: UIButton!
    
    
    @IBAction func pickImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose Image Source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Camera Not Found!", message: "Please check your phone settings & enable camera.", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "Cool", style: UIAlertActionStyle.default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        actionSheet.addAction(UIAlertAction(title: "Remove", style: .destructive, handler: { (action: UIAlertAction) in
            self.player.picture = #imageLiteral(resourceName: "icons8-User Filled-50 (1)")
            self.pickImageButton.setImage(self.player.picture, for: .normal)
        }))

        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        player.picture = info[UIImagePickerControllerOriginalImage] as! UIImage
        pickImageButton.setImage(image, for: .normal)
        pickImageButton.clipsToBounds = true
        pickImageButton.layer.masksToBounds = true
        pickImageButton.layer.cornerRadius = pickImageButton.bounds.width/2.0
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        initialTextField.text = player.initial
        
//        if player.picture == nil {
//            player.picture = #imageLiteral(resourceName: "icons8-User Filled-50 (1)")
//            //pickImageButton.setImage(, for: .normal)
//        }
        
        pickImageButton.setImage(player.picture, for: .normal)
        pickImageButton.clipsToBounds = true
        pickImageButton.layer.masksToBounds = true
        pickImageButton.layer.cornerRadius = pickImageButton.bounds.width/2.0
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        
        view.addGestureRecognizer(tap)
        
        switch player.position {
        case "GK":
            positionSegmentedControl.selectedSegmentIndex = 0
            
        case "BAC":
            positionSegmentedControl.selectedSegmentIndex = 1
            
        case "MID":
            positionSegmentedControl.selectedSegmentIndex = 2
            
        case "FOR":
            positionSegmentedControl.selectedSegmentIndex = 3
            
        default:
            break
        }
        
        
        switch player.foot {
        case "LEFT":
                preferredFootSegmentedControl.selectedSegmentIndex = 0

        case "RIGHT":
            preferredFootSegmentedControl.selectedSegmentIndex = 1

        case "BOTH":
                preferredFootSegmentedControl.selectedSegmentIndex = 2

        default:
            break
        }
        
        
        switch player.rating {
            
        case 0:
                skillsRatingSegCtrl.selectedSegmentIndex = 0
                
        case 1:
                skillsRatingSegCtrl.selectedSegmentIndex = 1
            
        case 2:
            skillsRatingSegCtrl.selectedSegmentIndex = 2
            
        case 3:
            skillsRatingSegCtrl.selectedSegmentIndex = 3
            
        case  4:
            skillsRatingSegCtrl.selectedSegmentIndex = 4

            
        case 5:
            skillsRatingSegCtrl.selectedSegmentIndex = 5
            
        default:
            break
        }
        
        //UIsegmentedControl.sendActions(for: .valueChanged)
        
    }
    
    func dismissKeyBoard() {
        view.endEditing(true)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listPlayersViewController = segue.destination as! ListPlayersViewController
        if let identifier = segue.identifier {
            if identifier == "save" {
                    
                
                    
                    switch positionSegmentedControl.selectedSegmentIndex {
                    case 0:
                        player.position = "GK"
                    case 1:
                        player.position = "BAC"
                    case 2:
                        player.position = "MID"
                    case 3:
                        player.position = "FOR"
                    default:
                        break
                    }
                
                    
                    switch preferredFootSegmentedControl.selectedSegmentIndex {
                    case 0:
                        player.foot = "LEFT"
                        
                    case 1:
                        player.foot = "RIGHT"
                        
                    case 2:
                        player.foot = "BOTH"
                        
                    default:
                        break
                    }
                    
                
                    
                    
                    switch skillsRatingSegCtrl.selectedSegmentIndex {
                        
                    case 0:
                        player.rating = 0
                        
                    case 1:
                        player.rating = 1
                        
                    case 2:
                        player.rating = 2
                        
                    case 3:
                        player.rating = 3
                        
                    case  4:
                        player.rating = 4
                        
                    case 5:
                        player.rating = 5
                        
                    default:
                        break
                    }

                
                player.initial = initialTextField.text ?? ""
                
                if editingPlayer == false {
                    listPlayersViewController.players.append(player)
                    editingPlayer = true
                } else {
                    listPlayersViewController.tableView.reloadData()
                }
            }
        }
    }
}

extension AddPlayerViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}


