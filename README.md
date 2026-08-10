![Banner](https://via.placeholder.com/800x200.png?text=FarmDirect+Ecosystem)

# FarmDirect Ecosystem

An end-to-end platform connecting local farms directly to consumers and markets. Built with Flutter for cross-platform reach, containerized with Docker, and deployed via automated CI/CD.

## About
FarmDirect bridges the gap between producers and buyers. The mobile app delivers a seamless experience for browsing farm products, placing orders, and tracking deliveries—while the backend ecosystem handles logistics, payments, and real-time updates.

## Installation

### Prerequisites
- Flutter SDK
- Docker
- Android Studio / Xcode (for mobile builds)

### Clone & Setup
```bash
git clone https://github.com/Shivay00001/FarmDirect-Ecosystem.git
cd FarmDirect-Ecosystem/farmdirect_app
flutter pub get
```

### Docker
```bash
docker build -t farmdirect-app .
docker run -p 8080:8080 farmdirect-app
```

## Usage
- Run the Flutter app: `flutter run`
- Build for production: `flutter build apk` / `flutter build ios`
- Deployments are automated via `.github/workflows/deploy.yml`

## Project Structure
- `farmdirect_app/` — Flutter mobile application
- `Dockerfile` — Container configuration
- `.github/workflows/` — CI/CD pipeline

## License
MIT
