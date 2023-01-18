//
//  HomeViewController.swift
//  NC2FinalProject
//
//  Created by Agil Sulapohan Suaga on 07/04/22.
//

import UIKit


class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var task:[TaskList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        let task1 = TaskList(id:1, title: "Tugas Makalah", description: "mana tau saya bukan siapa siapa", priority: 1, dueDate: "09-12-2020")
        let task2 = TaskList(id:2, title: "Kumpulin Tugas NC2", description: "mana tau saya bukan siapa siapa", priority: 1, dueDate: "09-11-2020")
        let task3 = TaskList(id:3, title: "Bersihin Rumah", description: "mana tau saya bukan siapa siapa", priority: 2, dueDate: "09-12-2020")
        let task4 = TaskList(id:4, title: "Bantu Gotong Royong", description: "mana tau saya bukan siapa siapa", priority: 3, dueDate: "02-12-2020")
        let task5 = TaskList(id:5, title: "Minum Air Rutin", description: "mana tau saya bukan siapa siapa", priority: 3, dueDate: "-")
        let task6 = TaskList(id:6, title: "Meeting Angkatan", description: "mana tau saya bukan siapa siapa", priority: 3, dueDate: "08-09-2020")
        let task7 = TaskList(id:7, title: "Berrnafas", description: "mana tau saya bukan siapa siapa", priority: 3, dueDate: "-")
        
        task = [task1, task2, task3,task4,task5,task6,task7]
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell //->> as! is to alias controler, so we can use controller property
        
            cell.customTitle.text = task[indexPath.row].title
            cell.customDescription.text = task[indexPath.row].description
            
            if(task[indexPath.row].priority==1){
                cell.customPriority.text = "High"
                cell.customPriority.textColor = UIColor.systemPink
                cell.customImage.image = UIImage(systemName: "arrow.up.circle.fill")
                cell.customImage.tintColor = UIColor.systemPink
            }else if(task[indexPath.row].priority==2){
                cell.customPriority.text = "Medium"
                cell.customPriority.textColor = UIColor.systemOrange
                cell.customImage.image = UIImage(systemName: "arrow.right.circle.fill")
                cell.customImage.tintColor = UIColor.systemOrange
            }else{
                cell.customPriority.text = "Low"
                cell.customPriority.textColor = UIColor.systemMint
                cell.customImage.image = UIImage(systemName: "arrow.down.circle.fill")
                cell.customImage.tintColor = UIColor.systemMint
            }
            
            cell.customDueDate.text = "Due Date: \(task[indexPath.row].dueDate)"
            
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
   
}
