//
//  HETableAnimationFactory.swift
//  HETableView
//
//  Created by K Y on 9/11/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

private let offSetConstant: CGFloat = 2.0

final class HETableAnimationFactory {
    
    static func bounce(duration: TimeInterval,
                       delayFactor: Double,
                       direction: AnimateDirection) -> Animation {
        return { cell, indexPath, tableView in
            
            let startX: CGFloat
            let startY: CGFloat
            switch (direction) {
            case .left:
                startX = tableView.bounds.width * offSetConstant
                startY = 0.0
            case .right:
                startX = tableView.bounds.width * -offSetConstant
                startY = 0.0
            case .up:
                startX = 0.0
                startY = tableView.bounds.width * offSetConstant
            default:
                startX = 0.0
                startY = tableView.bounds.width * -offSetConstant
            }
            
            cell.transform = CGAffineTransform(translationX: startX, y: startY)
            
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 0.1,
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    
    static func slideIn(duration: TimeInterval,
                        delayFactor: Double,
                        direction: AnimateDirection) -> Animation {
        return { cell, indexPath, tableView in
            
            let startX: CGFloat
            let startY: CGFloat
            switch (direction) {
            case .left:
                startX = tableView.bounds.width * offSetConstant
                startY = 0.0
            case .right:
                startX = tableView.bounds.width * -offSetConstant
                startY = 0.0
            case .up:
                startX = 0.0
                startY = tableView.bounds.width * offSetConstant
            default:
                startX = 0.0
                startY = tableView.bounds.width * -offSetConstant
            }
            
            cell.transform = CGAffineTransform(translationX: startX, y: startY)
            
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
}

