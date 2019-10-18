//
//  ComposeViewController.swift
//  KXMemo
//
//  Created by Adan on 30/09/2019.
//  Copyright © 2019 Kimdoyoung. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true) {
            print("Close Popoup")
        }
    }
    
    @IBAction func save(_ sender: Any) {
        let memo = memoTextView.text
        
        DataManager.shared.addNewMemo(memo)
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
