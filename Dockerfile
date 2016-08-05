FROM baden/elixir
MAINTAINER Denys Batrak baden.i.ua@gmail.com

RUN mkdir /node && \
    cd /node && \
    curl -O https://nodejs.org/dist/v4.4.7/node-v4.4.7-linux-x64.tar.xz && \
    tar xf ./node-v4.4.7-linux-x64.tar.xz && \
    rm ./node-v4.4.7-linux-x64.tar.xz

ENV PATH /node/node-v4.4.7-linux-x64/bin/:${PATH}

RUN mkdir /app

ADD . /app

WORKDIR /app

ARG DEST=dev
ENV MIX_ENV=${DEST}

# TBD
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get --only ${DEST}

# mix deps.get && \

RUN npm install


# Not sure, maybe it can run early
RUN mix compile && \
    mix phoenix.digest

# RUN

# ENV PORT 8080
ARG PORT=8080
ENV PORT=${PORT}

EXPOSE ${PORT}

CMD ["mix", "phoenix.server"]
# CMD ["bash"]
