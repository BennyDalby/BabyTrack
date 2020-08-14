//
//  ViewController.swift
//  BabyTrack
//
//  Created by Test on 7/21/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit

import Macaw
import CardsLayout
import UPCarouselFlowLayout


class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var baby_profile: UIImageView!
    @IBOutlet weak var calendarDeckView: UICollectionView!
    @IBOutlet weak var menuView: MenuItem!
    let cellID = "dateCell"
    
    var dateActivityDict = [Date:[Activity?]]()
     var dateList = [Date]()
    var activityList1 = [Activity]()
      var activityList2 = [Activity]()
    
    @IBAction func addButtonClicked(_ sender: Any) {
        
      let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "optionController") as! OptionViewController
            
             self.present(nextViewController, animated:true, completion:nil)
        
    }
    @IBOutlet weak var addButton: UIButton!
    override func viewDidLoad() {
           super.viewDidLoad()
           
        calendarDeckView.delegate = self
        calendarDeckView.dataSource = self
       
        calendarDeckView.collectionViewLayout = CardsCollectionViewLayout()
        
        calendarDeckView.isPagingEnabled = true
        calendarDeckView.showsHorizontalScrollIndicator = false
        calendarDeckView.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                   
            self.calendarDeckView.isHidden = false
               }
        
         calendarDeckView.register(UINib(nibName: "DateCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: cellID)
        
//        calendarDeckView.backgroundView = UIImageView(image: UIImage(named: "bgImage.jpg"))
//        calendarDeckView.contentMode = .scaleAspectFill
//
//        view.backgroundColor = UIColor(patternImage: UIImage(named: "bgImage.jpg")!)
//        view.contentMode = .scaleAspectFill
        
        
        view.backgroundColor = UIColor(red: 255/255, green: 215/255, blue: 74/255, alpha: 1.0)
        
        calendarDeckView.backgroundColor =
        UIColor(red: 255/255, green: 215/255, blue: 74/255, alpha: 1.0)
        
        baby_profile.layer.cornerRadius = baby_profile.frame.size.height/2
        baby_profile.layer.masksToBounds = true
        
        
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        addButton.layer.masksToBounds = false
        addButton.layer.shadowOpacity = 0.44
        
        populateCellContents1()
        populateCellContents2()
        
        dateList = Array(dateActivityDict.keys)
        dateList = dateList.sorted { $0 > $1 }
    }
    
    
    func populateCellContents1() {
        
        let diaperAct = DiaperActivity(title: "Diaper", status: "Pee", time: "2:30 AM", color: UIColor.yellow, desc: " He peed on my face !!  :| ",image: UIImage(named: "diaper")!)
        let activity1 = Activity(activitytype: .DiaperActivity,diaperActivity:diaperAct )
        
        
        let diaperAct2 = DiaperActivity(title: "Feed", status: "Formulae Drink", time: "40 mins", color: UIColor.white, desc: "110 ml of Geantllease drink",image: UIImage(named: "feed")!)
               
               let activity2 = Activity(activitytype: .DiaperActivity,diaperActivity:diaperAct2 )
        
        
        let diaperAct3 = DiaperActivity(title: "Pump", status: "Breast pump", time: "40 mins", color: UIColor.white, desc: " Pumped both breast for 40 mins",image: UIImage(named: "pump")!)
               
               let activity3 = Activity(activitytype: .DiaperActivity,diaperActivity:diaperAct3 )
        
        let diaperAct4 = DiaperActivity(title: "Sleep", status: "Sleeping", time: "2 hrs", color: UIColor.white, desc: "Slept on Elna's shoulder",image: UIImage(named: "sleep")!)
                      
                      let activity4 = Activity(activitytype: .DiaperActivity,diaperActivity:diaperAct4 )
        
        
        
        activityList2.append(activity1)
        activityList2.append(activity2)
        activityList2.append(activity3)
        activityList2.append(activity4)
        
        
      //  let now = Calendar.current.dateComponents(in: .current, from: Date())
        
        let now = Date()
       

        
        dateActivityDict[now] = activityList2
        
    }
    
    
    func populateCellContents2() {
        
        let diaperAct = DiaperActivity(title: "TEST DIAPER", status: "Pee", time: "2:30 AM", color: UIColor.yellow, desc: " He peed on my face !!  :| ",image: UIImage(named: "diaper")!)
        let activity1 = Activity(activitytype: .DiaperActivity,diaperActivity:diaperAct )
        
        
        let diaperAct2 = DiaperActivity(title: "TEST FEED", status: "Formulae Drink", time: "40 mins", color: UIColor.white, desc: "110 ml of Geantllease drink",image: UIImage(named: "feed")!)
               
               let activity2 = Activity(activitytype: .DiaperActivity,diaperActivity:diaperAct2 )
        
        
        let diaperAct3 = DiaperActivity(title: "TEST Pump", status: "Breast pump", time: "40 mins", color: UIColor.white, desc: " Pumped both breast for 40 mins",image: UIImage(named: "pump")!)
               
               let activity3 = Activity(activitytype: .DiaperActivity,diaperActivity:diaperAct3 )
        
        let diaperAct4 = DiaperActivity(title: "TEST Sleep", status: "Sleeping", time: "2 hrs", color: UIColor.white, desc: "Slept on Elna's shoulder",image: UIImage(named: "sleep")!)
                      
                      let activity4 = Activity(activitytype: .DiaperActivity,diaperActivity:diaperAct4 )
        
        
        
        activityList1.append(activity1)
        activityList1.append(activity2)
        activityList1.append(activity3)
        activityList1.append(activity4)
        
     
         let yesterday = Date().addingTimeInterval(-86400)
        
        dateActivityDict[yesterday] = activityList1
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

              return CGSize(width:collectionView.frame.width, height: collectionView.frame.height)
                }
        

    
}

extension ViewController : UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          
    }
    
    
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dateList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! DateCollectionViewCell
        
      //  print(cell.frame)
        cell.contentView.layer.cornerRadius = 20.0
        cell.contentView.layer.masksToBounds = true
        cell.activityList = dateActivityDict[dateList[indexPath.row]]!
        if indexPath.row % 2 == 0 {
            
            cell.contentView.backgroundColor = .systemIndigo
            
        }
        
        else {
            
            cell.contentView.backgroundColor = .systemTeal
        }
        
        return cell
        
    }
    
    
    
  
    
}
