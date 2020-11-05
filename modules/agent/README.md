falcon-agent
===

This is a linux monitor agent. Just like zabbix-agent and tcollector.


## Installation

It is a golang classic project

```bash
# set $GOPATH and $GOROOT
mkdir -p $GOPATH/src/github.com/mohneesh9797-puresoftware
cd $GOPATH/src/github.com/mohneesh9797-puresoftware
git clone https://github.com/mohneesh9797-puresoftware/falcon-plus.git
cd falcon-plus/modules/agent
go get
./control build
./control start

# goto http://localhost:1988
```

I use [linux-dash](https://github.com/afaqurk/linux-dash) as the page theme.

## Configuration

- heartbeat: heartbeat server rpc address
- transfer: transfer rpc address
- ignore: the metrics should ignore

# Auto deployment

Just look at https://github.com/mohneesh9797-puresoftware/ops-updater
