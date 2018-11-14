//
//  WorldClockViewController.swift
//  TabBarsReloj
//
//  Created by IGNACIO OLAGORTA VERA on 7/11/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit
import Alamofire

/*protocol ShowUserDelegate: class{
    func sendUser()
    
}*/

class WorldClockViewController: UIViewController {
    
   // weak var delegate:ShowUserDelegate?

    @IBOutlet weak var txtUser : UITextField!
    
    init(){
        super.init(nibName: "WorldClockViewController", bundle:nil)
        self.tabBarItem.image = UIImage (named: "WorldClock")
        self.title = NSLocalizedString("World Clock", comment: "")
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
        getPosts(for: 1)
        getPostsAlamofire(userId: 1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendUser(){
 
    }
    
    private func showUser(){
        txtUser.text as String?
    }
    
    internal func getPosts(for userId: Int){
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "jsonplaceholder.typicode.com"
        urlComponents.path = "/posts"
        
        let userIdItem = URLQueryItem(name: "userId", value: "\(userId)")
        urlComponents.queryItems = [userIdItem]
        guard let url = urlComponents.url else {fatalError("Could not create URL")}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData: Data?, response: URLResponse?, error: Error?) in
            if let errorResponse = error{
                print("Error: ", errorResponse.localizedDescription)
            }
            else if let jsonData = responseData {
                let decoder = JSONDecoder()
                do {
                    let posts = try decoder.decode([Post].self, from: jsonData)
                    print("Total posts: ", posts.count)
                }
                catch let error {
                    print("Error decoding [Post]:", error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    internal func getPostsAlamofire(userId: Int){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts", method: HTTPMethod.get, parameters: ["userId" : userId], encoding: URLEncoding.default, headers: nil).responseData {(response) in
            if let jsonData = response.data {
            let decoder = JSONDecoder()
            do {
                let posts = try decoder.decode([Post].self, from: jsonData)
                print("Total posts using Alamofire: ", posts.count)
            }
            catch let error {
                print("Error decoding [Post]:", error.localizedDescription)
            }
            }
        }
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

/*extension WorldClockViewController: ShowUserDelegate{
    
}*/
