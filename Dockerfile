FROM docker.io/rockylinux:9.2

# speed up image development by caching repo metadata
RUN dnf check-update || true

COPY packages.txt packages.txt

RUN dnf install -y --allowerasing $(cat packages.txt | sed 's|#.*$||')

WORKDIR /home/root
