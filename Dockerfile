FROM debian:buster-slim
WORKDIR /home/monero/
ADD bin/* /home/monero/
RUN chmod +x /home/monero/monero*
RUN /home/monero/monerod --log-file /home/monero/.bitmonero/bitmonero.log --detach --prune-blockchain --sync-pruned-blocks --db-sync-mode fastest --enforce-dns-checkpointing && (tail -f -n0 /home/monero/.bitmonero/bitmonero.log & ) | grep -q "SYNCHRONIZED OK"
