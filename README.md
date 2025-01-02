## Demo
- Explanation of demo
  - First step showing a text from server and update it by changing it properties like fontsize and font weight.
  - Second step showing a scrollable list vertially contains four Cards
  - Third step: converted that scrollable list from vertical to horizontal.
  - NOTE: server used: Github pages. So, every time I updated some data and it'll take some time to able to show that updated data when we hit the url. 

https://github.com/user-attachments/assets/3c5e85db-467f-41b2-8092-bfa87d8b3c88



# Server-Driven UI in Flutter (APPROACH)

This project demonstrates an architecture for implementing a Server-Driven UI in Flutter. By using this approach, UI updates can be handled dynamically from the server without requiring app updates.

# Features
Dynamically render UI components such as Text, Row, Column, Container, ListView, NetworkImage, and Spacer.
Centralized parsing of server-driven JSON configurations.
Organized architecture for clear separation of concerns.


# Architecture Overview

## Constants
- constants.dart
  - Contains URLs for server calls.

## Core
- component_parser.dart
  - Handles JSON deserialization and parses server responses into Flutter-compatible UI components.
- component.dart
  - Defines abstract and concrete classes for UI components, including IComponent, IComponentStyle, and IComponentData.

### Model
- individual_component_model.dart
  - Represents individual UI components and their configurations.

## Domain
- api_provider.dart
  - Uses dio for handling API requests to fetch UI configurations from the server.

## Presentation
- home.dart
  - Entry point for rendering the UI.
  - Makes API calls, parses the response, and initializes the ComponentModel.
- component_builder.dart
  - Dynamically maps IComponent types to their respective UI builders.
- individual_component_builder.dart
  - Individual Builders (e.g., text_builder.dart, row_builder.dart)
  - Render specific UI components based on their configurations.

## UI Rendering Flow

API Call: The app fetches a JSON configuration from the server.

Parsing: The JSON is parsed by component_parser.dart into a ComponentModel.

Rendering: The ComponentBuilder dynamically renders the UI components based on the parsed data.

Sample json for text component: 
```
{
    "children": [
        {
            "type": "text",
            "data": {
                "text": "Welcome to Server-Driven UI"
            },
            "style": {
                "fontSize": 18.0,
                "fontColor": "080c14",
                "fontWeight": "bold"
            }
        }
    ]
}
```


## Key Classes and Their Roles

- component_parser.dart
  - JsonDeserializer
    - Converts JSON into a ComponentModel.
    - Parses individual components based on their type.

- component.dart
  - IComponent
    - Abstract base class for all components.
    - Includes type, data, style, and isVisible properties.

  - IComponentStyle
    - Abstract base class for styling components.

  - IComponentData
    - Abstract base class for component data.

  - ComponentDataWrapper
    -A sealed class for wrapping single or multiple component data objects.

- component_builder.dart
  - Dynamically selects and renders the appropriate builder based on the component type.
    Example Component: TextComponent

### Model

- TextComponentData
  - Stores the text to be displayed.
- TextComponentStyle
  - Contains style properties such as fontSize, fontColor, and fontWeight.

### Builder
- The TextBuilder renders a Text widget with the specified data and style.

## Advantages of the Approach

Dynamic Updates: UI changes can be made without requiring app updates.

Scalable: Easily extendable to support new components.

Separation of Concerns: Clear distinction between data parsing, logic, and presentation layers.

Customizable: Each component can have its own builder and style configurations.

## Disadvantages of the Approach

Performance Overhead: Parsing large JSON files at runtime can impact app performance.

Debugging Complexity: Debugging issues related to incorrect JSON or component rendering can be challenging.

Increased Maintenance: Keeping server-side JSON and client-side parsing logic in sync requires effort.

Potential for Large JSON: For complex UIs, the JSON configuration can become very large and difficult to manage.

## Future Enhancements

Support for more complex components (e.g., forms, sliders).


#### Other Ways, Using existing libraries on pub.dev
- https://pub.dev/packages/divkit
- https://pub.dev/packages/mirai
- https://pub.dev/packages/shark
- https://pub.dev/packages/serve_dynamic_ui

Add action handling for interactive components.

Optimize JSON parsing and error handling.


