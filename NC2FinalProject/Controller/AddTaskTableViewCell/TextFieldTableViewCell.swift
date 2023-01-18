//
//  TextFieldTableViewCell.swift
//  NC2FinalProject
//
//  Created by Agil Sulapohan Suaga on 10/04/22.
//

import UIKit

class TextTableViewCell: UITableViewCell, UITextFieldDelegate {

    static let identifier = "TextTableViewCell"
    
    //textfield
    private let textField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //add component to table view cell
        contentView.addSubview(textField)
        
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //func to configure layout, like positioning etc.
    override func layoutSubviews() {
        super.layoutSubviews()
        textField.sizeToFit()
        let size:CGFloat = contentView.frame.size.height - 12
        textField.frame = CGRect(x: 15, y: 6, width: contentView.frame.size.width - 30, height: size)
        //textField.keyboardType = UIKeyboardType.default
        self.selectionStyle = .none
    }
    
    //func to prepare cell after it used, and to reuse it, use it for reset the component
    override func prepareForReuse() {
        super.prepareForReuse()
        textField.text = nil
    }
    
    //configure "content" of the cell
    public func configure(with model: TextFieldFormOption){
        textField.placeholder =  model.placeholder
    }

}
