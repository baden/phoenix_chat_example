FROM baden/elixir
MAINTAINER Denys Batrak baden.i.ua@gmail.com

RUN mkdir /node && \
    cd /node && \
    curl -O https://nodejs.org/dist/v4.4.7/node-v4.4.7-linux-x64.tar.xz && \
    tar xvf ./node-v4.4.7-linux-x64.tar.xz && \
    rm ./node-v4.4.7-linux-x64.tar.xz

ENV PATH /node/node-v4.4.7-linux-x64/bin/:${PATH}

RUN mkdir /app

ADD . /app

WORKDIR /app

ENV MIX_ENV prod

# TBD
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get --only prod

# mix deps.get && \

RUN npm install

# Not sure, maybe it can run early
RUN mix compile

# RUN

#dev
# EXPOSE 4000

# prod
EXPOSE 8080

CMD ["mix", "phoenix.server"]
# CMD ["bash"]
