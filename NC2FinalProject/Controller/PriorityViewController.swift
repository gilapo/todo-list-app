//
//  PriorityViewController.swift
//  NC2FinalProject
//
//  Created by Agil Sulapohan Suaga on 11/04/22.
//

import UIKit

protocol AddPriorityDelegate {
    func addPrirority(label:String, value:Int)
}

struct Priorities{
    var label:String
    var value:Int
}

class PriorityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: AddPriorityDelegate?
    
    var priority:[Priorities] = []
    var isSelected:Priorities!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let priority1 = Priorities(label: "None", value: 0)
        let priority2 = Priorities(label: "High", value: 3)
        let priority3 = Priorities(label: "Medium", value: 2)
        let priority4 = Priorities(label: "Low", value: 1)
        
        priority = [priority1,priority2,priority3,priority4]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return priority.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let priorityList = priority[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = priorityList.label
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isSelected = priority[indexPath.row]
        delegate?.addPrirority(label: isSelected.label, value: isSelected.value)
        
        dismiss(animated: true)
        
    }
    
    
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true)
    }
}
