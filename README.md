# SGYKVCSafeNSObject
### This library provides an extension on NSObject that allows the use of key value coding without fear of exceptions.  This is particularly useful for Swift, where ObjC's @try/@catch blocks cannot be used.  The provided methods catch any key value exceptions and populate an `NSError` object instead of throwing an exception.

#### Usage
Usage is simple.  First import:

````swift
import SGYKVCSafeNSObject
````

Then use key value coding as before by optionally passing `NSError`:

```swift
let object = NSObject()
var error: NSError?
object.setValue("any value", forKey: "not a key", error:&error)
if let error = error { NSLog("Key value assignment error: \(error.localizedDescription).") }
```

#### Known Issues
* When using *valueForKey:* or *valueForKeyPath:* the exception is not returned in a userInfo dictionary.  During testing attempting to pass the caught `NSException` in these methods seems to randomly cause an EXC_BAD_ACCESS.  So to maintain safety the exception object is not packed into a userInfo dictionary until I can nail down the reason.
