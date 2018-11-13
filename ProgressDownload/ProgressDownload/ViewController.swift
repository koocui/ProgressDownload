//
//  ViewController.swift
//  ProgressDownload
//
//  Created by 小崔 on 2018/11/13.
//  Copyright © 2018年 小崔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        let xcProgressView = XCProgressView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        xcProgressView.center = self.view.center
        xcProgressView.signProgress = 0.80
        xcProgressView.CircularProgressViewStart()
        self.view.addSubview(xcProgressView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

