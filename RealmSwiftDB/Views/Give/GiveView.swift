//
//  GiveView.swift
//  RealmSwiftDB
//
//  Created by Kuroyan Juliett on 28.04.2018.
//  Copyright © 2018 Artemii Shabanov. All rights reserved.
//


import Foundation
import UIKit


public class GiveView: UIView {

    var books: [Book]!
    var friends: [Friend]!
    var tableView: UITableView!
    
    public var onExitPress: (() -> ())?
    
    var visualEffectView: UIVisualEffectView!
    
    public init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        self.addSubview(visualEffectView)
        
        let xMargin = 20
        
        let exitButton = UIButton(frame: CGRect(x: xMargin, y: Int(UIScreen.main.bounds.height - 150), width: Int(UIScreen.main.bounds.width) - 2 * xMargin, height: 50))
        tableView = UITableView(frame: CGRect(x: xMargin, y: 4 * xMargin, width: Int(UIScreen.main.bounds.width) - 2 * xMargin, height: Int(UIScreen.main.bounds.height - 230)))
        
        let borderColor = UIColor(displayP3Red: 0.0, green: 97.0 / 255.0, blue: 175.0 / 255.0, alpha: 1)
        let buttonColor = UIColor(displayP3Red: 200.0 / 255.0, green: 200.0 / 255.0, blue: 200.0 / 255.0, alpha: 1)
        
        exitButton.backgroundColor = buttonColor
        exitButton.setTitleColor(borderColor, for: .normal)
        exitButton.setTitle("Exit", for: .normal)
        exitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        visualEffectView.contentView.addSubview(tableView)
        visualEffectView.contentView.addSubview(exitButton)
        
        exitButton.addTarget(self, action: #selector(self.exitButtonPress), for: .touchUpInside)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public typealias GivableVC = UIViewController & Givable
    public func show(in vc: GivableVC) {
        vc.view.addSubview(self)
        self.frame = vc.view.frame
        visualEffectView.frame = self.frame
        
        self.center = vc.view.center

        visualEffectView.center = self.center
        
        self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.alpha = 0
        
        UIView.animate(withDuration: 0.3, animations:  {
            self.alpha = 1
            self.visualEffectView.effect = UIBlurEffect(style: .dark)
            self.transform = CGAffineTransform.identity
        })
    }
    
    
    func hide() {
        self.removeFromSuperview()
    }
    
    
    @objc func exitButtonPress(sender: UIButton) {
        self.onExitPress?()
        hide()
    }
}
