//
//  ViewController.swift
//  FacebookUI
//
//  Created by sinbad on 2/17/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit

class Post{
    var name : String?
    var statusText : String?
   // var image : String
  //  init(name: String, post: String) {
     ///   this.name = name
     //   this.post = post
  //  }
}



let cellId = "cellId"
class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var post = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let postName = Post()
 
        postName.name = "The Advanture of sinbad"
        postName.statusText = "1996 to 1998. It follows on the story from the pilot of the same name. It revolves around the series' protagonist, Sinbad. The series is a re- telling of the adventures of Sinbad from The Arabian Nights. Created by Ed Naha"
        post.append(postName)
        
        
        
        let postNameText = Post()
        postNameText.name = "The Titanic"
        postNameText.statusText = "Titanic is a 1997 American epic romance-disaster film directed, written, co-produced and co-edited by James Cameron. A fictionalized account of the sinking of the RMS Titanic, it stars Leonardo DiCaprio and Kate Winslet as members of different social classes who fall in love aboard the ship during its ill-fated maiden "
        post.append(postNameText)
        
        
        
        navigationItem.title = "FaceBook Feed"
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId )
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feedCell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
    
        if let post = post[indexPath.item].statusText {
            feedCell.StatusTextView.text = post
        }
        
        if let name = post[indexPath.item].name {
            feedCell.NameLabel.text = name
        }
        
        
        return feedCell
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
    
    
    var post : Post? {
        
        didSet {
            
            if let name  = post?.name {
                let attributeText = NSMutableAttributedString(string: name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
                
                attributeText.append(NSAttributedString(string: "\nFebruary 18 | Bangladesh", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.rgb(red: 155, green: 161, blue: 161)]))
                
                let paragrapStyle = NSMutableParagraphStyle()
                paragrapStyle.lineSpacing = 4
                
                
                attributeText.addAttribute(NSParagraphStyleAttributeName, value: paragrapStyle, range: NSMakeRange(0, attributeText.string.characters.count))
                
                NameLabel.attributedText = attributeText
            }
            
            if let statusText = post?.statusText {
                StatusTextView.text = statusText
            }
        }
        
        
        
    }
    
    
    
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










