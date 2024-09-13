# Lifehacks (SwiftUI) - Study Case

Lifehacks is an iOS app developed using SwiftUI, following the [SwiftUI Structural Foundations course](https://matteomanferdini.com/products/swiftui-structural-foundations/) by Matteo Manferdini. This project implements various software design principles, patterns, and best practices using SwiftUI.

## Course Overview

The course consists of seven comprehensive modules that cover the essentials of building robust, scalable, and maintainable iOS apps with SwiftUI. Each module focuses on different aspects of SwiftUI development, such as software design principles, view composition, data flow, user interaction, navigation, and more.

## Modules and Content

The app development journey is divided into the following modules:

### 1. Software Design Principles and Structural Patterns

- **1.1** - Architecture: The fundamental concept nobody talks about  
- **1.2** - MVC and MVVM: The structural design patterns at the base of any iOS app  
- **1.3** - Wireframes and Mockups: Defining an app's structure before writing code *(Hands-on)*  
- **1.4** - Structures and Classes: The two fundamental abstractions of the Swift language  
- **1.5** - Domain Business Logic: Applying the three fundamental principles of software design *(Hands-on)*  

### 2. Modularizing SwiftUI View Code

- **2.1** - Core Components of SwiftUI: Creating views and populating them with data  
- **2.2** - Functions and Closures: Commonly used yet often misunderstood Swift features  
- **2.3** - View Composition: Editing SwiftUI views and providing data to Xcode previews *(Hands-on)*  
- **2.4** - Stacks and Groups: Laying out content in SwiftUI  
- **2.5** - Basic View Layout: Breaking UI code into modular, reusable views *(Hands-on)*  

### 3. View Modifiers and Complex Layouts

- **3.1** - SwiftUI Layout Process: Arranging views in complex user interfaces  
- **3.2** - Managing a Growing Codebase: Tools and techniques for organizing and navigating an Xcode project *(Hands-on)*  
- **3.3** - Modifying Views and Chaining Methods: Making view modifiers possible in SwiftUI  
- **3.4** - Custom View Modifiers: Managing layouts and reusing code across SwiftUI views *(Hands-on)*  

### 4. Adding Events and Data Flow

- **4.1** - User Interaction and Events: Capturing variables in Swift closures to affect state  
- **4.2** - State and Data Flow: Updating the SwiftUI view tree and storing data in a single source of truth  
- **4.3** - Responding to User Actions: Updating the single source of truth at the root of the view tree *(Hands-on)*  
- **4.4** - Chaining SwiftUI Bindings: Propagating user input up the view hierarchy *(Hands-on)*  

### 5. Interactive Interfaces with Dynamic Data

- **5.1** - Interactive Lists: The most common SwiftUI structured interface for dynamic data  
- **5.2** - Data Flow in Structured Interfaces: Selecting, reordering, and deleting rows in SwiftUI Lists *(Hands-on)*  
- **5.3** - Updating Data in SwiftUI Lists: Structuring view hierarchy and sharing functionality *(Hands-on)*  

### 6. Navigation and Data Flows

- **6.1** - Structural Paradigms: Scenes, navigation views, and modal presentation modifiers  
- **6.2** - Structuring App Navigation: Designing an app’s main navigation flow *(Hands-on)*  
- **6.3** - Extending Navigation with Modal Contexts: Handling user actions and data editing *(Hands-on)*  
- **6.4** - SwiftUI Environment: Propagating data in a deep view hierarchy  
- **6.5** - Data Flow in Deep Hierarchies: Custom environment values and modifiers *(Hands-on)*  

### 7. Structuring a Fully-Featured iOS App

- **7.1** - Identity and Shared State: Connecting SwiftUI views to local and global objects  
- **7.2** - Controller Hierarchies: Sharing state and core features across the navigation structure *(Hands-on)*  
- **7.3** - SwiftUI App Architecture: Expanding MVC and MVVM patterns for state and navigation management  
- **7.4** - Information Flow: Coordinating navigation, networking, and state management *(Hands-on)*  
- **7.5** - Effective SwiftUI Previews: Mocking and dependency management *(Hands-on)*  

## Version Control

Throughout the course, I followed a version control strategy to track progress and maintain clean, organized commits for each code change. Each sub-module has a corresponding Git tag for easy reference. For example:

- **Sub-module Tags**: `module-1_1`, `module-2_3`, `module-4_2`, etc.
- **Module Completion Tags**: `module-1`, `module-2`, `module-3`, etc.

## How to Run the App

1. Clone the repository:

  ```bash
  git clone https://github.com/yourusername/lifehacks.git
  ```

2. Checkout the latest module tag:

  ```bash
  git checkout module-7
  ```

3. Open the project in Xcode.

4. Build and run the app on the simulator or a physical device.

## License

This project is a learning exercise based on the course by Matteo Manferdini. It is not intended for production use.

## Acknowledgments

[Matteo Manferdini](https://matteomanferdini.com/) for providing the excellent SwiftUI Structural Foundations course.
