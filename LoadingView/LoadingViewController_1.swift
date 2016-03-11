//
//  LoadingViewController_1.swift
//  LoadingView
//
//  Created by LiChendi on 16/3/11.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit

class LoadingViewController_1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        
        
        self.view.addSubview(LoadingView_1(frame: self.view.bounds))
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
