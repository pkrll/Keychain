//
//  KeychainItemFactory.swift
//  Pods
//
//  Created by Ardalan Samimi on 24/05/16.
//
//
import Foundation

public struct KeychainItemFactory {
  
  public static func load(query: [String: AnyObject]) -> [KeychainItem] {
    let result = Keychain.load(query)
    var items: [KeychainItem] = []
    
    if result.success {
      if let array = result.data as? NSArray {
        for dict in array {
          if dict is [String : AnyObject] {
            let item = KeychainItem(attributeDictionary: dict as! [String : AnyObject])
            items.append(item)
          }
        }
      }
    }
    
    return items
  }
  
}