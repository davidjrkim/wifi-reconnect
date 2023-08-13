# wifi-reconnect
if you have a server setup with wifi (for some reason) you know the pain. this script will check for connection and restart the wifi network interface for it to retry the handshake


# linux distro
edit the constants `$INTERFACE` and `$OS` to your OS and network interface in `wifi-reconnect.sh` 


# persistent loop

## systemd

If you’re using systemd (shame on you but you do you,) you can use `Systemd Timers`

1.copy the timer unit file and service unit file located in a folder named `systemd` this repo to `/etc/systemd/system/`

```
$ cp systemd/wifi-reconnect.timer /etc/systemd/system/wifi-reconnect.timer
$ cp systemd/wifi-reconnect.service /etc/systemd/system/wifi-reconnect.service
```

2.Enable and Start the Timer

```
$ sudo systemctl enable my-task.timer
$ sudo systemctl start my-task.timer
```

## Bash script

This is pretty ambitious

```bash
#!/bin/bash

while true; do
    wifi-reconnect.sh
    sleep 120  # Sleep for 1 hour (3600 seconds)
done
```

## cron

1.To edit the cron jobs for the current user, use the following command:

```bash
$ crontab -e
```
This will open the cron job configuration file in your default text editor (such as nano or vim).

Add a new line to schedule the script. For example, to run the script every hour, you can add the following line:

```bash
2 * * * * ~/wifi-reconnect/wifi-reconnect.sh
```
