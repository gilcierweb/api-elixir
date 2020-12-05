FROM elixir:1.11.2-alpine
LABEL maintainer="gilcierweb@gmail.com"


RUN apk add --update --no-cache \
      binutils-gold \
      bash \
      build-base \
      busybox \
      ca-certificates \
      curl

ENV MIX_ENV=dev
ENV APP_HOME=/app
WORKDIR $APP_HOME


RUN mix do local.hex --force, local.rebar --force

COPY .tool-versions mix.exs mix.lock $APP_HOME/
RUN mix do deps.get --only=$MIX_ENV

COPY . $APP_HOME

EXPOSE 4000

# Start the main process.
CMD ["mix", "run", "--no-halt"]