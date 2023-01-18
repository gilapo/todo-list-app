//
//  AddTaskViewController.swift
//  NC2FinalProject
//
//  Created by Agil Sulapohan Suaga on 08/04/22.
//

import UIKit

struct Section{
    let title:String
    let option:[FormOptionType]
}

enum FormOptionType{
    case textFieldForm(model: TextFieldFormOption)
    case switchForm(model: SwitchFormOption)
    case segueForm(model: SegueFormOption)
    case normalForm(model: FormOption)
}

struct TextFieldFormOption{
    let title:String
    let placeholder:String
    let handler: (()->Void)
}

struct SwitchFormOption{
    let title:String
    var isOn:Bool
    let icon:UIImage?
    let iconBackgroundColor:UIColor
    let handler: (()->Void)
    
}

struct SegueFormOption{
    let title:String
    var segueLabel:String?
    let icon:UIImage?
    let iconBackgroundColor:UIColor
    var value:Int?
    let handler: (()->Void)
}

//
struct PriorityContent{
    var label:String
    var value:Int
    
}

//
struct FormOption{
    
    let title:String?
    //let form:UITextField
    let icon:UIImage?
    let iconBackgroundColor:UIColor
    let handler: (()->Void)
}





class AddTaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var formAddTable:UITableView!
    
    var priorityList:PriorityContent?
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formAddTable.register(AddTaskTableViewCell.self, forCellReuseIdentifier: AddTaskTableViewCell.identifier)
        formAddTable.register(TextTableViewCell.self, forCellReuseIdentifier: TextTableViewCell.identifier)
        formAddTable.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        formAddTable.register(SegueTableViewCell.self, forCellReuseIdentifier: SegueTableViewCell.identifier)
        formAddTable.register(DateTimePickerTableViewCell.self, forCellReuseIdentifier: DateTimePickerTableViewCell.identifier)
        
        formAddTable.dataSource = self
        formAddTable.delegate = self
        formAddTable.frame = view.bounds
        
        formAddTable.reloadData()
        
        configure()
        
    }
    
    func configure(){
        
        models.append(
            Section(title: "general", option: [
                .textFieldForm(model: TextFieldFormOption(title: "Title", placeholder: "Title"){
                    
                }),
                .textFieldForm(model: TextFieldFormOption(title: "Note", placeholder: "Note"){
                    
                })
            
        ]))
        models.append(
            Section(title: "priority", option: [
                .segueForm(model: SegueFormOption(title: "Priority", segueLabel: "None", icon: UIImage(systemName: "list.dash"), iconBackgroundColor: .systemGray){
                    
            })
            
        ]))
        
        models.append(
            Section(title: "date", option: [
                .switchForm(model: SwitchFormOption(title: "Due Date", isOn: false, icon: UIImage(systemName: "calendar"), iconBackgroundColor: .systemPink){
            }),
                .switchForm(model: SwitchFormOption(title: "Time", isOn: false, icon: UIImage(systemName: "clock"), iconBackgroundColor: .systemBlue){
            }),
            
        ]))
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].option.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].option[indexPath.row]
        
        switch model.self{
            //
        case .normalForm(let model):
            guard let cell = formAddTable.dequeueReusableCell(withIdentifier: AddTaskTableViewCell.identifier, for: indexPath) as? AddTaskTableViewCell else{
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
            //
        case .segueForm(let model):
            guard let cell = formAddTable.dequeueReusableCell(withIdentifier: SegueTableViewCell.identifier, for: indexPath) as? SegueTableViewCell else{
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
            //
        case .switchForm(let model):
            guard let cell = formAddTable.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else{
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
            //
        case .textFieldForm(let model):
            guard let cell = formAddTable.dequeueReusableCell(withIdentifier: TextTableViewCell.identifier, for: indexPath) as? TextTableViewCell else{
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        formAddTable.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].option[indexPath.row]
        switch type.self{
            case .normalForm(let model):
            model.handler()
            case .segueForm(let model):
            model.handler()
            let priorityVC = storyboard?.instantiateViewController(withIdentifier: "PriorityViewController") as! PriorityViewController
            priorityVC.delegate = self
            present(priorityVC, animated: true, completion: nil)
            
            case .switchForm(let model):
            model.handler()
            case .textFieldForm(let model):
            model.handler()
                
        }
    }
    
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true)
        
    }
    
    @IBAction func saveTask(_ sender: Any) {
        dismiss(animated: true)
    }
    
}


extension AddTaskViewController: AddPriorityDelegate{
    
    func addPrirority(label: String, value: Int){
        print("masuk")
        print(label)
        formAddTable.reloadData()
    }
}
