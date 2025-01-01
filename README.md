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

## component.dart
- Defines abstract and concrete classes for UI components, including IComponent, IComponentStyle, and IComponentData.

Model

individual_component_model.dart

Represents individual UI components and their configurations.

Domain

api_provider.dart

Uses dio for handling API requests to fetch UI configurations from the server.

Presentation

home.dart

Entry point for rendering the UI.

Makes API calls, parses the response, and initializes the ComponentModel.

Component Builders

component_builder.dart

Dynamically maps IComponent types to their respective UI builders.

Individual Builders (e.g., text_builder.dart, row_builder.dart)

Render specific UI components based on their configurations.

