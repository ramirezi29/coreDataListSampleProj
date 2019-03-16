//
//  TaskTVCell.swift
//  CoreDataSaturdayProj
//
//  Created by Ivan Ramirez on 3/16/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import UIKit

// Step: Delegate 1
protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: UITableViewCell)
}

class TaskTVCell: UITableViewCell {
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    let completeImage = UIImage(named: "complete")
    let incompleteImage = UIImage(named: "inComplete")
    
    // Step: Delegate 2
    var buttonDelegate: ButtonTableViewCellDelegate?
    
    var task: Task? {
        didSet {
            updateCell()
        }
    }
    
    func updateCell() {
        guard let task = task else {return}
        taskNameLabel.text = task.name
        
        //Button
        updateButton()
    }
    
    func updateButton() {
        switch task?.isComplete {
        case false:
            isCompleteButton.setImage(completeImage, for: .normal)
            task?.isComplete = true
        default:
            isCompleteButton.setImage(incompleteImage, for: .normal)
            task?.isComplete = false
        }
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: Any) {
        // Step: Delegate 3
        // NOTE: - Method gets called when we tapp the button 
        buttonDelegate?.buttonCellButtonTapped(self)
    }
}
