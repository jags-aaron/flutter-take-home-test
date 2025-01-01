# Couchsurfing Take Home

This is a take home project for Couchsurfing.

# Goal

### Create a simple Flutter app that has basic social capabilities:
```
- A user centric view where they can see their profile
- Screen for listing mock posts from friends and a detail view of the posts
- Placeholders for what good data structures for users and posts and friends
```

## development process

1. Create a new Flutter project with `3.22.2` version
2. Add the core dependencies
- `go_router` to manage the routing
- `flutter_bloc` for state management
- `provider` to manage dependency injection easily
- `dio` for network calls
Add extra packages to help with the App Styling and mock data
- `flex_color_scheme`
- `google_fonts`
- `random_name_generator`
3. For this exercise I'm considering a simple `Layered Architecture` approach with 3 layers
    - PRESENTER
      - Bloc - to manage states
      - MVC pattern - for the UI
        - View
        - Controller
        - Model
    - DOMAIN
      - Entities
      - UseCases
    - DATA
      - Repositories
      - Sources
      - Models
4. The folder structure will be as follow:
    - main.dart - App entry point
    - app.dart - All related to high level app configuration and MaterialApp
    - app_router.dart - All related to App navigation
    - /app_config - theme, colors, fonts, etc
    - /data
      - /models
      - /sources
      - /repositories
    - /domain
      - /entities
      - /use_cases
    - /presenter
      - /<feature>
        - /bloc
          - /<feature>_bloc.dart
          - /<feature>_states.dart
          - /<feature>_events.dart
        - <feature>_view.dart
        - <feature>_controller.dart
        - <feature>_model.dart
5. create the identified entities and models
6. Create Use Cases with mock interfaces for Sources and Repositories