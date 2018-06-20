$ docker build -t my_proxy
$ docker run --privileged -it my_proxy

DAD: export {http,https}_proxy='http://dad:d@localhost:3128'

KID: export {http,https}_proxy='http://kid:k@localhost:3128'
(yandex only)

cm: check mail
cy: check yandex
