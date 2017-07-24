//
//  displayTeamViewController.swift
//  Pelada
//
//  Created by El Capitan on 7/21/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class DisplayTeamViewController: UIViewController {
    @IBOutlet weak var teamATableView: UITableView!
    @IBOutlet weak var teamBTableView: UITableView!
    
    var players = [Player]()
    
    var teamA = [Player]()
    var teamB = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamATableView.tag = 0
        teamBTableView.tag = 1
    }
    
    func createTeam(playersArray:[Player]){
        var sortedPlayers = players.sorted(by: {$0.rating > $1.rating})
        
        for _ in 0..<(sortedPlayers.count/4) {
            if sortedPlayers.count == 2 {
                teamA.append(sortedPlayers[0])
                sortedPlayers.remove(at: 0)
                teamB.append(sortedPlayers.last!)
                sortedPlayers.remove(at: 0)
            } else {
                teamA.append(sortedPlayers[0])
                sortedPlayers.remove(at: 0)
                teamA.append(sortedPlayers[sortedPlayers.count-1])
                sortedPlayers.remove(at: sortedPlayers.count-1)
                teamB.append(sortedPlayers[0])
                sortedPlayers.remove(at: 0)
                teamB.append(sortedPlayers[sortedPlayers.count-1])
                sortedPlayers.remove(at: sortedPlayers.count-1)
            }
        }
        return
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if tableView.tag == 0 {
          return teamA.count
        } else {
            return teamB.count
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}

extension DisplayTeamViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt IndexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "teamATableViewCell", for: IndexPath as IndexPath) as! TeamATableViewCell
            
            let row = IndexPath.row
            
            let player = teamA[row]
            
            cell.playerInitial.text = player.initial
            cell.preferredPosition.text = player.position
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "teamBTableViewCell", for: IndexPath as IndexPath) as! TeamBTableViewCell
            
            let row = IndexPath.row
            
            let player = teamA[row]
            
            cell.playerInitialsB.text = player.initial
            cell.preferredPositonB.text = player.position
            
            return cell
        }
    }
}
