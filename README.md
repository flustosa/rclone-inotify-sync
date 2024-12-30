# Rclone Sync Service
### Serviço de sincronização de diretórios usando inotify e rclon

## Instalação 

```
sudo dpkg -i rclone-sync-package.deb
```

## Uso

```
sudo sync-rclone config
sudo sync-rclone dir
```


## Construção do pacote 

```
dpkg-deb --build ~/rclone-sync-package
```

