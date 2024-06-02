
HOMELAB_ADDR=root@omv.lan

deploy:
	echo "Deploying to ${HOMELAB_ADDR}"
	rsync -av --progress --exclude='.git' --exclude='Makefile' . ${HOMELAB_ADDR}:/root/homelab

up:
	echo "Restarting homelab"
	@ssh ${HOMELAB_ADDR} "docker compose -f homelab/compose.yml up -d"

restart:
	echo "Restarting homelab"
	@ssh ${HOMELAB_ADDR} "docker compose -f homelab/compose.yml restart"