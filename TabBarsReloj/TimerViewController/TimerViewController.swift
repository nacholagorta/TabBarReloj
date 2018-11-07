//
//  TimerViewController.swift
//  TabBarsReloj
//
//  Created by IGNACIO OLAGORTA VERA on 7/11/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    init(){
        super.init(nibName: "TimerViewController", bundle:nil)
        self.tabBarItem.image = UIImage (named: "Timer")
        self.title = NSLocalizedString("Timer", comment: "")
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
