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
//        nilで何も入っていないことを表す
        (title: "応募受付8/6まで！書籍【全国 高速バスの不思議と謎】プレゼントのご案内", date: "2018/07/19", image: nil),
        (title: "アップデートのお知らせ ver2.7閲覧履歴を追加しました", date: "2018/06/19", image: nil),
//        //UIImageをひとつずついれる
        (title:"【プレゼントキャンペーン実施中】アンケートに答えて高速バス乗車便利グッズをもらおう！", date: "2017/09/06", image:  UIImage(named: "bustowel.jpg")),
        (title:"【ニュース】[画像有り+シェア有り]JRバス関東　高速バス指定席乗車券にQRコード添付でスムーズな乗車が可能に", date: "2016/06/20", image:  UIImage(named: "original.jpg")),
        (title: "アプリをアップロードしていただき、ありがとうございます", date: "高速バス比較開発チーム", image: nil)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView: UITableView = UITableView()
        tableView.dataSource = self
        tableView.register(InformationTopCell.self, forCellReuseIdentifier: "InformationTopCell")
        // オートレイアウト時にUIViewのレイアウトが変更しないようにする
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // カスタマイズビューを追加
        view.addSubview(tableView)
        // オートレイアウトでtableViewを画面いっぱいに表示
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //仮の値（小さいと成約がでるためある程度余裕を持つ）
        tableView.estimatedRowHeight = 1000
        tableView.rowHeight = UITableViewAutomaticDimension
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTopCell", for: indexPath) as! InformationTopCell
        // items内にあるtitleとdateとimageを順に出す
        cell.configure(title: items[indexPath.row].title, date: items[indexPath.row].date, image: items[indexPath.row].image)
        cell.accessoryType = .disclosureIndicator
        cell.layoutIfNeeded()
        return cell
    }
}
