FROM debian:latest

RUN apt-get update \
    && apt-get upgrade -y

COPY unreal-dedicated.tar.gz .
RUN tar -xzf ./unreal-dedicated.tar.gz

# Add a new ue4 user. The dedicated server cannot be run as root.
RUN useradd ue4 \
    && chown ue4:ue4 -R ./Linux

USER ue4
EXPOSE 7777/udp

ENTRYPOINT [ "./Linux/LinuxServer/SheepsGateGameServer.sh" ]