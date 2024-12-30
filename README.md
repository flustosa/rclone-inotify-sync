# Rclone Sync Service
### Directory sync service using inotify and rclone. Installs a service to synchronize directories with some remote (like Google Drive) using inotify and rclone.

## Install

```
sudo dpkg -i rclone-sync-package.deb
```

## Usage

```
sudo sync-rclone config
sudo sync-rclone dir
```


## Package build

```
dpkg-deb --build ./rclone-sync-package
```

