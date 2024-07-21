# online_auth_system

# AuthFlow

![License](https://img.shields.io/github/license/axah710/AuthFlow)
![Last Commit](https://img.shields.io/github/last-commit/axah710/AuthFlow)
![Open Issues](https://img.shields.io/github/issues/axah710/AuthFlow)

AuthFlow is a comprehensive authentication management system built with Firebase, providing user authentication, role-based routing, and a dynamic admin dashboard.

## Features

### Core Features
- **Authentication**: Integrated Firebase authentication with `AuthCubit` for user management, supporting login, registration, and error handling.
- **Admin Dashboard**: Admin functionalities to add and delete users.
- **Role-based Routing**: Enhanced user dashboard and account functionality with role-based routing.

### Screens and Widgets
- **Sign-in Screen**: Email/password authentication with alternative login methods.
- **Register Screen**: Enhanced with new widgets and alternative login options for a better user experience.
- **Onboarding**: 
  - Renamed `get_started` to `onboarding`.
  - Introduced `select_role` feature and related UI components.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/axah710/AuthFlow.git
    ```
2. Navigate to the project directory:
    ```bash
    cd AuthFlow
    ```
3. Install dependencies:
    ```bash
    flutter pub get
    ```

## Usage

1. Ensure Firebase is properly configured for your project.
2. Run the application:
    ```bash
    flutter run
    ```

## Commit History

### Commits on Jul 20, 2024
- **feat(core, AuthCubit): implement AuthCubit with Firebase for authentication**
  - Integrated Firebase authentication with `AuthCubit` for user management.
  - Added functionality to support user login and registration.
  - Developed an admin dashboard to add and delete users.
  - Improved overall authentication flow and error handling.
  
### Commits on Jul 19, 2024
- **feat(routing, core): role-based routing and updates for user dashboard and account**
  - Enhanced user dashboard and account functionality with role-based routing.
  - Updated app router to pass role as argument to user dashboard and account.

### Commits on Jul 18, 2024
- **feat(core, onboarding, select_role): major updates and feature additions**
  - Renamed `get_started` to `onboarding`.
  - Added `select_role` feature in the onboarding module.
  - Refactored UI for the onboarding process.

### Commits on Jul 17, 2024
- **feat(core, get_started): add onboarding screens and core widgets**
  - Added onboarding screens to guide users through initial app setup.
  - Introduced new widgets such as Image displayer, Text form field, Spacing widget, and SVG displayer.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature-name`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or issues, please open an issue on GitHub or contact the project maintainers.

