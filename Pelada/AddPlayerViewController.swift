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
        // 1
        if let player = player {
            initialTextField.text = player.initial
            
            var position = ""
            
            switch positionSegmentedControl.selectedSegmentIndex{
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
            //        contactSurnameTextField.text = contact.lastName
            //        phoneNumberTextField.text = contact.phoneNumber
            //        emailTextField.text = contact.emailAddress
            //        locationTextField.text = contact.city
            //
            //    } else {
            //        // 3
            //        contactNameTextField.text = ""
            //        contactSurnameTextField.text = ""
            //        phoneNumberTextField.text = ""
            //        emailTextField.text = ""
            //        locationTextField.text = ""
            //    }
            //}
            //
            //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //    //let listNotesTableViewController = segue.destination as! ListNotesTableViewController
            //    if segue.identifier == "save" {
            //        let contact = self.contact ?? CoreDataHelper.newContact()
            //
            //        contact.firstName = contactNameTextField.text ?? ""
            //        contact.city = locationTextField.text ?? ""
            //        contact.emailAddress = emailTextField.text ?? ""
            //        contact.lastName = contactSurnameTextField.text ?? ""
            //        contact.phoneNumber = phoneNumberTextField.text ?? ""
            //        CoreDataHelper.saveContact()
        }
    }
}

