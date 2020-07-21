---
Title: Star Trails Photography, Volume 3
Description: Automation, ADB
Date: 22 July 2020
Image: /assets/img/astro_trails_1_optimised.jpg
Template: single
---

In my [last post](/?star_trails_2) in this series, I mentioned about blending 100s of your captured astronomy images into one image so that the movement of the stars, pardon me, the illusion of the movement of the stars as the Earth itself rotates under them, can be revealed in it's full glory.

It would be an arduous task indeed to capture all these images one after the other, especially since there is a 30 second (exposure) delay between shots.

So we do what we do best, automate it!

Note that, this will work for an Android smartphone. I am not sure as to how, or even if, it is possible on an iPhone. But rest assured, I shall update this as soon as I find out.

# The Android Debug Bridge

[Android Debug Bridge](https://developer.android.com/studio/command-line/adb) or just `adb` is a command-line tool which lets you communicate with an android device connected (via adb) to your computer. All three major platforms (Linux, MacOS and Windows) are supported. I have found success with Linux and MacOS.

There is actually a lot one can do over ADB. I have previously used it to:
- remotely push and pull files to and from the device
- install apps on the phone
- capture screenshots and pull them over to the computer
- and most importantly, relay input events to the connected device

One can even [mount their phone's storage](https://github.com/spion/adbfs-rootless) without root access as a drive on your computer, so that it shows up as just another external drive with RW access.

Oh and did I mention ADB works over both wired (USB) and wireless connections?

Let's just suffice it to say that I am really impressed by this nifty cli tool.

## Make the connection

#### Enable "Developer options" and "USB debugging"
The following one-time setup needs to be done on your phone.
- Find "Build number" in your phone's "Settings" app.
[<img src="/assets/img/about_phone.jpg" class="img-fluid"/>](/assets/img/about_phone.jpg)
- Tap it a few times.
- A toast message will appear saying "You are now a developer".
- Navigate to the newly created menu item "Developer options" in the "Settings" app.
- Turn on "USB debugging".
[<img src="/assets/img/usb_debug.jpg" class="img-fluid"/>](/assets/img/usb_debug.jpg)
- Turn on "Wireless ADB debugging" as well. You are gonna need it.

Note that the exact menu options might differ slightly from OEM to OEM. Should you face any issues, you are encouraged to search online how to enable adb for your particular device model. You may reach out to me as well for the same.

#### Install `adb` on your computer
##### Debian Linux
```bash
$ sudo apt install adb -y
```
##### MacOS
Assuming you already have `homebrew` installed:
```bash
$ brew cask install android-platform-tools
```

Test the installation.
```bash
$ adb devices
```
[<img src="/assets/img/adb_devices.png" class="img-fluid"/>](/assets/img/adb_devices.png)

You should get a similar output.

#### Connect
- Connect your phone to your computer with a USB cable. A confirmation dialog should pop up on your phone asking to `Allow USB debugging?`. It will mention your computer's RSA key fingerprint.
- Tap on `Always allow from this computer` and tap `ALLOW`.
```bash
$ adb devices
```
[<img src="/assets/img/adb_devices_success.png" class="img-fluid"/>](/assets/img/adb_devices_success.png)
- You should now see an output like this.

Congratulations! You just successfully connected your Android device to your computer over ADB.

#### Wirelessly connect
But wait! Surely you can't have your computer connected to your phone while it's mounted on the tripod. I mean, yes sure you can, but you don't want to. You desire a more elegant solution. You wish to connect wirelessly.

- Ensure that your phone and your computer are connected to the same WiFi network.

- Restart the adb daemon in TCP mode.

```bash
$ adb tcpip 5555
```
[<img src="/assets/img/adb_tcpip.png" class="img-fluid"/>](/assets/img/adb_tcpip.png)

- Get your phone's local IP address. The easiest way is to look at "Status" under "About phone" in your phone's "Settings".

[<img src="/assets/img/device_local_ip.jpg" class="img-fluid"/>](/assets/img/device_local_ip.jpg)

```bash
$ adb connect 192.168.1.2:5555
```
[<img src="/assets/img/adb_connect.png" class="img-fluid"/>](/assets/img/adb_connect.png)

```bash
$ adb devices
```
[<img src="/assets/img/adb_devices_2.png" class="img-fluid"/>](/assets/img/adb_devices_2.png)

- You may now disconnect the USB cable from the phone.

```bash
$ adb devices
```
[<img src="/assets/img/adb_devices_1.png" class="img-fluid"/>](/assets/img/adb_devices_1.png)

Now, that we have full remote control of our device, we need a script which will execute the captures at the specified intervals.

Head over to the [next post](/?star_trails_4) in this series, where we explore how to interface adb with Python. See you there!