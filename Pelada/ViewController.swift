//
//  ViewController.swift
//  Pelada
//
//  Created by El Capitan on 7/18/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerTableViewCell", for: indexPath as IndexPath) as! PlayerTableViewCell

       
        
        
        return cell
    }
    
    let row = 1
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return row
    }
    
    func addPlayer() {
        let row = self.row + 1
        
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

/*
 [self performSegueWithIdentifier: @"done" sender: self];
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"done"])
    {
        //    [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
        //    [[segue destinationViewController] setSelectedClient:selectedClient];
    }
}

*/

