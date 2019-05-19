//
//  Provider+Type.swift
//  AwareNews
//
//  Created by Adedayo Omosanya on 19/05/2019.
//  Copyright © 2019 Adedayo Omosanya. All rights reserved.
//
import MobileCoreServices
import Social
import UIKit

extension NSItemProvider {
    var isURL: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypeURL as String)
    }
    var isText: Bool {
        return hasItemConformingToTypeIdentifier(kUTTypeText as String)
    }
}
