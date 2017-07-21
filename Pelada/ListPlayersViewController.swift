//
//  ViewController.swift
//  Pelada
//
//  Created by El Capitan on 7/18/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ListPlayersViewController: UIViewController, UITableViewDataSource {
    var players = [Player]()

    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerTableViewCell", for: indexPath as IndexPath) as! PlayerTableViewCell
    
    let row = indexPath.row
    
    let player = players[row]
    
    cell.initials.text = player.initial
    cell.positionLabel.text = player.position
    cell.preferredFootLabel.text = player.foot
    cell.ratingLabel.text = String(player.rating)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return players.count
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


