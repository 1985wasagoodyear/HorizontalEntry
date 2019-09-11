//
//  HETableView.swift
//  HorizontalEntry
//
//  Created by Kevin Yu on 9/27/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

// lots of cool ideas and inspiration by this neat fellow:
// http://www.vadimbulavin.com/tableviewcell-display-animation/?utm_campaign=AppCoda%20Weekly&utm_medium=email&utm_source=Revue%20newsletter

typealias Animation = (UITableViewCell, IndexPath, UITableView) -> Void

/// Animations will move towards this direction.
/// ie. '.left' will start on the right and animate leftwards
public enum AnimateDirection: Int {
    case left, right, up, down
}

extension UITableView {
    //
    open func slideIn(duration durationFactor: TimeInterval,
                      delay delayFactor: TimeInterval,
                      for cell: UITableViewCell,
                      at indexPath: IndexPath,
                      direction: AnimateDirection = .left) {
        let animation = HETableAnimationFactory.slideIn(duration: durationFactor,
                                                delayFactor: delayFactor,
                                                direction: direction)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: self)
    }
    
    open func bounceAnimation(duration durationFactor: TimeInterval,
                               delay delayFactor: TimeInterval,
                               for cell: UITableViewCell,
                               at indexPath: IndexPath,
                               direction: AnimateDirection = .left) {
        let animation = HETableAnimationFactory.bounce(duration: durationFactor,
                                                       delayFactor: delayFactor,
                                                       direction: direction)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: self)
    }
    
}
