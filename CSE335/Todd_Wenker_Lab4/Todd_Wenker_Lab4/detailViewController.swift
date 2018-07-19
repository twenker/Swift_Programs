//
//  detailViewController.swift
//  Todd_Wenker_Lab4
//
//  Created by Todd Wenker on 2/26/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var titleStr:String?
    var detailsStr:String?
    var cityImage:NSData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = titleStr!
        detailsLabel.text = detailsStr!
        selectImage.image = UIImage(data: cityImage! as Data)
        
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
