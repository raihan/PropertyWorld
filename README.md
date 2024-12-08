Property World
--
Thanks for sending me the assignment.

**Note: Please use Xcode 16+ to run the project.**

For this assignment, I developed the “PropertyWorld” app, which fetches and displays a list of properties using the provided API. Each property item showcases its name, type, address, and an image carousel. Upon selecting a property, the app presents detailed information, including an image carousel, property name, ratings, policies, a description, check-in times, reviews, a map location, and directions to the property.


**📦 Inrernal packages dependency structure:**

<img src="https://github.com/user-attachments/assets/6db05bac-c7af-4471-8911-c8af8fb45a79" width="700"/>

#### In this project:
- To ensure the app structure is scalable, I implemented a modular architecture by dividing the app into multiple Swift Package Manager (SPM) packages. These include the main target, UIComponents, Property API, API Service, and Models:
  - **Main target:** Contains assets and feature-specific implementations.
  - **UIComponents:** Hosts reusable UI components and view modifiers.
  - **Property API:** Manages property-related APIs, such as fetching property lists and details.
  - **API Service:** Handles API consumption and is designed for easy expansion in the future.
  - **Models:** Stores networking models and data structures.
- **Benefits of this structure:**
  - In medium to large sized teams, modularity reduces merge conflicts in the project file when working on new features.
  - Build times are significantly faster because changes made to a specific package only require that package to be rebuilt, while the rest of the packages remain cached. This not only enhances development efficiency but also reduces CI runtime, which can save costs over time by minimizing resource usage. 
- Developed the UI using `SwiftUI`.
- Followed the `MVVM` architecture.
- Used `Async-Await` for networking.
- Created an `ApiService` class to handle API consumption, with scalability in mind for future expansion.
- Handled errors with the new `Typed throws` feature.
- Wrote unit tests using the latest `Swift Testing` framework and added test cases for features, property Api and Api service layers.

If you have any questions, don’t hesitate to reach out. Have a great day!


#### Property World App Demo:
https://github.com/user-attachments/assets/fd08135c-5195-4ec2-98ec-6f6c7eb7ce7e

