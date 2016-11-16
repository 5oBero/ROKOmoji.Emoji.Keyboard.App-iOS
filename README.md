# ROKOMojie
iOS keyboard sample

Custom ios keyboard extensions come with ios 8.0
Here some info
HIG link
https://developer.apple.com/ios/human-interface-guidelines/extensions/custom-keyboards/

More technical info
https://developer.apple.com/library/content/documentation/General/Conceptual/ExtensibilityPG/CustomKeyboard.html

This project is a sample how to create a custom keyboard with a cool ROKOStickers component.

## Portal settings

1. Register on ROKO portal https://portal.roko.mobi/
2. Create new Application in Portal. Copy API key.
3. Don't forget to check Stickers checkbox.
4. Create new sticker packs in Stickers section.

## Xcode project settings
Open workspace in Xcode.

1. Choose project name at Project Navigator View.
2. Choose Holding App target.
3. Fill Bundle Identifier with your own Bundle info form yours Apple Developer Site.
4. Fill Provisioning profiles fileds with info form yours Apple Developer Site.
5. Add new key to your info.plist file. Key: ROKOMobiAPIToken, value: API key of your Portal application (see point 2 of previous paragraph)

Apply steps 3-4 with Keyboard Extension.

## Activate your new keyboard
Run application on device or simulator and follow the instructions on the main screen.
