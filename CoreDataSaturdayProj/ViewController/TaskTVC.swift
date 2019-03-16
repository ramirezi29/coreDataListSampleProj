//
//  TaskTVC.swift
//  CoreDataSaturdayProj
//
//  Created by Ivan Ramirez on 3/16/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import UIKit

class TaskTVC: UITableViewController {
    
    let segueToDetail = "segueToDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  TaskController.shared.fetchResultsController.fetchedObjects?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: segueToDetail, for: indexPath) as? TaskTVCell else { return UITableViewCell() }
        
        let task = TaskController.shared.fetchResultsController.object(at: indexPath)
        
        cell.task = task
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
}
