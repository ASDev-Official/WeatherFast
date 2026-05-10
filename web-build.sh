#!/bin/bash
# Remove .env from pubspec
sed -i '' 's/- .env//g' pubspec.yaml 
# Build the app
flutter build web --release --dart-define=API_KEY=$API_KEY
# Revert pubspec (optional, for local safety)
git checkout pubspec.yaml