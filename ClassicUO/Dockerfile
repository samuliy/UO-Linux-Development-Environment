FROM mcr.microsoft.com/dotnet/sdk:5.0

ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

# Mount ClassicUO source codes here.
VOLUME /ClassicUO
WORKDIR /ClassicUO

# Create group.
RUN groupadd uogroup \
--gid 1000

# Create user.
RUN useradd uouser \
--uid 1000 \
--gid 1000 \
--create-home \
--home-dir /home/uouser

USER uouser

ENTRYPOINT ["dotnet", "build", "--configuration", "Debug"]
