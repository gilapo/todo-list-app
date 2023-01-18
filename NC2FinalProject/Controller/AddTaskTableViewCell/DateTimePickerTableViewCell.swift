//
//  DateTimePickerTableViewCell.swift
//  NC2FinalProject
//
//  Created by Agil Sulapohan Suaga on 10/04/22.
//

import UIKit

class DateTimePickerTableViewCell: UITableViewCell {

    static let identifier = "DateTimePickerTableViewCell"
    
    //datePicker
    private let datePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = .systemPink
        return datePicker
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //add component to table view cell
        contentView.addSubview(datePicker)
        
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //func to configure layout, like positioning etc.
    override func layoutSubviews() {
        super.layoutSubviews()
        datePicker.center = contentView.center
        //textField.keyboardType = UIKeyboardType.default
        self.selectionStyle = .none
    }
    
    //func to prepare cell after it used, and to reuse it, use it for reset the component
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //configure "content" of the cell
    public func configure(){
        
    }
}
