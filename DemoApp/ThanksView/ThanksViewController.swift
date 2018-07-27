//
//  ViewController.swift
//  ThanksViewdemo
//
//  Created by Kunio Terada on 2018/07/23.
//  Copyright © 2018年 Kunio Terada. All rights reserved.
//

import UIKit

class ThanksViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thanksView = ThanksView(frame: self.view.bounds)
        thanksView.configure(image: UIImage(named: "illust_thankyou_color"))
        thanksView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(thanksView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

