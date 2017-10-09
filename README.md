# ROKOmoji Emoji Keyboard App (iOS)
Create your own Custom Emoji Keyboard App for free with ROKO Labs! We've open sourced our emoji keyboard app you can easily build your own to promote your company and brand!

1. In-depth sticker analytics and reporting
2. Upload and send stickers and gifs straight to your emoji keyboard app w/o submitting another build to Apple 
3. It's all free!

## Custom Keyboard App Features
No need to spend time creating features from scratch or paying for a developer. Our open-sourced app includes multiple types of custom app features.

1. Multiple sticker packs supported within one app
2. User on-boarding experience in app
3. Logo branding
4. Static and animated stickers
5. Stickers can be sent in email, messenger, SMS, and more!

Want to see these features in action? Then check out [ROKOmoji](https://itunes.apple.com/us/app/rokomoji/id1172504178?mt=8) in the iTunes App Store!

## Xcode Project Settings
Open your `.xworkspace` file in Xcode:

1. Select Project Navigator View and choose your project name
2. Select Holding App Target
3. Complete the Bundle Identifier with your own Bundle info received from Apple Developer Site
4. Complete the Provisioning profiles with info received from your Apple Developer Site
5. Add a new key to your `info.plist` file
  - Key: `ROKOMobiAPIToken`
  - Value: Your API key ([instructions for retrieving your API key](https://docs.instabot.io/docs/web-basic-setup#section-1-get-your-instabot-api-key))
6. Apply steps 3-5 to Keyboard Extension Target

#### If you don't have an account yet, please email us at info@instabot.io and we'll get you set up!

## About ROKO Mobi
ROKO Mobi provides app developers and product owners with a suite of tools to accelerate mobile development, engage and track customers, and measure their app's success. A few things we do:

1. Instabot (add a chatbot into your app)
2. User Analytics
3. Push notifications
4. Stickers

See here for ROKO Mobi documentation, interaction guides, and instructions:
https://docs.instabot.io/docs/roko-ios-keyboard

## Activate your New Keyboard
Run application on device or simulator and follow the instructions on the main screen.

## Reference
For Apple's iOS 8.0 Human Interface Guidelines for custom keyboards, please see here:
https://developer.apple.com/ios/human-interface-guidelines/extensions/custom-keyboards/

You can access the technical app extension programming guide on custom keyboards here:
https://developer.apple.com/library/content/documentation/General/Conceptual/ExtensibilityPG/CustomKeyboard.html
