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
    var goalies = [Player]()
    var defenders = [Player]()
    var midfielders = [Player]()
    var strikers = [Player]()
    var outliers = [Player]()
    
    var indexA: Int?
    var indexB: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamATableView.tag = 0
        teamBTableView.tag = 1
    }
    
    func createTeam(playersArray:[Player]){
        
        var sortedPlayers = players.sorted(by: {$0.rating > $1.rating})
        
        func summedPlayerRatings(playersArray: [Player]) -> Int {
            return playersArray.reduce(0, { $0 + $1.rating})
        }
        
        for player in sortedPlayers {
            if player.position == "GK" {
                goalies.append(player)
                
            } else if player.position == "BAC" {
                defenders.append(player)
                
            } else if player.position == "MID" {
                midfielders.append(player)
            } else {
                strikers.append(player)
            }
        }
        
        func secondSort( playersArr: [Player]) {
            var playersAr = playersArr
            
            if (playersAr.count)%2 != 0 {
                let outlierIndex = (playersAr.count-1)/2
                outliers.append(playersAr[outlierIndex])
                playersAr.remove(at: outlierIndex)
            }
            
            for i in 0..<(playersAr.count/2) {
                        if playersAr.count == 2 && teamA.count == teamB.count {
                            if summedPlayerRatings(playersArray: teamA) >= summedPlayerRatings(playersArray: teamB){
                                teamB.append(playersArr[0])
                                playersAr.remove(at: 0)
                                teamA.append(playersArr.last!)
                                playersAr.remove(at: 0)
                            } else {
                                teamA.append(playersArr[0])
                                playersAr.remove(at: 0)
                                teamB.append(playersArr.last!)
                                playersAr.remove(at: 0)
                            }
            
            
                        } else if i%2 == 0{
                            teamA.append(playersAr[0])
                            playersAr.remove(at: 0)
                            teamA.append(playersAr[playersAr.count-1])
                            playersAr.remove(at: playersAr.count-1)
                        } else if i%2 != 0 {
                            teamB.append(playersAr[0])
                            playersAr.remove(at: 0)
                            teamB.append(playersArr[playersAr.count-1])
                            playersAr.remove(at: playersAr.count-1)
                        }
                    }
        }
        
        func sortOutliers() {
            var sortedOutliers = outliers.sorted(by: {$0.rating > $1.rating})
            if sortedOutliers.count%2 == 0 {
                for i in 0..<(sortedOutliers.count/2) {
                    if sortedOutliers.count == 2 && teamB.count == teamA.count {
                        if summedPlayerRatings(playersArray: teamA) >= summedPlayerRatings(playersArray: teamB){
                            teamB.append(sortedOutliers[0])
                            sortedOutliers.remove(at: 0)
                            teamA.append(sortedOutliers.last!)
                            sortedOutliers.remove(at: 0)
                        } else {
                            teamA.append(sortedOutliers[0])
                            sortedOutliers.remove(at: 0)
                            teamB.append(sortedOutliers.last!)
                            sortedOutliers.remove(at: 0)
                        }
                        
                        
                    } else if i%2 == 0 {
                        if summedPlayerRatings(playersArray: teamA) <= summedPlayerRatings(playersArray: teamB) {
                            teamA.append(sortedOutliers[0])
                            sortedOutliers.remove(at: 0)
                            teamA.append(sortedOutliers[sortedOutliers.count-1])
                            sortedOutliers.remove(at: sortedOutliers.count-1)
                        } else {
                            teamB.append(sortedOutliers[0])
                            sortedOutliers.remove(at: 0)
                            teamB.append(sortedOutliers[sortedOutliers.count-1])
                            sortedOutliers.remove(at: sortedOutliers.count-1)
                        }
                        
                   } else if i%2 != 0 {
                        if summedPlayerRatings(playersArray: teamA) >= summedPlayerRatings(playersArray: teamB) {
                            teamB.append(sortedOutliers[0])
                            sortedOutliers.remove(at: 0)
                            teamB.append(sortedOutliers[sortedOutliers.count-1])
                            sortedOutliers.remove(at: sortedOutliers.count-1)
                        } else {
                            teamA.append(sortedOutliers[0])
                            sortedOutliers.remove(at: 0)
                            teamA.append(sortedOutliers[sortedOutliers.count-1])
                            sortedOutliers.remove(at: sortedOutliers.count-1)
                        }
                    }
                }

            } else {
                
            }
        }
        
        secondSort(playersArr: goalies)
        secondSort(playersArr: defenders)
        secondSort(playersArr: midfielders)
        secondSort(playersArr: strikers)
        sortOutliers()
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
    
    @IBAction func swapPlayers(_ sender: UIButton) {
        if indexA != nil && indexB != nil {
            let teamSwapper = teamA[indexA!]
            teamA[indexA!] = teamB[indexB!]
            teamB[indexB!] = teamSwapper
            
            
            teamATableView.reloadData()
            teamBTableView.reloadData()
            //teamA[indexA!] = teamB[indexB!]; teamB[indexB!] = teamA[indexA!]
            print("Swap button tapped!")
            
        }
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
            cell.playerImage.image = player.picture
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "teamBTableViewCell", for: IndexPath as IndexPath) as! TeamBTableViewCell
            
            let row = IndexPath.row
            
            let player = teamB[row]
            
            cell.playerInitialsB.text = player.initial
            cell.preferredPositonB.text = player.position
            cell.playerImageB.image = player.picture
            
            return cell
        }
        //tableView.reloadData()
    }
    
}

extension DisplayTeamViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 0 {
            if indexA != nil && indexA == indexPath.row {
                    indexA = nil
                    tableView.deselectRow(at: indexPath as IndexPath, animated: true)
            } else {
                indexA = indexPath.row
            }
        } else if tableView.tag == 1 {
            if indexB != nil && indexB == indexPath.row {
                    indexB = nil
                    tableView.deselectRow(at: indexPath as IndexPath, animated: true)
            } else {
                indexB = indexPath.row
            }
        }
        //tableView.reloadData()
    }
}
