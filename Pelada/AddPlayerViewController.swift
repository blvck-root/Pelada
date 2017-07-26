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
                print("Camera not found.")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        player.picture = info[UIImagePickerControllerOriginalImage] as? UIImage
        pickImageButton.clipsToBounds = true
        pickImageButton.setImage(image, for: .normal)
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "save" {
                    
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

                player.initial = initialTextField.text ?? ""
                player.position = position
                player.foot = foot
                player.rating = rating
//                player.picture = pickImageButton.image(for: .normal)
                let listPlayersViewController = segue.destination as! ListPlayersViewController
            
                listPlayersViewController.players.append(player)
                
                print("Save button tapped")
            }
        }
    }
}

