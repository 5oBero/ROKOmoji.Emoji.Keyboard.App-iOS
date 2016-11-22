# ROKOMoji
Build your own iOS keyboard

## About ROKOmoji
Create your own custom keyboard with ROKO Labs! We've open sourced our emoji keyboard app so you can easily build your own emoji and sticker keyboard app so you can easily build your own emoji and sticker keyboard to promote your company and brand.

Once you've created your custom keyboard, you can choose whether or not you would like to integrate with ROKO Mobi's Sticker component to manage your keyboard and see analytics, all for free!

Should you have any questions or concerns, feel free to email us at help@rokolabs.com

## Xcode Project Settings
Open workspace in Xcode:

1. Select Project Navigator View and choose your project name
2. Select Holding App Target
3. Complete the Bundle Identifier with your own Bundle info received from Apple Developer Site
4. Complete the Provisioning profiles with info received from your Apple Developer Site
5. Add a new key to your info.plist file
   Key: ROKOMobiAPIToken
   Value: API key of your ROKO Mobi portal application (see below for ROKO Mobi portal information)
6. Apply steps 3-5 to Keyboard Extension Target

## Portal settings
ROKO Mobi provides app developers and product owners with a suite of tools to accelerate mobile development, engage and track customers, and measure their app's success

See here for ROKO Mobi documentation, interaction guides, and instructions:
https://docs.roko.mobi/docs/setting-up-your-account

## Activate your new keyboard
Run application on device or simulator and follow the instructions on the main screen.

## Reference Links
For Apple's iOS 8.0 Human Interface Guidelinse for custom keyboards, please see below:
https://developer.apple.com/ios/human-interface-guidelines/extensions/custom-keyboards/

You can access the technical app extension programming guide on custom keyboards here:
https://developer.apple.com/library/content/documentation/General/Conceptual/ExtensibilityPG/CustomKeyboard.html
