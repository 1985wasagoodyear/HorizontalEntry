//
//  SampleViewController.swift
//  HorizontalEntry
//
//  Created by Kevin Yu on 9/27/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit
import HETableView

extension UIColor {
    static let pink: UIColor = .init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.40)
}

class SampleViewController: UIViewController {

    @IBOutlet var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.register(UITableViewCell.self,
                                    forCellReuseIdentifier: cellIdentifier)
        }
    }

    private let cellIdentifier = "cell"
    let sampleData = ["Dog", "Cat", "Rabbit",
                      "Bread", "Kitten", "Horse"]
    let colors: [UIColor] = [.blue, .green, .pink,
                             .purple, .yellow, .orange]
    
}

extension SampleViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return sampleData.count * 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = sampleData[indexPath.row % sampleData.count];
        cell.backgroundColor = colors[indexPath.row % sampleData.count]
        cell.layer.masksToBounds = false
        cell.clipsToBounds = true
        cell.selectionStyle = .none
        return cell
    }
}

extension SampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        tableView.slideIn(duration: 0.5, delay: 0.05,
                          for: cell, at: indexPath,
                          direction: .right)
        // tableView.bounceAnimation(duration: 0.5, delay: 0.05,
        //                          for: cell, at: indexPath, direction: .up)
    }
}
