//
//  DetailViewController.swift
//  Project-01-HWS
//
//  Created by Naveen Naidu  on 14/06/17.
//  Copyright © 2017 Naveen Naidu . All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        if let imageToLoad = selectedImage{
            imageView.image = UIImage(named: imageToLoad)
        }

        // Do any additional setup after loading the view.
    }
    
    func shareTapped() {
       // let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
        //vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        //present(vc, animated: true)
        
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook){
            vc.setInitialText("Look at this great picture!")
            vc.add(imageView.image!)
            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
            present(vc, animated: true)
        }
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
