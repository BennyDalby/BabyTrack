//
//  MenuItem.swift
//  BabyTrack
//
//  Created by Test on 7/22/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit


let viewHeight = 100

enum ButtonType {
    
    case Main
    case BabyBottle
    case BabyDiaper
    case BabySleep
    case BabyTemp
    
}

struct navButton {
    
    var id = Int()
    var title = String()
    var image : UIImage?
    var button = UIButton()
    var buttontype : ButtonType
    
    
}

class MenuItem: UIView {
    
    
    var buttonList  = [navButton]()
    let screenSize: CGRect = UIScreen.main.bounds
   
    
    func createNavButtons(frame:CGRect) {
        
        
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.autoresizesSubviews = true;
        self.frame = CGRect(x: 0, y: Int(screenSize.height) - viewHeight , width: Int(screenSize.width) , height: viewHeight)
        
        let main = navButton(id:1,title: "main",image:  UIImage(named: "add"),button: UIButton(frame: CGRect(x: self.frame.width/2-25, y: self.frame.height/2-25, width: 50, height: 50)),buttontype: ButtonType.Main)
        
        main.button.setBackgroundImage(main.image!, for: .normal)
        
        self.backgroundColor = .red
              
              self.addSubview(main.button)
        
    }
    
    
}
