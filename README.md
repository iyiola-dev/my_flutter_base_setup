# flutter_base

My flutter App base setup.

## Getting Started

- You need to run `flutter pub get`
- You need to run the builder method ` flutter pub run build_runner watch --delete-conflicting-outputs`
- You need to create the `key.properties` file in the android folder for signing.

check out `example.key.properties`

```
storePassword=
keyPassword=
keyAlias=
storeFile=
```

- Run `flutter pub run flutter_launcher_icons:main ` to build update your app icon. you can replace the icon in `assets/images/logo.png` with you own image (A PNG file would work better)
  This project is a starting point for a Flutter application.

## Tool (Plugin / Packages)

- Provider
- Hive
- Shared Preferences
- Auto Routes
- Get it
- Injectable
- Bot Toast
- Http
