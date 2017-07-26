//
//  ViewController.swift
//  Pelada
//
//  Created by El Capitan on 7/18/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ListPlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var players = [Player]() {
        didSet {
            tableView.reloadData()
        }
    }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerTableViewCell", for: indexPath as IndexPath) as! PlayerTableViewCell
    
        let row = indexPath.row
    
        let player = players[row]
    
        cell.initials.text = player.initial
        cell.positionLabel.text = player.position
        cell.preferredFootLabel.text = player.foot
        cell.ratingLabel.text = String(player.rating)
        cell.playerImage.image = player.picture
        cell.playerImage.clipsToBounds = true
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "addPlayer" {
                print("+ button tapped")
            } else if identifier == "createTeam" {
                print("create-team button tapped")
                let destinationViewController = segue.destination as! DisplayTeamViewController
                destinationViewController.players = players
                if players.count % 2 != 0 {
                    let alert = UIAlertController(title: "oddPlayersAlert", message: "You have an odd number of player, please add or remove one.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    destinationViewController.createTeam(playersArray: players)
                }
            } else if identifier == "displayPlayerProfile" {
                let indexPath = tableView.indexPathForSelectedRow!
                
                let player = players[indexPath.row]
                
                let addPlayerViewController = segue.destination as! AddPlayerViewController
                
                addPlayerViewController.player = player
            }
        }
}

    

    @IBAction func unwindToListPlayersViewController(_ segue: UIStoryboardSegue) {
    
    }
    
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
}


