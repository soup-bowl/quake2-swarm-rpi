# Quake II on a Docker Swarm Cluster
Work in progress experiment of running a [Quake II][q2] server on the [Raspberry Pi][pi] [Clusterhat][ch], using [Docker Swarm][ds].

[Deploy to stack][sd].

## Bash Aliases
```
p2qdc=/path/to/docker-compose.yml
alias q2_start="docker-compose -f $p2qdc build ; docker stack deploy --compose-file $p2qdc quake2srv"
alias q2_stop="docker stack rm quake2srv"
```

[q2]: https://store.steampowered.com/app/2320/QUAKE_II/
[pi]: https://www.raspberrypi.org/
[ch]: https://clusterhat.com/
[ds]: https://docs.docker.com/engine/swarm/
[sd]: https://docs.docker.com/engine/swarm/stack-deploy/
