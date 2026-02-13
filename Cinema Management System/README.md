# Cinema Management System 🎬

A robust Dart console application designed for managing movie catalogs, actor information, and user reviews. This project demonstrates advanced data manipulation, asynchronous programming, and REST API integration in a clean, modular architecture.

## 🚀 Key Features

- **Complex Data Modeling**: Utilizes nested objects and factory constructors for seamless JSON-to-Object mapping and serialization.
- **Data Consolidation**: Implements logic to merge disparate data sources (Movies + Reviews) into a unified relational structure based on unique identifiers.
- **Asynchronous API Communication**: Full implementation of `GET` and `POST` requests using the `http` package, featuring custom error handling and simulated network latency.
- **Business Logic & Analytics**:
  - Dynamic filtering using multi-criteria conditions (Genre and Rating thresholds).
  - Automated calculation of average user ratings using the `.fold()` accumulator method.
- **Professional CLI Output**: Highly organized terminal reporting with clear visual hierarchy and data formatting.

## 🛠 Technical Stack

- **Language**: Dart SDK
- **Libraries**: `http` (REST API interaction)
- **Data Format**: JSON (Standardized data exchange)

## 📂 Project Structure

- `lib/movie.dart`: Main movie model with deep serialization logic.
- `lib/cast.dart`: Model for handling actor/cast member definitions.
- `lib/review.dart`: Model for managing user feedback and scoring.
- `lib/dart_practice.dart`: Core engine handling data fetching, merging logic, and output formatting.

## 📋 Installation & Usage

1.  Clone the repository to your local machine.
2.  Ensure the **Dart SDK** is installed.
3.  Install dependencies:
    ```bash
    dart pub get
    ```
4.  Run the application:
    ```bash
    dart run lib/dart_practice.dart
    ```
