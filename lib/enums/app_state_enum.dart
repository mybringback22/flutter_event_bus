/// Represents the lifecycle state of the app.
enum AppState {
  /// The app is running in the foreground and visible to the user.
  foreground,

  /// The app is running in the background but not visible to the user.
  background,

  /// The app has resumed from a paused state and is active again.
  resumed,

  /// The app is currently paused (partially or fully inactive).
  paused,
}