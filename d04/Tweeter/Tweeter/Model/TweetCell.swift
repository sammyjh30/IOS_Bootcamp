//
//  TweetCell.swift
//  Tweeter
//
//  Created by Samantha HILLEBRAND on 2019/10/12.
//  Copyright © 2019 Samantha Hillebrand. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    
    var name: String?
    var tweet: String?
//    var date: String?
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    let tweetLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    
//    var dateLabel: UILabel = {
//        var label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = NSTextAlignment.right
//        label.font = UIFont.italicSystemFont(ofSize: 12)
//        label.textColor = .black
//        return label
//    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(nameLabel)
        self.addSubview(tweetLabel)
//        self.addSubview(dateLabel)
        
        tweetLabel.sizeToFit()
        
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10) .isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.tweetLabel.topAnchor).isActive = true
//        nameLabel.rightAnchor.constraint(equalTo: self.dateLabel.leftAnchor).isActive = true
        
        tweetLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        tweetLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        tweetLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        tweetLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        
//        dateLabel.leftAnchor.constraint(equalTo: self.nameLabel.rightAnchor).isActive = true
//        dateLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
//        dateLabel.bottomAnchor.constraint(equalTo: self.tweetLabel.topAnchor).isActive = true
//        dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        if let name = name {
            nameLabel.text = name
        }
        if let tweet = tweet {
            tweetLabel.text = tweet
        }
//        if let date = date {
//            dateLabel.text = date
//        }
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

}
