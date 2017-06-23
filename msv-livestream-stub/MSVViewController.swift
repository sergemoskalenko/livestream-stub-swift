
//  MSVViewController.swift
//  msv-livestream-stub
//
//  Created by Serge Moskalenko on 21.06.17.
//  Copyright © 2017 Serge Moskalenko. All rights reserved.
//  http://https://github.com/sergemoskalenko 
//
import UIKit

class MSVViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var items : Array? = [MSVLivestreamFeedObject?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 30
        tableView.rowHeight = UITableViewAutomaticDimension
        self.items = nil
        getData()
    }

    func fetchData() {
        var items  : Array? = [MSVLivestreamFeedObject?]()
        let responseData = try? Data(contentsOf: URL(string: "http://api.new.livestream.com/accounts/volvooceanrace/events/leg5")!, options: .uncached)
        let response = try! JSONSerialization.jsonObject(with: responseData!, options: []) as! [String: AnyObject]
        if JSONSerialization.isValidJSONObject(response) {
            let feed = response["feed"] as! [String: AnyObject]
            self.items = [MSVLivestreamFeedObject?]()
            let data = feed["data"] as! [[String:Any]]
            for dic in data {
                let type: String = dic["type"] as! String
                if (type == "status") {
                    let item = MSVLivestreamFeedObject()
                    let data2 = dic["data"] as! [String: AnyObject]
                    item.text = data2["text"] as! String
                    item.date = data2["updated_at"] as! String
                    items?.append(item)
                }
            }
            self.items = items
        }
    }

    func getData() {
        self.items = nil
        DispatchQueue.global(qos: .default).async(execute: {() -> Void in
            self.fetchData()
            DispatchQueue.main.async(execute: {() -> Void in
                self.tableView.reloadData()
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

// MARK: - Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int = 1
        if items != nil {
            count = (items?.count)!
        }
        
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = (items == nil) ? "waitcell" : "textcell"
        var cell: UITableViewCell? = self.tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = (items == nil) ? MSVWaitTableViewCell() : MSVTextTableViewCell()
        }
        if items != nil {
            let item: MSVLivestreamFeedObject? = items?[indexPath.row] as! MSVLivestreamFeedObject
            (cell as? MSVTextTableViewCell)?.text2Label?.text = item?.text
            (cell as? MSVTextTableViewCell)?.dateLabel?.text = item?.date
        }
        cell?.updateConstraints()
        return cell!
    }

    func tableView(_ tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = UIColor.white
        }
        else {
            cell.contentView.backgroundColor = UIColor(white: CGFloat(0.95), alpha: CGFloat(1))
        }
    }
}
