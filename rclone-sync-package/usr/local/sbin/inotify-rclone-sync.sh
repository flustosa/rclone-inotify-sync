#!/bin/bash

# Arquivo de configuração
CONFIG_FILE="/etc/rclone-sync/sync.conf"
RCLONE_CONFIG="/root/.config/rclone/rclone.conf" 


# Ler o arquivo de configuração
while IFS=' ' read -r local_dir remote_dir; do
	[[ "$local_dir" =~ ^#.*$ ]] && continue
    # Verifica se a linha não está vazia
    [ -z "$local_dir" ] && continue

    # Monitorar cada diretório listado no arquivo de configuração
    /usr/bin/inotifywait -m -r -e modify,create,delete,move "$local_dir" |
    while read -r directory events filename; do
        # Executar o comando de sincronização do rclone
        /usr/bin/rclone sync --config "$RCLONE_CONFIG" "$local_dir" "$remote_dir"
    done &
done < "$CONFIG_FILE"

# Aguardar todos os processos de monitoração
wait

