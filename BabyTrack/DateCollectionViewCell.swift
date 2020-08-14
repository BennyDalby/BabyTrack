//
//  DateCollectionViewCell.swift
//  BabyTrack
//
//  Created by Test on 7/22/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit
import ViewAnimator


class DateCollectionViewCell: UICollectionViewCell {
    
    
    let cellID = "activityCell"
    
    var activityList = [Activity?]()
   // var activityList2 = [Activity]()
//    var dateActivityDict = [Date:[Activity?]]()
//    var dateList = [Date]()
    
    @IBOutlet weak var activityTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
      //  self.contentView.layer.cornerRadius = 20.0
      //  self.contentView.layer.masksToBounds = true
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            self.animate()
        }
        
        activityTableView.delegate = self
        activityTableView.dataSource = self
      //  activityTableView.register(ActivityTableViewCell.self, forCellReuseIdentifier:cellID)

        
        let cellNib = UINib(nibName: "ActivityTableViewCell", bundle: nil)
           activityTableView.register(cellNib, forCellReuseIdentifier: cellID)
        
        
        //populateCellContents1()
        //populateCellContents2()
       
       // dateList = Array(dateActivityDict.keys)
       // dateList.sort()
       
    }
    /*
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
        
        let diaperAct = DiaperActivity(title: "Diaper", status: "Pee", time: "2:30 AM", color: UIColor.yellow, desc: " He peed on my face !!  :| ",image: UIImage(named: "diaper")!)
        let activity1 = Activity(activitytype: .DiaperActivity,diaperActivity:diaperAct )
        
        
        let diaperAct2 = DiaperActivity(title: "Feed", status: "Formulae Drink", time: "40 mins", color: UIColor.white, desc: "110 ml of Geantllease drink",image: UIImage(named: "feed")!)
               
               let activity2 = Activity(activitytype: .DiaperActivity,diaperActivity:diaperAct2 )
        
        
        let diaperAct3 = DiaperActivity(title: "Pump", status: "Breast pump", time: "40 mins", color: UIColor.white, desc: " Pumped both breast for 40 mins",image: UIImage(named: "pump")!)
               
               let activity3 = Activity(activitytype: .DiaperActivity,diaperActivity:diaperAct3 )
        
        let diaperAct4 = DiaperActivity(title: "Sleep", status: "Sleeping", time: "2 hrs", color: UIColor.white, desc: "Slept on Elna's shoulder",image: UIImage(named: "sleep")!)
                      
                      let activity4 = Activity(activitytype: .DiaperActivity,diaperActivity:diaperAct4 )
        
        
        
        activityList1.append(activity1)
        activityList1.append(activity2)
        activityList1.append(activity3)
        activityList1.append(activity4)
        
     
         let yesterday = Date().addingTimeInterval(-86400)
        
        dateActivityDict[yesterday] = activityList1
        
    }
    
    */
    
   
    func animate() {
            // Combined animations example
            let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
            let zoomAnimation = AnimationType.zoom(scale: 0.2)
            let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/6)
            UIView.animate(views: activityTableView.visibleCells,
                           animations: [zoomAnimation, rotateAnimation],
                           duration: 1.0)
            
            UIView.animate(views: activityTableView.visibleCells,
                           animations: [fromAnimation, zoomAnimation], delay: 0.0)
        }
    }



extension DateCollectionViewCell : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        200.0
    }
        
}

extension DateCollectionViewCell : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        activityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ActivityTableViewCell
        
        
        let activity = activityList[indexPath.row]
        
        cell.statusLabel.text = activity?.diaperActivity?.status
        cell.timeLabel.text = activity?.diaperActivity?.time
        cell.resultColor.backgroundColor = activity?.diaperActivity?.color
        cell.descLabel.text = activity?.diaperActivity?.desc
        cell.titleheader.text = activity?.diaperActivity?.title
        cell.titleheader.textColor = activity?.diaperActivity?.color
        cell.activity_image.image = activity?.diaperActivity?.image
        
        
        cell.backgroundColor = UIColor(red: 253.0/255.0, green: 255.0/255.0, blue: 166.0/255.0, alpha: 1.0)
        
        if indexPath.row % 2 == 0 {
            
            cell.contentView.backgroundColor = .systemGreen
          //  cell.activity_image.image = UIImage(named:"diaper")
        }
        
        else {
            
            cell.contentView.backgroundColor = .systemTeal
           // cell.activity_image.image = UIImage(named:"feed")
        }
        
        
        return cell
    }
    
    
    
}

public enum ActivityType {
    
    case DiaperActivity
    case FeedActivity
    case pumpingActivity
    case sleepActivity
}


public struct Activity {
    
    var activitytype : ActivityType
    var diaperActivity :  DiaperActivity?
    var feedActivity : FeedActivity?
    var pumpActivity : PumpingActivity?
    var sleepActivity : SleepActivity?
    
}


public struct DiaperActivity{
    
    var title = String()
    var status  = String()
    var time = String()
    var color = UIColor()
    var desc = String()
    var image = UIImage()
}

public struct FeedActivity {
    
    var title = String()
    var status = String()
    var duration = String()
    var amount = String()
    var type  = String()
    var desc = String()
    
}

public struct PumpingActivity {
    
    var duration = String()
    var time = String()
    
}

public struct SleepActivity {
    
    var duration = String()
}
