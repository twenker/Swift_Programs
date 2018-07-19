//
//  webViewController.swift
//  RecipeFinder
//
//  Created by Todd Wenker on 4/21/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit
import WebKit

class webViewController: UIViewController, WKUIDelegate{

    @IBOutlet weak var webView: WKWebView!
    
    var urlString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //let x = urlString?.replacingOccurrences(of: "http", with: "https")
        let url = URL(string:urlString!)
        let request = URLRequest(url: url!)
        print(urlString!)
        self.webView!.load(request)
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
