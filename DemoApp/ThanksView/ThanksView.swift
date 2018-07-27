//
//  CustomCell.swift
//  ThanksViewdemo
//
//  Created by Kunio Terada on 2018/07/23.
//  Copyright © 2018年 Kunio Terada. All rights reserved.
//

import UIKit

class ThanksView: UIView, UITextFieldDelegate{

    let thumbnailImageView = UIImageView(image: nil)
    let titleLabel = UILabel()
    let tableLabel = UILabel()
    let subTableLabel = UILabel()
    let feedbackButton = UIButton(type: UIButtonType.system)
    let rateButton = UIButton(type: UIButtonType.system)
    let cancelButton = UIButton(type: UIButtonType.system)
    let sampleDrawing = UIView()
    var thumbnailImageViewSizeConstraint: NSLayoutConstraint!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = .white
       
        /*
         * tableLabel
         */
        tableLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableLabel)
        tableLabel.text = "アプリをアップロードしていただき、ありがとうございます"
        tableLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        tableLabel.numberOfLines = 0
        tableLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tableLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20.0).isActive = true
        tableLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60.0).isActive = true

        /*
         * subTableLabel
         */
        subTableLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subTableLabel)
        subTableLabel.text = "高速バス比較開発チーム"
        subTableLabel.font = UIFont.systemFont(ofSize: 10.0)
        subTableLabel.numberOfLines = 0
        subTableLabel.topAnchor.constraint(equalTo: tableLabel.bottomAnchor, constant: 20.0).isActive = true
        subTableLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10.0).isActive = true
        subTableLabel.textColor = UIColor.darkGray

        /*
         *sampleDrawing
         */
        sampleDrawing.backgroundColor = UIColor.lightGray
        sampleDrawing.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sampleDrawing)
        sampleDrawing.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        sampleDrawing.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        sampleDrawing.widthAnchor.constraint(equalTo: tableLabel.widthAnchor).isActive = true
        sampleDrawing.topAnchor.constraint(equalTo: subTableLabel.bottomAnchor, constant: 10.0).isActive = true
        
        /*
         *thumbnailImageView
         */
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(thumbnailImageView)
        thumbnailImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalTo: thumbnailImageView.heightAnchor, constant: -25.0).isActive = true
        thumbnailImageView.topAnchor.constraint(equalTo: sampleDrawing.bottomAnchor, constant: 20.0).isActive = true
        thumbnailImageView.sizeToFit()
        
        /*
         *titleLabel
         */
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.text = "このアプリは楽しい旅の計画を\nお手伝いするために作られました。\n\n今後も様々な機能を追加していく予定です。\nご意見・ご要望・評価を、ぜひお願いします！"
        titleLabel.font = UIFont.systemFont(ofSize: 16.0)
        titleLabel.numberOfLines = 0
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor,constant: 20.0).isActive = true
        titleLabel.adjustsFontSizeToFitWidth = true
        
        /*
         *feedbackButton
         */
        feedbackButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(feedbackButton)
        feedbackButton.setTitle("ご意見・ご要望", for: UIControlState.normal)
        feedbackButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        feedbackButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        feedbackButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10.0).isActive = true
        feedbackButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        feedbackButton.backgroundColor = UIColor.orange
        feedbackButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        feedbackButton.layer.cornerRadius = 5
        
        /*
         *rateButton
         */
        rateButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rateButton)
        rateButton.setTitle("評価する", for: UIControlState.normal)
        rateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        rateButton.heightAnchor.constraint(equalTo: feedbackButton.heightAnchor).isActive = true
        rateButton.widthAnchor.constraint(equalTo: feedbackButton.widthAnchor).isActive = true
        rateButton.leadingAnchor.constraint(equalTo: feedbackButton.trailingAnchor,constant: 10.0).isActive = true
        rateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
        rateButton.topAnchor.constraint(equalTo: feedbackButton.topAnchor).isActive = true
        rateButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        rateButton.backgroundColor = UIColor.orange
        rateButton.layer.cornerRadius = 5

        /*
         *cancelButton
         */
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cancelButton)
        cancelButton.setTitle("また今度！", for: UIControlState.normal)
        cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cancelButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        cancelButton.topAnchor.constraint(equalTo: feedbackButton.bottomAnchor,constant: 10.0).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: feedbackButton.leadingAnchor).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: rateButton.trailingAnchor).isActive = true
        cancelButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        cancelButton.backgroundColor = UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        cancelButton.layer.cornerRadius = 5
    }
    
    func configure(image: UIImage?) {
        thumbnailImageView.image = UIImage(named: "illust_thankyou_color")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
