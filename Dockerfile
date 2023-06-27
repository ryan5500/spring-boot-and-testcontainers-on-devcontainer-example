FROM mcr.microsoft.com/devcontainers/java:17-bullseye

WORKDIR /workspace

# gpg key errorとなるのでyarnは削除
# refer: https://github.com/devcontainers/images/issues/370
RUN rm -f /etc/apt/sources.list.d/yarn.list

# To use postgresql-client v14
RUN apt update && apt install wget git curl ca-certificates gnupg -y
RUN curl https://www.postgresql.org/media/keys/ACCC4CF8.asc \
| gpg --dearmor \
| sudo tee /etc/apt/trusted.gpg.d/apt.postgresql.org.gpg >/dev/null
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bullseye-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt update && apt install postgresql-client-14 -y