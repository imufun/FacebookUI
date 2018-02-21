//
//  ViewController.swift
//  FacebookUI
//
//  Created by sinbad on 2/17/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit

let cellId = "cellId"
class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "FaceBook Feed"
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId )
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
}

class FeedCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.white
        
        addSubview(NameLabel)
        addSubview(ProfileImageView)
        addSubview(StatusTextView)
        addSubview(ProfileCoverImage)
        addSubview(likeCommentLable)
        addSubview(divider)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        addConstraisWithFormat(format: "H:|-8-[v0(44)]-12-[v1]|", views: ProfileImageView, NameLabel)
        
        addConstraisWithFormat(format: "H:|-4-[v0]-4-|", views: StatusTextView)
        addConstraisWithFormat(format: "H:|[v0]|", views: ProfileCoverImage)
        
        addConstraisWithFormat(format: "H:|-8-[v0]|", views: likeCommentLable)
        
        addConstraisWithFormat(format: "H:|-12-[v0]-12-|", views: divider)
        
        //hack way to constant
        addConstraisWithFormat(format: "H:|[v0(v2)][v1(v2)][v2]|", views: likeButton, commentButton,shareButton)
        addConstraisWithFormat(format: "V:|-12-[v0]", views: NameLabel)
        addConstraisWithFormat(format: "V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]-8-[v3(30)]-8-[v4(0.5)][v5(44)]|", views: ProfileImageView, StatusTextView,ProfileCoverImage,likeCommentLable, divider,likeButton)
       
        //hack way to constant
        addConstraisWithFormat(format: "V:[v0(44)]|", views: commentButton)
        addConstraisWithFormat(format: "V:[v0(44)]|", views: shareButton)
    }
    
    
    
    let  NameLabel: UILabel  = {
        let label = UILabel()
        
        label.numberOfLines = 2
        
        let attributeText = NSMutableAttributedString(string: "Mohammad Imran Mia", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        
        attributeText.append(NSAttributedString(string: "\nFebruary 18 | Bangladesh", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.rgb(red: 155, green: 161, blue: 161)]))
        
        let paragrapStyle = NSMutableParagraphStyle()
        paragrapStyle.lineSpacing = 4
        
        
        attributeText.addAttribute(NSParagraphStyleAttributeName, value: paragrapStyle, range: NSMakeRange(0, attributeText.string.characters.count))
        
        label.attributedText = attributeText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let ProfileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "sinbad")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let StatusTextView : UITextView = {
        
        let textView = UITextView()
        textView.text = "Learn IOS development "
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        return textView
    }()
    
    let ProfileCoverImage: UIImageView = {
        let imageV = UIImageView()
        imageV.image =  #imageLiteral(resourceName: "cover")
        imageV.contentMode = .scaleAspectFill
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.layer.masksToBounds = true
        return imageV
        
    }()
    
    let likeCommentLable : UILabel = {
        let lable = UILabel()
        lable.text = "Like 100 * Comment 200"
        lable.font = UIFont.boldSystemFont(ofSize: 12)
        lable.textColor = UIColor.rgb(red: 155, green: 161, blue: 161)
        return lable
    }()
    
    
    //divider
    let divider : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 226, green: 28, blue: 232)
        return view
    }()
    let likeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Like", for: .normal)
        button.setImage(#imageLiteral(resourceName: "like-1"), for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 263), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
        
    }()
    
    let commentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Comment", for: .normal)
        button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 263), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
        
    }()
    let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.setImage(#imageLiteral(resourceName: "share"), for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 263), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
        
    }()
    
    
    //    let likeButton  = FeedCell.buttonTitle(title: "like", imageName: #imageLiteral(resourceName: "like-1"))
    //    let commentButton = FeedCell.buttonTitle(title: "Comment", imageName: #imageLiteral(resourceName: "comment"))
    //    let shareButton = FeedCell.buttonTitle(title: "Share", imageName: #imageLiteral(resourceName: "share"))
    //
    //    static func buttonTitle(title: String, imageName: String) -> UIButton {
    //        let button = UIButton()
    //        button.setTitle(title, for: .normal)
    //       // button.setImage(UIImage(named: imageName), for: .normal)
    //        button.setImage(imageName, for: .normal)
    //        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 263), for: .normal)
    //        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    //        //button.titleLabel?.font = UIFont.systemFontSize(14)
    //        return button
    //    }
    
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraisWithFormat(format: String, views: UIView...) {
        var viewDictonary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewDictonary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil
            , views: viewDictonary))
    }
}










