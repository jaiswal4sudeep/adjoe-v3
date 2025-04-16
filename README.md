# 🕹️ Playtime Flutter Plugin

A Flutter plugin for integrating **Playtime SDK** — display offer catalogs, manage rewards, and track events in your app seamlessly.

---

## 🚀 Features

- ✅ Initialize the Playtime SDK
- ✅ Show Offer Catalog
- ✅ Reward Handling (payouts, requests)
- ✅ Track Teaser Events
- ✅ User profile & targeting parameters
- ✅ Get SDK Version & Initialization Status

---

## 📦 Installation

Add the plugin to your `pubspec.yaml`:

```yaml
dependencies:
  playtime_plugin:
    path: ./path_to_your_plugin_directory
```

> Replace the path with the actual local path of the plugin.

---

## ⚙️ Android Setup

1. Add the necessary Playtime SDK dependencies in `android/app/build.gradle`.
2. Add any required permissions and metadata in `AndroidManifest.xml`.

---

## 🧑‍💻 Usage

### 1️⃣ Initialize the SDK

```dart
await Playtime.init(
  'your_sdk_hash',
  PlaytimeOptions(
    userId: 'user123',
    applicationProcessName: 'com.example.app',
    userProfile: PlaytimeUserProfile(
      gender: PlaytimeGender.MALE,
      birthday: DateTime(2000, 1, 1),
    ),
    params: PlaytimeParams(
      uaNetwork: 'networkName',
      uaChannel: 'channelA',
    ),
    extensions: PlaytimeExtensions(
      subId1: 'sub1',
    ),
  ),
);
```

---

### 2️⃣ Show Catalog

```dart
Playtime.showCatalog(
  PlaytimeParams(
    uaNetwork: 'networkName',
    placement: 'placementId',
  ),
);
```

---

### 3️⃣ Payout & Rewards

```dart
await Playtime.doPayout();
final rewards = await Playtime.requestRewards();
print(rewards);
```

---

### 4️⃣ Send Teaser Shown Event

```dart
await Playtime.sendTeaserShownEvent();
```

---

### 5️⃣ SDK Info & Status

```dart
final version = await Playtime.getVersion();
final versionName = await Playtime.getVersionName();
final isInitialized = await Playtime.isInitialized();
final hasAcceptedTOS = await Playtime.hasAcceptedTOS();
```

---

## 🧾 Models & Enums

### `PlaytimeOptions`

| Field | Type | Description |
|-------|------|-------------|
| `userId` | `String?` | Optional user ID |
| `applicationProcessName` | `String?` | Optional process name |
| `userProfile` | `PlaytimeUserProfile?` | Gender & Birthday |
| `params` | `PlaytimeParams?` | Targeting Params |
| `extensions` | `PlaytimeExtensions?` | Sub IDs |

### `PlaytimeUserProfile`

```dart
PlaytimeUserProfile(
  gender: PlaytimeGender.FEMALE,
  birthday: DateTime(1995, 12, 31),
)
```

---

## 📃 License

MIT License — free to use, modify, and share.

---

## 🤝 Contributing

Feel free to open issues or pull requests to enhance this plugin!