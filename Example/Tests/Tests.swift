import UIKit
import XCTest
import Keychain

class Tests: XCTestCase {
  
  var basicTestKey: String = ""
  
  override func setUp() {
    super.setUp()
    self.basicTestKey = "Basic key"
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    XCTAssert(true, "Pass")
  }
  
  func testBasicSave() {
    let didSave = Keychain.save("some value", forKey: self.basicTestKey)
    XCTAssert(didSave, "testBasicSave()")
  }
  
  func testBasicLoad() {
    if Keychain.save("some value", forKey: self.basicTestKey) {
      if let _ = Keychain.load(self.basicTestKey) {
        XCTAssert(true, "Pass: testBasicLoad()")
      } else {
        XCTAssert(false, "Failed basic load test. Could not load.")
      }
    } else {
      XCTAssert(false, "Failed basic load test. Could not save.")
    }
  }
  
  func testBasicDelete() {
    if Keychain.save("some value", forKey: self.basicTestKey) {
      let didDelete = Keychain.delete(self.basicTestKey)
      XCTAssert(didDelete, "Pass: testBasicDelete()")
    } else {
      XCTAssert(false, "Failed basic load test. Could not save.")
    }
  }
  
  func testAdvancedSave() {
    let value = "Some value"
    
    let attributes: [String: AnyObject] = [
      kSecClass as String       : kSecClassGenericPassword as String as String as AnyObject,
      kSecAttrAccount as String : "Some Account" as AnyObject,
      kSecAttrService as String : "Some Service" as AnyObject,
      kSecValueData as String   : value.data(using: String.Encoding.utf8, allowLossyConversion: false)! as AnyObject
    ]
    
    let result = Keychain.save(attributes)
    
    XCTAssert(result.success, "testAdvancedSave: OSStatus \(result.statusCode)")
  }
  
  func testAdvancedLoad() {
    let value = "Some value"
    let attributes: [String: AnyObject] = [
      kSecClass as String       : kSecClassGenericPassword as String as String as AnyObject,
      kSecAttrAccount as String : "Some Account" as AnyObject,
      kSecAttrService as String : "Some Service" as AnyObject,
      kSecValueData as String   : value.data(using: String.Encoding.utf8, allowLossyConversion: false)! as AnyObject
    ]
    
    let result = Keychain.save(attributes)
    
    if result.success {
      let query: [String: AnyObject] = [
        kSecClass as String       : kSecClassGenericPassword as String as String as AnyObject,
        kSecMatchLimit as String  : kSecMatchLimitOne,
        kSecReturnData as String  : kCFBooleanTrue,
        kSecAttrService as String : "Some Service" as AnyObject,
        kSecAttrAccount as String : "Some Account" as AnyObject
      ]
      
      let result = Keychain.load(query)
      XCTAssert(result.success, "testAdvancedLoad: OSStatus \(result.statusCode)")
    } else {
      XCTAssert(false, "Failed advanced load test: Could not save.")
    }
  }
  
  func testAdvancedDelete() {
    let value = "Some value"
    let attributes: [String: AnyObject] = [
      kSecClass as String       : kSecClassGenericPassword as String as String as AnyObject,
      kSecAttrAccount as String : "Some Account" as AnyObject,
      kSecAttrService as String : "Some Service" as AnyObject,
      kSecValueData as String   : value.data(using: String.Encoding.utf8, allowLossyConversion: false)! as AnyObject
    ]
    
    let result = Keychain.save(attributes)
    
    if result.success {
      let query: [String: AnyObject] = [
        kSecClass as String       : kSecClassGenericPassword as String as String as AnyObject,
        kSecAttrService as String : "Some Service" as AnyObject,
        kSecAttrAccount as String : "Some Account" as AnyObject
      ]
      
      let result = Keychain.delete(query)
      XCTAssert(result.success, "testAdvancedDelete: OSStatus \(result.statusCode)")
    } else {
      XCTAssert(false, "Failed advanced delete test: Could not save.")
    }
  }
  
  func testKeychainItemSave() {
    let kItem = KeychainItem(itemClass: KeychainItemClass.genericPassword)
    kItem.account = "Test User"
    kItem.service = "Testing Site"
    kItem.label = "Testing label"
    kItem.value = "someTestingPassword"
    kItem.synchronizable = false
    
    if kItem.save() {
      XCTAssert(true, "Pass: testKeychainItemSave()")
    } else {
      XCTAssert(false, "Failed KeychainItem save test: OSStatus \(kItem.OSStatusCode)")
    }
  }
  
//  func testKeychainItemUpdate() {
//    let kItem = KeychainItem(withItemClass: KeychainItemClass.GenericPassword)
//    kItem.account = "Test User"
//    kItem.service = "Testing Site"
//    kItem.label = "Testing label"
//    kItem.value = "someTestingPassword"
//    kItem.synchronizable = false
//    
//    if kItem.save() {
//      kItem.value = "A new value"
//      
//      if kItem.update() {
//        XCTAssert(true, "Pass: testKeychainItemUpdate()")
//      } else {
//        XCTAssert(false, "Failed KeychainItem update test: OSStatus \(kItem.searchQuery)")
//      }
//    } else {
//      XCTAssert(false, "Failed KeychainItem update test: Could not save: OSStatus \(kItem.OSStatusCode)")
//    }
//  }
  
  func testKeychainItemLoad() {
    let kItem = KeychainItem(itemClass: KeychainItemClass.genericPassword)
    kItem.account = "Test User"
    kItem.service = "Testing Site"
    kItem.label = "Testing label"
    kItem.value = "someTestingPassword"
    kItem.synchronizable = false
    
    if kItem.save() {
      let query: [String: AnyObject] = [
        kSecClass as String                 : KeychainItemClass.genericPassword.rawValue as String as AnyObject,
        kSecMatchLimit as String            : kSecMatchLimitAll,
        kSecMatchCaseInsensitive as String  : kCFBooleanTrue,
        kSecReturnData as String            : kCFBooleanTrue,
        kSecReturnAttributes as String      : kCFBooleanTrue,
        kSecAttrSynchronizable as String    : kSecAttrSynchronizableAny
      ]
      
      let items = KeychainItemFactory.load(query)
      XCTAssert(items.count > 0, "Pass: testKeychainItemLoad()")
    } else {
      XCTAssert(false, "Failed KeychainItem load test: Could not save: OSStatus \(kItem.OSStatusCode)")
    }
  }
  
}
