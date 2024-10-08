# Flash-Chat

![Simulator Screenshot - iPhone 16 - 2024-10-07 at 21 14 29](https://github.com/user-attachments/assets/13b82322-9789-476c-9231-53a6fa95b467)
![Simulator Screenshot - iPhone 16 - 2024-10-07 at 21 14 32](https://github.com/user-attachments/assets/12c8b761-74f3-4371-8086-06041b6d624e)
![Simulator Screenshot - iPhone 16 - 2024-10-07 at 21 17 07](https://github.com/user-attachments/assets/b489f601-b6ab-410f-a224-c088b19c2b25)

# Constants
```
struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}

```
