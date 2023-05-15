FROM alpine

CMD ["/bin/echo 'Hello, world!'"]

ENTRYPOINT ["/bin/sh", "-c"]