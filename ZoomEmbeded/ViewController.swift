//
//  ViewController.swift
//  ZoomEmbeded
//
//  Created by Fauzi Fauzi on 14/09/20.
//  Copyright © 2020 defauloper. All rights reserved.
//

import UIKit
import MobileRTC

class ViewController: UIViewController {
    
let meetingNo = "73813154473"
let kSDKUserName = "ujik ahmad"
    override func viewDidLoad() {
    super.viewDidLoad()
        
    if(self.meetingNo == "") {
          // If the meeting number is empty, return error.
           print("Please enter a meeting number")
           return
    } else {
         // If the meeting number is not empty.
         let getservice = MobileRTC.shared().getMeetingService()
         if let service = getservice {
             service.delegate = self
             let paramDict =      [kMeetingParam_Username:kSDKUserName,kMeetingParam_MeetingNumber:meetingNo, kMeetingParam_MeetingPassword:"9KaeCC",kMeetingParam_WebinarToken:"Your Webinar Token"]
             let response = service.joinMeeting(with: paramDict)
             print("onJoinMeeting, response: \(response)")
          }
        }
      }
    
}


extension ViewController: MobileRTCMeetingServiceDelegate{
    func onMeetingStateChange(_ state: MobileRTCMeetingState) {
       print("state \(state)")
    }
}
