fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios test
```
fastlane ios test
```
Runs all the tests
### ios provision
```
fastlane ios provision
```
Creating a code signing certificate and provisioning profile
### ios build
```
fastlane ios build
```
Create ipa
### ios upload_metadata
```
fastlane ios upload_metadata
```
Upload to App Store
### ios beta
```
fastlane ios beta
```
Deploy to Testflight
### ios report_test_coverage
```
fastlane ios report_test_coverage
```
Calculate test code coverage score. Need to run test beforehand.

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
