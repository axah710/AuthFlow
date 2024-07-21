# AuthFlow 🚀

![Last Commit](https://img.shields.io/github/last-commit/axah710/AuthFlow)
![Open Issues](https://img.shields.io/github/issues/axah710/AuthFlow)
![Stars](https://img.shields.io/github/stars/axah710/AuthFlow)
![Forks](https://img.shields.io/github/forks/axah710/AuthFlow)
![Contributors](https://img.shields.io/github/contributors/axah710/AuthFlow)

AuthFlow is a comprehensive authentication management system built with Firebase, providing user authentication, role-based routing, and a dynamic admin dashboard.

## Features

### Core Features
- 🔐 **Authentication**: Integrated Firebase authentication with `AuthCubit` for user management, supporting login, registration, and error handling.
- 🖥️ **Admin Dashboard**: Admin functionalities to add and delete users.
- 🚦 **Role-based Routing**: Enhanced user dashboard and account functionality with role-based routing.

### Screens and Widgets
- ✉️ **Sign-in Screen**: Email/password authentication with alternative login methods.
- 📝 **Register Screen**: Enhanced with new widgets and alternative login options for a better user experience.
- 🧩 **Onboarding**: 
  - Introduced `select_role` feature and related UI components.

### Detailed Features
- 🔑 **Authentication with AuthCubit**:
  - Integrated Firebase authentication with `AuthCubit` for user management.
  - 📋 Added functionality to support user login and registration.
  - 🛠️ Developed an admin dashboard to add and delete users.

- 🚀 **Role-based Routing and Dashboard**:
  - Enhanced user dashboard and account functionality with role-based routing.
  - 🔄 Updated app router to pass role as argument to user dashboard and account.

- 🎭 **Onboarding and Select Role**:
  - Added `select_role` feature in the onboarding module.

- 📚 **Onboarding Screens and Core Widgets**:
  - Added onboarding screens to guide users through initial app setup.
  - 🖼️ Introduced new widgets such as Image displayer, Text form field, Spacing widget, and SVG displayer.

## Business Cases and Impact

### Business Cases
- 🛠️ **Improved User Management**: With the integration of Firebase and `AuthCubit`, AuthFlow simplifies user management, enhancing the efficiency of authentication processes.
- 🔒 **Enhanced Security**: Role-based routing ensures that users only access information pertinent to their role, improving overall application security.
- 📊 **Scalable Admin Controls**: The admin dashboard allows for easy user management, scalable for businesses of any size.

### Impact
- 😊 **User Experience**: By providing a seamless onboarding process and multiple authentication methods, user satisfaction and retention are likely to improve.
- ⏳ **Development Efficiency**: Developers can leverage pre-built authentication and routing functionalities, reducing development time and focusing on core business logic.
- 🌱 **Business Growth**: Enhanced security and efficient user management can lead to better compliance with regulations and improved trust with users, supporting business growth.

## Installation 🚀

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

## Usage 🎯

1. Ensure Firebase is properly configured for your project.
2. Run the application:
    ```bash
    flutter run
    ```

## Contributing 🤝

![Pull Requests Welcome](https://img.shields.io/badge/Pull%20Requests-Welcome-brightgreen)

Contributions are welcome! Please follow these steps to contribute:

1. 🍴 Fork the repository.
2. 🚧 Create a new branch (`git checkout -b feature/your-feature-name`).
3. 📝 Commit your changes (`git commit -am 'Add some feature'`).
4. 🚀 Push to the branch (`git push origin feature/your-feature-name`).
5. 📥 Create a new Pull Request.

## Contact 📞

![GitHub Issues](https://img.shields.io/github/issues-raw/axah710/AuthFlow)

For any inquiries or issues, please open an issue on GitHub or contact me. 🤗
