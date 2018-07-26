//
//  CustomCell.swift
//  tableview
//
//  Created by Kunio Terada on 2018/07/18.
//  Copyright © 2018年 Kunio Terada. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let thumbnailImageView = UIImageView(image: nil)
    let badgeView = UIView()
    let badgeWrapperView = UIView()
    let button = UIButton()
    //制約
    var thumbnailImageViewSizeConstraint: NSLayoutConstraint!
    var titleLabelLeadingConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        /*
         * badgeWrapperView
         */
        // trueだとコンフリクトしてしまう
        badgeWrapperView.translatesAutoresizingMaskIntoConstraints = false
        // 自分自身に対してbadgeWrapperViewを追加する
        addSubview(badgeWrapperView)
        badgeWrapperView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        badgeWrapperView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        badgeWrapperView.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        badgeWrapperView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        /*
         * badgeView
         */
        badgeView.backgroundColor = UIColor.blue
        badgeView.layer.cornerRadius = 5.0
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        // badgeWrapperViewに対してbadgeViewを追加する
        badgeWrapperView.addSubview(badgeView)
        badgeView.centerXAnchor.constraint(equalTo: badgeWrapperView.centerXAnchor).isActive = true
        badgeView.centerYAnchor.constraint(equalTo: badgeWrapperView.centerYAnchor).isActive = true
        badgeView.widthAnchor.constraint(equalToConstant: 10.0).isActive = true
        badgeView.heightAnchor.constraint(equalToConstant: 10.0).isActive = true

        /*
         * thumbnailImageView
         */
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(thumbnailImageView)
        thumbnailImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thumbnailImageView.leadingAnchor.constraint(equalTo: badgeWrapperView.trailingAnchor).isActive = true
        //equalToだとcell + 50.0になるが、equalToConstantだと50.0のみで表示される。
        thumbnailImageViewSizeConstraint = thumbnailImageView.widthAnchor.constraint(equalToConstant: 70.0)
        // 画像があるときをtrueとするとif文で分けられる。
        thumbnailImageViewSizeConstraint.isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        
        /*
         * titleLabel
         */
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.0).isActive = true
        titleLabelLeadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor,constant: 15.0)
        titleLabelLeadingConstraint.isActive = true
        
        /*
         * dateLabel
         */
        dateLabel.numberOfLines = 0
        dateLabel.font = UIFont.systemFont(ofSize: 10.0)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2.0).isActive = true
        // dateLabelの左側はtitleLabelの左側と同じ位置なのでconstantも消す
        dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 新しい関数を定義（関数の中に関数はできない）
    func configure(title: String, date: String, image: UIImage?) {
        titleLabel.text = title
        titleLabel.sizeToFit()

        dateLabel.text = date
        dateLabel.sizeToFit()
        
        // Boolで画像があるかないかを分けて、あるときは画像サイズの50を表示
        if image != nil {
            thumbnailImageViewSizeConstraint.constant = 70
            titleLabelLeadingConstraint.constant = 15
            // 画像をUIImageViewに設定する.
            thumbnailImageView.image = image
            
        } else {
            thumbnailImageViewSizeConstraint.constant = 0
            titleLabelLeadingConstraint.constant = 0
            // 画像がないときをUIImageViewに設定する.
            thumbnailImageView.image = nil
        }
   }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
