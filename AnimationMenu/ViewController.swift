//
//  ViewController.swift
//  AnimationMenu
//
//  Created by babykang on 16/4/17.
//  Copyright © 2016年 babykang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeOnWind (sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}

