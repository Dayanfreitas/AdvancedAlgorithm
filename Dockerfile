FROM ruby:3.0

RUN apt-get update && apt-get -y install \ 
    sudo \
    vim 

RUN adduser --disabled-password --gecos '' devel \
  && usermod -a -G sudo devel \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
  && echo 'devel:devel' | chpasswd

USER devel
WORKDIR /home

RUN sudo chown -R devel:devel /home

# install elixir
RUN sudo wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \ 
    && sudo dpkg -i erlang-solutions_2.0_all.deb \
    && sudo apt-get update \
    && sudo apt-get -y install esl-erlang \
    && sudo apt-get -y install elixir 


CMD /bin/bash
