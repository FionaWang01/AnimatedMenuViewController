//
//  MenuViewController.swift
//  AnimationMenu
//
//  Created by babykang on 16/4/17.
//  Copyright © 2016年 babykang. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    let transationMenuViewController = MenuViewControllerManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self.transationMenuViewController
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var Music: UIButton!
    
    @IBOutlet weak var photo: UIButton!
    @IBOutlet weak var link: UIButton!

    @IBOutlet weak var text: UIButton!
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
