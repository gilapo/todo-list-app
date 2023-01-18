//
//  ConnectedTaskViewController.swift
//  NC2FinalProject
//
//  Created by Agil Sulapohan Suaga on 11/04/22.
//

import UIKit

class ConnectedTaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var priority:[PriorityContent] = []
    var isSelected:PriorityContent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let priority1 = PriorityContent(label: "None", value: 0)
        let priority2 = PriorityContent(label: "High", value: 3)
        let priority3 = PriorityContent(label: "Medium", value: 2)
        
        priority = [priority1,priority2,priority3]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
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

    }
    
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true)
    }

}
