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
        return CGSize(width: view.frame.width, height: 200)
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
        
        addConstraisWithFormat(format:  "H:|-8-[v0(44)]-8-[v1]|", views: ProfileImageView, NameLabel)
        
        addConstraisWithFormat(format: "H:|-4-[v0]-4-|", views: StatusTextView)
        addConstraisWithFormat(format: "H:|[v0]|", views: ProfileCoverImage)
        addConstraisWithFormat(format: "V:|-12-[v0]", views: NameLabel)
        addConstraisWithFormat(format: "V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]", views: ProfileImageView, StatusTextView,ProfileCoverImage)
        
    }
    
    
    
    let  NameLabel: UILabel  = {
        let label = UILabel()
        
        label.numberOfLines = 2
        
        let attributeText = NSMutableAttributedString(string: "Mohammad Imran Mia", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        
        attributeText.append(NSAttributedString(string: "\nFebruary 18 | Bangladesh", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.gray]))
        
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
        return imageV
        
    }()
    
    
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










