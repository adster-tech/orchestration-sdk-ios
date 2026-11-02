//
//  Adster.swift
//  Adster
//
//  Created by Adster on 31/03/25.
//

import Foundation

public struct Adster {
    /// Bundle containing the packaged native-ad nibs.
    public static var resources: Bundle { .module }

    public static func version() -> String {
        return "1.8.0"
    }
}
