//
//  Person.swift
//  NKHoroscope
//
//  Created by Nikita Khomitsevich on 9/24/16.
//  Copyright © 2016 cybervisiontech. All rights reserved.
//

import UIKit

internal class Birthday {
    var day: Int
    var month: Int
    var year: Int
    
    init(day: Int, month: Int, year:Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    convenience init() {
        self.init(day: 1, month: 1, year: 1955)
    }
}

internal class Person {
    
    var name: String
    var surname: String
    var birthday: Birthday
    
    init(name: String, surname: String, birthday: Birthday) {
        self.name = name
        self.surname = surname
        self.birthday = birthday
    }
    
    convenience init(name: String, surname: String) {
        self.init(name: name, surname: surname, birthday: Birthday())
    }
    
    convenience init() {
        self.init(name: "", surname: "", birthday: Birthday())
    }
}
