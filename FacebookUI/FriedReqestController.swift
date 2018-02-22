//
//  FriendReuestController.swift
//  FacebookUI
//
//  Created by sinbad on 6/6/1439 AH.
//  Copyright © 1439 AH sinbad. All rights reserved.
//

import UIKit
class FriedReqestController: UITableViewController {
    
    
    static let cellId  = "celID"
    static let headerId = "headerId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Friend Request"
        tableView.separatorColor = UIColor.rgb(red: 229, green: 231, blue: 235)
        tableView.sectionHeaderHeight = 26
        
        //        self.view.backgroundColor = UIColor.red
        
        tableView.register(FriendRequestCell.self, forCellReuseIdentifier: FriedReqestController.cellId)
        tableView.register(RequestHeader.self, forCellReuseIdentifier: FriedReqestController.headerId)
        tableView.allowsSelection = false
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriedReqestController.cellId, for: indexPath) as! FriendRequestCell
        
        if indexPath.row % 3 == 0 {
            
        }
        
        
        
        return cell
    }
}






class FriendRequestCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let namelabel : UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    
    let requstImageView : UIImageView = {
        
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor  = UIColor.blue
        image.layer.masksToBounds = true
        return image
    }()
    
    let confirmButton: UIButton = {
        let confirmButton = UIButton()
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.setTitleColor(UIColor.white, for: .normal)
        confirmButton.backgroundColor = UIColor.rgb(red: 87, green: 143, blue: 255)
        confirmButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        confirmButton.layer.cornerRadius  = 2
        return confirmButton
    }()
    
    
    let deleteButton: UIButton  = {
        let deteleButton = UIButton()
        deteleButton.setTitle("Delete", for: .normal)
        deteleButton.setTitleColor(UIColor.init(white: 0.3, alpha: 1), for: .normal)
        deteleButton.layer.borderColor = UIColor(white: 0.7, alpha: 1).cgColor
        deteleButton.layer.borderWidth = 1
        deteleButton.layer.cornerRadius = 2
        deteleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        return deteleButton
    }()
    
    
    
    
    // autolaout
    func setupView(){
        addSubview(namelabel)
        addSubview(requstImageView)
        addSubview(confirmButton)
        addSubview(deleteButton)
        
        addConstraisWithFormat(format: "H:|-16-[v0(52)]-8-[v1]|", views: requstImageView, namelabel)
        addConstraisWithFormat(format: "V:|-4-[v0]-4-|", views: requstImageView)
        //addConstraisWithFormat(format: "", views: <#T##UIView...##UIView#>)
    }
    
    
}

class RequestHeader: UITableViewCell {
    
}

//import Foundation
//import UIKit
//
//class FriendRequestsController:UITableViewController{
//    
//    static let cellId = "cellId"
//    static let headerId = "headerId"
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigationItem.title = "Friend Requests"
//        //tableView.separatorColor = UIColor.rgb(r: 229, g: 231, b: 235)
//        tableView.sectionHeaderHeight = 26
//        tableView.register(FriendRequestCell.self, forCellReuseIdentifier: FriendRequestsController.cellId)
//        tableView.register(RequestHeader.self, forHeaderFooterViewReuseIdentifier: FriendRequestsController.headerId)
//        tableView.allowsSelection = false
//    }
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: FriendRequestsController.cellId, for: indexPath) as! FriendRequestCell
//        if indexPath.row % 3 == 0 {
//            cell.nameLabel.text = "Mark Zuckerberg"
//            cell.requestImageView.image = UIImage(named: "zuckprofile")
//        } else if indexPath.row % 3 == 1 {
//            cell.nameLabel.text = "Steve Jobs"
//            cell.requestImageView.image = UIImage(named: "steve_profile")
//        } else {
//            cell.nameLabel.text = "Mahatma Gandhi"
//            cell.requestImageView.image = UIImage(named: "gandhi_profile")
//        }
//        
//        cell.imageView?.backgroundColor = UIColor.black
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FriendRequestsController.headerId) as! RequestHeader
//        
//        if section == 0 {
//            header.nameLabel.text = "FRIEND REQUESTS"
//        } else {
//            header.nameLabel.text = "PEOPLE YOU MAY KNOW"
//        }
//        
//        return header
//    }
//}
//
//class RequestHeader: UITableViewHeaderFooterView {
//    
//    override init(reuseIdentifier: String?) {
//        super.init(reuseIdentifier: reuseIdentifier)
//        setupViews()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    let nameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "FRIEND REQUESTS"
//        label.font = UIFont.systemFont(ofSize: 10)
//        label.textColor = UIColor(white: 0.4, alpha: 1)
//        return label
//    }()
//    
//    let bottomBorderView: UIView = {
//        let view = UIView()
//    //    view.backgroundColor = UIColor.rgb(r: 229, g: 231, b: 235)
//        return view
//    }()
//    
//    func setupViews(){
//        addSubview(nameLabel)
//        addSubview(bottomBorderView)
//        addConstraisWithFormat(format: "H:|-8-[v0]-8-|", views: nameLabel)
//        addConstraisWithFormat(format: "H:|[v0]|", views: bottomBorderView)
//        addConstraisWithFormat(format: "V:|[v0][v1(0.5)]|", views: nameLabel,bottomBorderView)
//    }
//    
//}
//
//class FriendRequestCell:UITableViewCell{
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    let nameLabel:UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 12)
//        return label
//    }()
//    
//    let requestImageView : UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.backgroundColor = .blue
//        imageView.layer.masksToBounds = true
//        return imageView
//    }()
//    
//    let confirmButton:UIButton = {
//        let button = UIButton()
//        button.setTitle("Confirm", for: .normal)
//        button.setTitleColor(UIColor.white, for: .normal)
//        button.backgroundColor = UIColor.blue
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
//        button.layer.cornerRadius = 2
//        return button
//    }()
//    
//    let deleteButton:UIButton = {
//        let button = UIButton()
//        button.setTitle("Delete", for: .normal)
//        button.setTitleColor(UIColor(white: 0.3, alpha: 1), for: .normal)
//        button.layer.borderColor = UIColor(white: 0.7, alpha: 1).cgColor
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = 2
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
//        return button
//    }()
//    
//    func setupViews(){
//        addSubview(nameLabel)
//        addSubview(requestImageView)
//        addSubview(confirmButton)
//        addSubview(deleteButton)
//        
//        addConstraisWithFormat(format: "H:|-16-[v0(52)]-8-[v1]|", views: requestImageView, nameLabel)
//        addConstraisWithFormat(format: "V:|-4-[v0]-4-|", views: requestImageView)
//        addConstraisWithFormat(format: "V:|-8-[v0]-8-[v1(24)]-8-|", views: nameLabel, confirmButton)
//        addConstraisWithFormat(format: "H:|-76-[v0(80)]-8-[v1(80)]", views: confirmButton, deleteButton)
//        addConstraisWithFormat(format: "V:[v0(24)]-8-|", views: deleteButton)
//    }
//}
