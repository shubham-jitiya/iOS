//
//  ScheduleMeeting.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/05/23.
//

import UIKit

struct ScheduleMeeting {
    var title: String?
    var description: String?
    var startDate: String?
    var startTime: String?
    var timeZone: String?
    var duration: String?
    var frequency: String?
    var remainder: String?
    var emailModerator: [String]?
    var emailAttendees: [String]?
    var isRequirePassword: Bool?
    var meetingPassword: String?
    var isEnabledChat: Bool?
    var isFacialExpression: Bool?
    var isRecordMeeting: Bool?
    var isEnabledLobby: Bool?
    var isEveryoneMuted: Bool?
    var isStartsHidden: Bool?
}
