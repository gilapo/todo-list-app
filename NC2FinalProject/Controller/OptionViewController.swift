//
//  OptionViewController.swift
//  NC2FinalProject
//
//  Created by Agil Sulapohan Suaga on 11/04/22.
//

import UIKit

enum OptionValue{
    case priority(model: PriorityValue)
    case connectedTask(model: ConnectedTaskValue)
}

struct PriorityValue{
    let label:String
    let Value:Int
}
struct ConnectedTaskValue{
    let label:String
    let value:Int
}


class OptionViewController: UIViewController{

    
    private var myTableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
//        myTableView.dataSource = self
//        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
    

}
