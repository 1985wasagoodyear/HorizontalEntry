//
//  SampleViewController.swift
//  HorizontalEntry
//
//  Created by Kevin Yu on 9/27/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit
import HETableView

class SampleViewController: UIViewController {

    let cellIdentifier = "cell"
    
    @IBOutlet weak var tableView: UITableView!
    
    let sampleData = ["Dog", "Cat", "Rabbit", "Bread", "Kitten", "Horse"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }


}

extension SampleViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = sampleData[indexPath.row];
        return cell
    }
}

extension SampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       // HETableView.performAnimation(tableView, willDisplay: cell, forRowAt: indexPath)
        tableView.slideInAnimation(duration: 0.5, delay: 0.05,
                                   for: cell, at: indexPath)
    }

}
