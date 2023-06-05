//
//  Helper.swift
//  iOS
//
//  Created by Shubham Jitiya on 16/05/23.
//

import Foundation
import MapKit

struct Helper {
    
}

// MARK: Functions
extension Helper {
    static func getGridData() -> [String] {
        return [
            "Title 1",
            "Title 2",
            "Title 3",
            "Title 4",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
        ]
    }
    
    static func getItems() -> [String] {
        return ["Item 1", "Item 2", "Item 3",  "Item 4"]
    }
    
    static func getWeekdays() -> [String] {
        return ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    }
    
    static func getMonths() -> [String] {
        return ["Jan", "Feb", "March", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"]
    }
    
    static func getCities() -> [String] {
        return ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                            "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                            "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                            "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                            "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    }
    
    static func jsonDecodeArtwork(json: Json) -> [Artwork] {
        guard
            let fileName = Bundle.main.url(forResource: json.fileName, withExtension: json.fileExtension),
            let artworkData = try? Data(contentsOf: fileName) else {
            return []
        }
        do {
            let features = try MKGeoJSONDecoder()
                .decode(artworkData)
                .compactMap{ $0 as? MKGeoJSONFeature }
            let validWorks = features.compactMap(Artwork.init)
            return validWorks
        } catch {
            print("Unexpected error: ", error)
            return []
        }
    }
}

// MARK: Json
extension Helper {
    enum Json: String {
        case publicArt = "PublicArt"
        var fileName: String {
            return rawValue
        }
        var fileExtension: String {
            return "geojson"
        }
    }
}

// MARK: ScheduleMeeting
extension Helper {
    
    static func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: Date())
    }
    
    static func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .none
        formatter.dateFormat = "h:mm a"
        let timeString = formatter.string(from: Date())
        return timeString
    }
    
    static func getTimeZones() -> [String] {
        return [
            "(UTC-12:00) International Date Line West",
            "(UTC-11:00) Coordinated Universal Time-11",
            "(UTC-10:00) Hawaii",
            "(UTC-09:00) Alaska",
            "(UTC-08:00) Pacific Time (US & Canada)",
            "(UTC-07:00) Arizona",
            "(UTC-07:00) Chihuahua, La Paz, Mazatlan",
            "(UTC-07:00) Mountain Time (US & Canada)",
            "(UTC-06:00) Central America",
            "(UTC-06:00) Central Time (US & Canada)",
            "(UTC-06:00) Guadalajara, Mexico City, Monterrey",
            "(UTC-06:00) Saskatchewan",
            "(UTC-05:00) Bogota, Lima, Quito, Rio Branco",
            "(UTC-05:00) Eastern Time (US & Canada)",
            "(UTC-05:00) Indiana (East)",
            "(UTC-04:00) Atlantic Time (Canada)",
            "(UTC-04:00) Caracas, La Paz",
            "(UTC-04:00) Manaus",
            "(UTC-04:00) Santiago",
            "(UTC-03:30) Newfoundland",
            "(UTC-03:00) Brasilia",
            "(UTC-03:00) Buenos Aires, Georgetown",
            "(UTC-03:00) Greenland",
            "(UTC-02:00) Mid-Atlantic",
            "(UTC-01:00) Azores",
            "(UTC-01:00) Cape Verde Is.",
            "(UTC+00:00) Casablanca",
            "(UTC+00:00) Coordinated Universal Time",
            "(UTC+00:00) Dublin, Edinburgh, Lisbon, London",
            "(UTC+00:00) Monrovia, Reykjavik",
            "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna",
            "(UTC+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague",
            "(UTC+01:00) Brussels, Copenhagen, Madrid, Paris",
            "(UTC+01:00) Sarajevo, Skopje, Warsaw, Zagreb",
            "(UTC+01:00) West Central Africa",
            "(UTC+02:00) Amman",
            "(UTC+02:00) Athens, Bucharest, Istanbul",
            "(UTC+02:00) Beirut",
            "(UTC+02:00) Cairo",
            "(UTC+02:00) Harare, Pretoria",
            "(UTC+02:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius",
            "(UTC+02:00) Jerusalem",
            "(UTC+02:00) Minsk",
            "(UTC+02:00) Windhoek",
            "(UTC+03:00) Baghdad",
            "(UTC+03:00) Kuwait, Riyadh",
            "(UTC+03:00) Moscow, St. Petersburg, Volgograd",
            "(UTC+03:00) Nairobi",
            "(UTC+03:30) Tehran",
            "(UTC+04:00) Abu Dhabi, Muscat",
            "(UTC+04:00) Baku",
            "(UTC+04:00) Port Louis",
            "(UTC+04:00) Tbilisi",
            "(UTC+04:00) Yerevan",
            "(UTC+04:30) Kabul",
            "(UTC+05:00) Ashgabat, Tashkent",
            "(UTC+05:00) Ekaterinburg",
            "(UTC+05:00) Islamabad, Karachi",
            "(UTC+05:30) Chennai, Kolkata, Mumbai, New Delhi",
            "(UTC+05:45) Kathmandu",
            "(UTC+06:00) Astana",
            "(UTC+06:00) Dhaka",
            "(UTC+06:30) Yangon (Rangoon)",
            "(UTC+07:00) Bangkok, Hanoi, Jakarta",
            "(UTC+07:00) Krasnoyarsk",
            "(UTC+08:00) Beijing, Chongqing, Hong Kong, Urumqi",
            "(UTC+08:00) Irkutsk",
            "(UTC+08:00) Kuala Lumpur, Singapore",
            "(UTC+08:00) Perth",
            "(UTC+08:00) Taipei",
            "(UTC+08:00) Ulaanbaatar",
            "(UTC+09:00) Osaka, Sapporo, Tokyo"]
    }
    
    static func getFrequencyOfMeeting() -> [String] {
        return ["Daily", "Do not repeat"]
    }
    
    static func getRemainders() -> [String] {
        return ["15 minutes before", "30 minutes before", "45 minutes before", "1 hour before"]
    }
    
    static func getDuration(minutes: Int, hour: Int, interval: Int) -> [String] {
        var time: [String] = []
        for hr in 0..<hour {
            for min in stride(from: 0, through: minutes, by: interval) {
                let formattedHour = String(format: "%02d", hr)
                let formattedMinutes = String(format: "%02d", min)
                if hr == 0 && min == 0 {
                    continue
                } else if hr == 0 && min != 0 {
                    time.append(formattedMinutes + " minutes")
                } else {
                    time.append(formattedHour + " hour " + formattedMinutes + " minutes")
                }
            }
        }
        time.append(String(hour) + " hour 00 minutes")
        return time
    }
    
    // MARK: Validation
    static func isDateLessThanYear(_ dateString: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        guard let date = dateFormatter.date(from: dateString) else {
            return false
        }
        let calendar = Calendar.current
        let oneYearLater = calendar.date(byAdding: .year, value: 1, to: Date())
        return date <= oneYearLater!
    }
    
    static func getUserImages() -> [String] {
        return ["user_1", "user_2", "user_3", "user_4", "user_5", "user_5", "user_5"]
    }
    
    static func getRandomPeopleImage() -> UIImageView {
        let imageNames = ["user_1", "user_2", "user_3", "user_4", "user_5", "user_5", "user_5"]
        return UIImageView(image: UIImage(named: imageNames.randomElement() ?? imageNames[0]))
    }
}
