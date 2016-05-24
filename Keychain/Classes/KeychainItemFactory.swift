//
//  KeychainItemFactory.swift
//  Pods
//
//  Created by Ardalan Samimi on 24/05/16.
//
//
import Foundation

struct KeychainItemFactory {
  
  static func load(itemClass: KeychainItemClass = .GenericPassword) -> [KeychainItem] {
    let query: [String: AnyObject] = [
      kSecClass as String               : itemClass.rawValue as String,
      kSecMatchLimit as String          : kSecMatchLimitAll,
      kSecReturnData as String          : kCFBooleanTrue,
      kSecReturnAttributes as String    : kCFBooleanTrue,
      kSecAttrSynchronizable as String  : kSecAttrSynchronizableAny
    ]
    
    let result = Keychain.load(query)
    var items: [KeychainItem] = []
    
    if result.success {
      if let array = result.data as? NSArray {
        for dict in array {
          if dict is [String : AnyObject] {
            let item = KeychainItem(withItemClass: .InternetPassword, attributeDictionary: dict as! [String : AnyObject])
            items.append(item)
          }
        }
      }
    }
    
    return items
  }
  
}