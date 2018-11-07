//
//  AlarmViewController.swift
//  TabBarsReloj
//
//  Created by IGNACIO OLAGORTA VERA on 7/11/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {

    init(){
        super.init(nibName: "AlarmViewController", bundle:nil)
        self.tabBarItem.image = UIImage (named: "Alarm")
        self.title = NSLocalizedString("Alarm", comment: "")
        setupBarButtonsItems()
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.orange
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupBarButtonsItems(){
        let btnGeneral = UIBarButtonItem(title:"Edit", style: .plain, target: self, action: #selector(buttonPressed))
        navigationItem.setLeftBarButton(btnGeneral, animated: false)
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonPressed))
        navigationItem.setRightBarButton(addBarButton, animated: false)
    }
    @objc func buttonPressed(){
      //  let principal = GeneralViewController()
      // navigationController?.pushViewController(principal, animated: true)
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
