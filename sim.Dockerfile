# syntax = edrevo/dockerfile-plus

INCLUDE+ Dockerfile
#We inherit this from the included dockerfile, but I want to make it explicit
USER ardupilot

# A lot of env vars are set, it's easier to just use a custom shell
SHELL ["/bin/bash", "-c"]

COPY --chown=ardupilot ./ /ardupilot
WORKDIR /ardupilot

RUN ./waf configure --board sitl
RUN ./waf

