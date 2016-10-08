//
//  Integer+Operators.swift
//  AIChatBot
//
//  Created by Nikita Khomitsevich on 10/8/16.
//  Copyright © 2016 cybervisiontech. All rights reserved.
//

import UIKit

extension Int {
    static postfix func ++ (left: inout Int) {
        left = left + 1
    }
}
