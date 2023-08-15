FROM elixir:1.15-alpine AS builder

ARG RELEASE=tower_umbrella

ENV MIX_ENV=prod

RUN apk --no-cache add git

WORKDIR /app

COPY . .

RUN mix do local.hex --force, local.rebar --force

RUN mix deps.get --only ${MIX_ENV}

RUN mix release ${RELEASE}

FROM alpine:3.18

ARG RELEASE=tower_umbrella

ARG TARGET=prod

ENV APP_NAME=${RELEASE}

ENV REPLACE_OS_VARS=true

RUN apk add --no-cache openssl-dev libgcc ncurses-libs libstdc++

WORKDIR /app

COPY --from=builder /app/_build/${TARGET}/rel/${RELEASE} .

CMD /app/bin/${APP_NAME} start
