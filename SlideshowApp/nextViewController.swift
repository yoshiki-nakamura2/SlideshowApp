//
//  nextViewController.swift
//  SlideshowApp
//
//  Created by 中村嘉希 on 2020/06/13.
//  Copyright © 2020 yoshiki.nakamura2. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {
    
    @IBOutlet weak var tappedImage: UIImageView!
    var selectedImage :UIImage!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedImage.image = selectedImage
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
