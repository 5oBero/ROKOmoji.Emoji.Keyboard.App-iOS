# ROKOmoji Emoji Keyboard App (iOS)
Create your own Custom Emoji Keyboard App for free with ROKO Labs! We've open sourced our emoji keyboard app you can easily build your own to promote your company and brand!

The application also utilizes ROKO Mobi Stickers SDK - http://roko.mobi/stickers - which will help you manage your app through:

1. In-depth sticker analytics and reporting
2. Upload and send stickers and GIFS straight to your emoji keyboard app w/o submitting another build to Apple 
3. It's all free!

## Custom Keyboard App Features
No need to spend time creating features from scratch or paying for a developer. Our open-sourced app includes multiple types of custom app features.

1. Multiple sticker packs supported within one app
2. User onboarding experience in app
3. Logo branding
4. Static and animated stickers
5. Stickers can be sent in email, messenger, SMS, and more!

Want to see these features in action? Then check out ROKOmoji in the iTunes App Store.

ROKOmoji - https://itunes.apple.com/us/app/rokomoji/id1172504178?mt=8

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

## About ROKO Mobi
ROKO Mobi provides app developers and product owners with a suite of tools to accelerate mobile development, engage and track customers, and measure their app's success. A few things we do:

1. InstaBot (add a chatbot into your app)
2. Refer-a-Friend
3. Share
4. User Analytics
5. Promo codes
6. Push notifications
7. Stickers

Learn more about features at:
https://roko.mobi

See here for ROKO Mobi documentation, interaction guides, and instructions:
https://docs.roko.mobi/docs/setting-up-your-account

## Activate your New Keyboard
Run application on device or simulator and follow the instructions on the main screen.

## Reference Links
For Apple's iOS 8.0 Human Interface Guidelinse for custom keyboards, please see below:
https://developer.apple.com/ios/human-interface-guidelines/extensions/custom-keyboards/

You can access the technical app extension programming guide on custom keyboards here:
https://developer.apple.com/library/content/documentation/General/Conceptual/ExtensibilityPG/CustomKeyboard.html
