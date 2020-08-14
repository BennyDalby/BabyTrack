//
//  LaunchViewController.swift
//  BabyTrack
//
//  Created by Test on 7/24/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
   
    private var imageTimer: Timer?
    private let images = [
        UIImage(named: "baby-up"),
        UIImage(named: "baby-down")
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         startImageTimer()
        
       DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                       
               
       /* let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainView") as! ViewController
        
        
        */
        
       
        
        
      let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainView") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
        
}
    
    
    private func startImageTimer() {
        imageTimer = Timer(fire: Date(), interval: 5, repeats: true) { (timer) in
            self.imageView.image = self.images.randomElement() as? UIImage
        }
        RunLoop.main.add(imageTimer!, forMode: .common)
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
