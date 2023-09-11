enum RequestApiDataState {
  dataLoading,
  dataLoaded,
  dataError,
}

enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
}

enum VideoPlayerState {
  play,
  paused,
}
