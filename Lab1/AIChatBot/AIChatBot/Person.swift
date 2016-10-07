//
//  Person.swift
//  AIChatBot
//
//  Created by Nikita Khomitsevich on 10/6/16.
//  Copyright © 2016 cybervisiontech. All rights reserved.
//

import UIKit

class Person {

    internal var name: String?
    internal var surname: String?
    
    required init(name: String?, surname: String?) {
        self.name = name
        self.surname = surname
    }
    
    convenience init() {
        self.init(name: "", surname: "")
    }
    
}
