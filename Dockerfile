FROM debian:buster-slim
WORKDIR /home/monero/
ADD bin/* /home/monero/
RUN /home/monero/monerod --detach --prune-blockchain --db-sync-mode fastest --enforce-dns-checkpointing && tail -f /home/monero/.bitmonero/bitmonero.log | awk '/SYNCHRONIZED OK/ { exit; }'
