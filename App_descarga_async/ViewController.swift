//
//  ViewController.swift
//  App_descarga_async
//
//  Created by User on 6/1/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Fase 1
        /*let url : NSURL = NSURL(string: "http://www.tuvez.com/wp-content/uploads/gallery/mariana-davalos/mariana-davalos-01.jpg")!
        let data : NSData = NSData(contentsOfURL: url)!
        let image : UIImage = UIImage(data: data)!
        myImageView.image = image*/
        
        //Fase 2
        
        //Creamos la cola
        let gcd1 : dispatch_queue_t = dispatch_queue_create("davalos", nil)
        myActivityIndicator.startAnimating()
        
        //creamos el bloque en 2 plano
        dispatch_async(gcd1) { () -> Void in
            
            let url : NSURL = NSURL(string: "http://www.tuvez.com/wp-content/uploads/gallery/mariana-davalos/mariana-davalos-01.jpg")!
            let data : NSData = NSData(contentsOfURL: url)!
            
            //creamos el bloque en 1 plano
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                let image : UIImage = UIImage(data: data)!
                self.myImageView.image = image
                self.myActivityIndicator.stopAnimating()
                self.myActivityIndicator.hidden = true 
            })
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

