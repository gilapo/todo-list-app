//
//  SwitchTableViewCell.swift
//  NC2FinalProject
//
//  Created by Agil Sulapohan Suaga on 10/04/22.
//

import UIKit

struct SwitchChanged{
    var status:Bool
    var name:String
}

class SwitchTableViewCell: UITableViewCell {

    static let identifier = "SwitchTableViewCell"
    
//    var status:SwitchChanged!
    
    var switchChanged:[Bool] = []
    
    //icon container
    private let iconContainer:UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds  = true
        return view
    }()
    
    //icon
    private let iconImageView:UIImageView = {
       let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //label
    private let label:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    //switch
    private let mySwitch:UISwitch = {
        
        let mySwitch = UISwitch()
        mySwitch.tintColor = .systemGreen
        return mySwitch
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //add component to table view cell
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(mySwitch)
        iconContainer.addSubview(iconImageView)
        
        contentView.clipsToBounds = true
        accessoryType = .none
        
        print(mySwitch)
        
        mySwitch.addTarget(self, action: #selector(didChangeSwitch), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //func to configure layout, like positioning etc.
    override func layoutSubviews() {
        super.layoutSubviews()
        let size:CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize:CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
        
        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(x: contentView.frame.size.width - mySwitch.frame.size.width - 15,
                                y: (contentView.frame.size.height - mySwitch.frame.size.height)/2,
                                width: mySwitch.frame.size.width,
                                height: mySwitch.frame.size.height)
        
        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
        
        self.selectionStyle = .none
        
    }
    
    //func to prepare cell after it used, and to reuse it, use it for reset the component
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        iconContainer.backgroundColor = nil
        label.text = nil
        mySwitch.isOn = false
    }
    
    //configure "content" of the cell
    public func configure(with model: SwitchFormOption){
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        mySwitch.isOn = model.isOn
    }


    @objc func didChangeSwitch(_ sender: UISwitch){
        if sender.isOn{
//            let switchDetector = SwitchChanged(status: sender.isOn, name: label.text ?? "")
//            print(switchDetector)
            switchChanged = [sender.isOn]
        }
        else{
            switchChanged.remove(at: 0)
        }
    }
}
