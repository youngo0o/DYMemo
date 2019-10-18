//
//  MemoListTableViewController.swift
//  KXMemo
//
//  Created by Adan on 30/09/2019.
//  Copyright © 2019 Kimdoyoung. All rights reserved.
//

import UIKit

class MemoListTableViewController: UITableViewController {

    let formmeter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .full
        f.timeStyle = .none
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            let target = DataManager.shared.memoList[indexPath.row]
            
            if let vc = segue.destination as? DetailViewController{
                vc.memo = target
            }
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DataManager.shared.fetchMemo()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataManager.shared.memoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        
        let target = DataManager.shared.memoList[indexPath.row]
        
        
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = formmeter.string(for: target.insertDate)
        
        return cell
    }
}
