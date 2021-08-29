FROM ubuntu:latest

ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

# Mount Ultima Online data directory here.
VOLUME /UOData

# Mount ServUO source codes here.
VOLUME /ServUO
WORKDIR /ServUO

# Create user group.
RUN groupadd uogroup \
--gid 1000

# Create user.
RUN useradd uouser \
--uid 1000 \
--gid 1000 \
--create-home \
--home-dir /home/uouser

# Add Microsoft package repository for dotnet.
RUN apt update -qy && apt install -qy wget
RUN wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

# Install dependencies.
RUN apt update -qy && apt install -qy make zlib1g-dev mono-complete dotnet-sdk-5.0

USER uouser
