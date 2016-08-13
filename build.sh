
#!/bin/sh

#  build.sh
#  ToDo
#
#  Created by Neil de Carteret on 13/08/2016.
#  Copyright © 2016 Neil de Carteret. All rights reserved.

#echo "I AM RUNNING" && exit 0


# from https://docs.travis-ci.com/user/common-build-problems/#Mac%3A-Code-Signing-Errors
KEY_CHAIN=ios-build.keychain
security create-keychain -p travis $KEY_CHAIN
# Make the keychain the default so identities are found
security default-keychain -s $KEY_CHAIN
# Unlock the keychain
security unlock-keychain -p travis $KEY_CHAIN
# Set keychain locking timeout to 3600 seconds
security set-keychain-settings -t 3600 -u $KEY_CHAIN

# from https://github.com/travis-ci/travis-ci/issues/3047#issuecomment-69844401
xctool -project ToDo.xcodeproj -scheme ToDo clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO