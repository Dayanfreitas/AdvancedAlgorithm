FROM ruby:3.0
WORKDIR /home
VOLUME ['./', './home']
COPY . .

RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \ 
    && dpkg -i erlang-solutions_2.0_all.deb \
    && apt-get update \
    && apt-get -y install esl-erlang \
    && apt-get -y install elixir 

