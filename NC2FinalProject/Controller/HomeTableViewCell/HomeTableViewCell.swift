//
//  HomeTableViewCell.swift
//  NC2FinalProject
//
//  Created by Agil Sulapohan Suaga on 07/04/22.
//

import UIKit

struct TaskList{
    var id:Int
    var title:String
    var description:String
    var priority:Int
    var dueDate:String
}

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }
    
    @IBOutlet var customCard:UIView!
    
    @IBOutlet var customTitle:UILabel!
    @IBOutlet var customDescription:UILabel!
    @IBOutlet var customDueDate:UILabel!
    @IBOutlet var customPriority:UILabel!
    @IBOutlet var customImage:UIImageView!
    
    var arrayTaskList:[TaskList]=[]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customCard.contentMode = .scaleAspectFit
        self.selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
