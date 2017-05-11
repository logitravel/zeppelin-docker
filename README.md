# zeppelin-docker

Apache Zeppelin Docker Container

## Usage

### Build

```bash
docker build -t logitravel/zeppelin-docker .
```

### Deployment

It requires an Apache Spark cluster, for example
[spark-docker](https://github.com/logitravel/spark-docker), or any other deployment

#### Create volumes

```bash
docker volume create zeppelin-conf
docker volume create zeppelin-notebooks
```

#### Run master

```bash
docker run -e MASTER="spark://master:7077" \
           -e ZEPPELIN_NOTEBOOK_DIR="/opt/notebooks" \
           -e ZEPPELIN_CONF_DIR="/opt/conf" \
           --network="spark" \
           --volume zeppelin-notebooks:/opt/notebooks \
           --volume zeppelin-conf:/opt/conf \
           -p "8085:8080" \
           -p "4045:4040" \
           -ti logitravel/zeppelin-docker zeppelin.sh
```

### License

Copyright 2017 © Logitravel


Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

> [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.