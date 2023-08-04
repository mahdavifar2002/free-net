# free-net
For God's sake.  

# Table of contents
- [free-net](#free-net)
- [Table of contents](#table-of-contents)
- [Server-side](#server-side)
	- [On Europe Server](#on-europe-server)
		- [Insall](#insall)
		- [Restart](#restart)
	- [On Iran Server](#on-iran-server)
		- [Insall](#insall-1)
		- [Update](#update)
		- [Restart](#restart-1)
- [Client-side](#client-side)
	- [Windows](#windows)
	- [Linux](#linux)
	- [Android](#android)

# Server-side

## On Europe Server

### Insall
Run the following command to install `x-ui` on Europe server. You will be prompted to enter a username, a password, and a panel port.
```
bash <(curl -Ls https://bit.ly/3rLSq2B) --europe --install
```

### Restart
In case if `x-ui` has stopped working, run the following command to restart it.
```
bash <(curl -Ls https://bit.ly/3rLSq2B) --europe --restart
```

## On Iran Server

### Insall
Run the following command command. Replace `1.1.1.1` with the IP of your Europe server.
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdavifar2002/free-net/main/script.sh) --iran --install --server 1.1.1.1
```

### Update
In case if you have changed IP of Europe server, run the following command command to update it. Replace `1.1.1.1` with the new IP of your Europe server.
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdavifar2002/free-net/main/script.sh) --iran --update --server 1.1.1.1
```

### Restart
After every reboot on Iran server, run the following command to activate packet forwarding.
```
bash <(curl -Ls https://raw.githubusercontent.com/mahdavifar2002/free-net/main/script.sh) --iran --restart
```

# Client-side

## Windows
 1. Install [Qv2ray](https://github.com/Qv2ray/Qv2ray/releases/download/v2.7.0/Qv2ray-v2.7.0-Windows-Installer.exe) for Windows.
 2. Download and extract [Xray](https://github.com/XTLS/Xray-core/releases/download/v1.7.2/Xray-windows-64.zip) on a permanent location.
 3. Open Qv2ray app, Go to `Preferences`, then `Kernel Settings`. Change `V2ray Core Executable Path` to the address of `xray.exe` file inside the location where you extracted Xray. Also change the `V2ray Assets Directory` to the address of Xray folder.
 4. Click OK.
 5. Click on `+ Import` button below the window, and paste your config under the `Share Link`. Then, click on `Import`.
 6. Double-click on `Default Group` below the search area, and find the config you just imported. Click on it, then click on the play icon to connect to your config.

## Linux
 1. Install [Qv2ray](https://github.com/Qv2ray/Qv2ray/releases/download/v2.7.0/Qv2ray-v2.7.0-linux-x64.AppImage) for Linux.
 2. Download and extract [Xray](https://github.com/XTLS/Xray-core/releases/download/v1.7.2/Xray-linux-64.zip) on a permanent location.
 3. The next steps are similar to the installation process on [Windows](#windows).

## Android
 1. Install [v2rayNG](https://play.google.com/store/apps/details?id=com.v2ray.ang) for Android.
 2. Copy your config.
 3. Open v2rayNG app, press `+` button, press `Import config from Clipboard`.
 4. Press the `V` button below the screen to connect to the config.