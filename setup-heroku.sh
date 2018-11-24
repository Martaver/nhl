# This is an interactive command that you have to enter your username and password.
# heroku login

# This adds a remote repository hosted by Heroku for your application that you push to.
heroku git:remote -a nhlapp

# Specifies the Dart SDK to use
heroku config:set DART_SDK_URL=https://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-x64-release.zip

# Specifies the Heroku Buildpack to use
heroku config:set BUILDPACK_URL=https://github.com/stablekernel/heroku-buildpack-dart.git

# Configure dart environment
heroku config:set PATH=/app/bin:/usr/local/bin:/usr/bin:/bin:/app/.pub-cache/bin:/app/dart-sdk/bin
heroku config:set PUB_CACHE=/app/pub-cache

# Configure dart build on buildpack
heroku config:set DART_BUILD_CMD="/app/dart-sdk/bin/pub global activate webdev && /app/dart-sdk/bin/pub global run webdev build"