//
//  SetTimerViewController.swift
//  Pelada
//
//  Created by El Capitan on 8/7/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit

class SetTimerViewController: UIViewController {
    @IBOutlet weak var timePicker: UIPickerView!
    
    var pickerData = [String]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timePicker.delegate = self
        self.timePicker.dataSource = self
        
        //MARK: Delegate
        pickerData = ["45", "40", "35", "30", "25", "20", "15", "10", "5"]
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "play" {
            let destinationViewController = segue.destination as! ScoreBoardViewController
            
            let indexPath = timePicker.selectedRow(inComponent: 0)
            let time = pickerData[indexPath]
            //let timeInDoouble = Double(
            destinationViewController.interval = TimeInterval(time)!
        }
    }
    
        
    
    @IBAction func unwindToSetTimerViewController(_ segue: UIStoryboardSegue) {
        
    }
}

extension SetTimerViewController: UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

}

extension SetTimerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        //timerLabel.reloadInputViews()
        //pickerView.isHidden = true
    }
}
