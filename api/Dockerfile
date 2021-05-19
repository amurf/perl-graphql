FROM perl

WORKDIR /app

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y postgresql-client libpq-dev

COPY . /app
RUN cpanm -fn --installdeps .

