//
//  ViewController.swift
//  tableview
//
//  Created by Kunio Terada on 2018/07/18.
//  Copyright © 2018年 Kunio Terada. All rights reserved.
//

import UIKit

class InformationTopViewController: UIViewController, UITableViewDataSource {
    
    var items = [
        (title: "応募受付8/6まで！書籍【全国 高速バスの不思議と謎】プレゼントのご案内", date: "2018/07/19", image: false),
        (title: "アップデートのお知らせ ver2.7閲覧履歴を追加しました", date: "2018/06/19", image: false),
        (title:"【プレゼントキャンペーン実施中】アンケートに答えて高速バス乗車便利グッズをもらおう！", date: "2017/09/06", image: true),
        (title:"【ニュース】[画像有り+シェア有り]JRバス関東　高速バス指定席乗車券にQRコード添付でスムーズな乗車が可能に", date: "2016/06/20", image: true),
        (title: "アプリをアップロードしていただき、ありがとうございます", date: "高速バス比較開発チーム", image: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView: UITableView = UITableView()
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        // オートレイアウト時にUIViewのレイアウトが変更しないようにする
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // カスタマイズビューを追加
        view.addSubview(tableView)
        // コードが実行できているかbackgroundColorで判断する
        view.backgroundColor = UIColor.red
        
        // オートレイアウトでtableViewを画面いっぱいに表示
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
       
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //　一つのsectionの中に入れるCellの数を決める
    func tableView(_ tableView:UITableView,numberOfRowsInSection section: Int) -> Int{
        //　itemsにある要素数
        return items.count
    }
    //　Cellの内容をきめる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //　CustomCellを呼ぶ
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        // items内にあるtitleとdateを順に出す
        cell.configure(title: items[indexPath.row].title, date: items[indexPath.row].date, image: items[indexPath.row].image)
        cell.accessoryType = .disclosureIndicator
        cell.layoutIfNeeded()
        return cell
    }
}


