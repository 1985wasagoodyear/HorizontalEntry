//
//  Animator.swift
//  HETableView
//
//  Created by K Y on 9/11/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

final class Animator {
    
    private let animation: Animation
    
    init(animation: @escaping Animation) {
        self.animation = animation
    }
    
    func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
        animation(cell, indexPath, tableView)
    }
}
