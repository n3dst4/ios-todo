
#!/bin/sh

#  build.sh
#  ToDo
#
#  Created by Neil de Carteret on 13/08/2016.
#  Copyright © 2016 Neil de Carteret. All rights reserved.


# from https://docs.travis-ci.com/user/common-build-problems/#Mac%3A-Code-Signing-Errors
KEY_CHAIN=ios-build.keychain
security create-keychain -p travis $KEY_CHAIN
# Make the keychain the default so identities are found
security default-keychain -s $KEY_CHAIN
# Unlock the keychain
security unlock-keychain -p travis $KEY_CHAIN
# Set keychain locking timeout to 3600 seconds
security set-keychain-settings -t 3600 -u $KEY_CHAIN

# So that just creates a new unlocked keychain for the duration of the build.
# More stuff about signing builds on Travis:
# https://github.com/travis-ci/travis-ci/issues/3047

# from https://github.com/travis-ci/travis-ci/issues/3047#issuecomment-69844401
# this uses xctool which seems to be really popular but is actually a 3rd party
# (facebook) tool
#xcodebuild -project ToDo.xcodeproj -scheme ToDo clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO

# this version uses xcodebuild, apple's own build tool
xcodebuild -project ToDo.xcodeproj -scheme ToDo clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO