//
//  ViewController.swift
//  RunPythonInIOS
//
//  Created by utrc on 30/08/2017.
//  Copyright © 2017 utrc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        PythonRunner.run()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

