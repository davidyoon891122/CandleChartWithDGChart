//
//  DeviceType.swift
//  TodoProject
//
//  Created by Jiwon Yoon on 2023/01/13.
//

import Foundation

enum DeviceType {
    case iPhoneSE2
    case iPhone8
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone13Pro
    case iPhone13
    case iPhone13ProMax
    case iPhone13Mini
    case iPhone14Pro
    case iPhone14
    case iPhone14ProMax
    case iPhone14Plus

    func name() -> String {
        switch self {
        case .iPhoneSE2:
            return "iPhone SE"
        case .iPhone8:
            return "iPhone 8"
        case .iPhone12Pro:
            return "iPhone 12 Pro"
        case .iPhone12ProMax:
            return "iPhone 12 Pro Max"
        case .iPhone13Pro:
            return "iPhone 13 Pro"
        case .iPhone13:
            return "iPhone 13"
        case .iPhone13ProMax:
            return "iPhone 13 Pro Max"
        case .iPhone13Mini:
            return "iPhone 13 Mini"
        case .iPhone14Pro:
            return "iPhone 14 Pro"
        case .iPhone14:
            return "iPhone 14"
        case .iPhone14ProMax:
            return "iPhone 14 Pro Max"
        case .iPhone14Plus:
            return "iPhone 14 Plus"
        }
    }
}
