# Proxy example

## Build & Run container

```
$ docker build -t my_proxy .

$ docker run --privileged -it my_proxy
```

## Users

DAD: allowed everything

```export {http,https}_proxy='http://dad:d@localhost:3128'```

KID: allowed yandex only

```export {http,https}_proxy='http://kid:k@localhost:3128```


## Checkers

`cm`: check mail

`cy`: check yandex

## Modify limitations:

1. edit `/etc/squid/{squid.conf,whitelist}` and save

2. restart squid:

```# /etc/init.d/squid restart```
