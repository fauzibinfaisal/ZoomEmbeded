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
let meetingPass = "9KaeCC"
    
let kSDKUserName = "ujik ahmad"
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
    if(self.meetingNo == "") {
        // If the meeting number is empty, return error.
        print("Please enter a meeting number")
        return
    } else {
        
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            let paramDict = [kMeetingParam_Username:self.kSDKUserName,kMeetingParam_MeetingNumber:self.meetingNo, kMeetingParam_MeetingPassword: self.meetingPass]
            let getservice = MobileRTC.shared().getMeetingService()
            if let service = getservice {
                 service.delegate = self
                 
                 let response = service.joinMeeting(with: paramDict)
                 print("onJoinMeeting, response: \(response)")
                
                
            } else {
                print("get service \(getservice)")
            }

        }
         // If the meeting number is not empty.
        }
        
    }
    
}


extension ViewController: MobileRTCMeetingServiceDelegate{
    func onMeetingStateChange(_ state: MobileRTCMeetingState) {
       print("state \(state)")
    }
}
