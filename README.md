Dockerfile and config file for Burrow.

For additional configuration & settings please go to https://github.com/linkedin/Burrow/wiki/Configuration

```cfg
[zookeeper]
servers=[ "zookeeper:2181" ]
timeout=6
root-path="/burrow"

[client-profile.test]
client-id="burrow"
kafka-version="2.1.0"

[cluster.my-super-cluster]
class-name="kafka"
servers=[ "kafka:9092" ]
client-profile="test"
topic-refresh=5
offset-refresh=5

[consumer.my-super-cluster]
class-name="kafka"
cluster="my-super-cluster"
servers=[ "kafka:9092" ]
client-profile="test"
group-blacklist=""
group-whitelist=""

[httpserver.server]
address=":8080"
timeout=300
```

Change the servers for zookeeper and kafka or run docker image with mount configfile like:

```shell
$ docker run --rm -ti -v `pwd`/burrow.toml:/app/burrow.toml crusaderx2/burrow
```

and don't forget that Burrow expects only `burrow.toml` configuration file name.
