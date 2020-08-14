//
//  OptionViewController.swift
//  BabyTrack
//
//  Created by Test on 7/24/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit

class OptionViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    
    let cellID = "optionList"

    @IBOutlet weak var backBUtton: UIButton!
    
    var OptionsList = [OptionsType]()
    
    @IBOutlet weak var optionColectionView: UICollectionView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
override func viewDidLoad() {
       super.viewDidLoad()

       // Do any additional setup after loading the view.
       
       optionColectionView.delegate = self
       optionColectionView.dataSource = self
        
    optionColectionView.register(UINib(nibName: "OptionCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: cellID)
    
    
    view.backgroundColor = UIColor(red: 255/255, green: 215/255, blue: 74/255, alpha: 1.0)
    optionColectionView.backgroundColor = .clear
    
    
    let optionsType1 = OptionsType(image: UIImage(named: "milk-2")!, text: "Feed",textColor: .blue)
     let optionsType2 = OptionsType(image: UIImage(named: "diaper-2")!, text: "Diaper",textColor: .red)
     let optionsType3 = OptionsType(image: UIImage(named: "pump")!, text: "Pumping",textColor: .green)
     let optionsType4 = OptionsType(image: UIImage(named: "sleep")!, text: "Sleep",textColor: .black)
     let optionsType5 = OptionsType(image: UIImage(named: "thermometer")!, text: "Temperature",textColor: .magenta)
     let optionsType6 = OptionsType(image: UIImage(named: "medicine")!, text: "Medication",textColor: .systemBlue)
     let optionsType7 = OptionsType(image: UIImage(named: "notepad")!, text: "Notes",textColor: .lightGray)
    
    OptionsList.append(optionsType1)
    OptionsList.append(optionsType2)
    OptionsList.append(optionsType3)
    OptionsList.append(optionsType4)
    OptionsList.append(optionsType5)
    OptionsList.append(optionsType6)
    OptionsList.append(optionsType7)
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    return CGSize(width:optionColectionView.frame.width/2-10, height: optionColectionView.frame.width/2-10)
   }
}

extension OptionViewController: UICollectionViewDelegate {
    
    
}

extension OptionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! OptionCollectionViewCell
        
       // cell.layer.borderColor = UIColor.gray.cgColor
       // cell.layer.borderWidth = 0.67
        cell.titleLabel.text = OptionsList[indexPath.row].text
        cell.titleImage.image = OptionsList[indexPath.row].image
        cell.titleLabel.textColor = OptionsList[indexPath.row].textColor
        
       
        
//        if indexPath.row % 2 == 0 {
//
//            cell.contentView.backgroundColor = UIColor.magenta
//        }
        
//       if indexPath.row % 3 == 0 {
//
//            cell.contentView.backgroundColor = UIColor.green
//        }
//
//        else {
//
//             cell.contentView.backgroundColor = UIColor.brown
//
//        }
        
        return cell
    }
    
    
    
    
}


struct OptionsType {
    
    var image = UIImage()
    var text = String()
    var textColor = UIColor()
}
