//
//  String+Extension.swift
//  iOS
//
//  Created by Shubham Jitiya on 01/06/23.
//

import UIKit

extension String {
    
    func validateEmail() -> Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        guard !trimmedString.isEmpty else { return false }
        
        let emailRegex = "^[A-Za-z0-9.]+@[A-Za-z0-9]+\\.[A-Za-z]{2,64}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: trimmedString)
    }
}
