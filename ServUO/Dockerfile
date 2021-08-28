FROM mono:6.12

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

# Install dependencies.
RUN apt update -qy && apt install -qy make zlib1g-dev

USER uouser
