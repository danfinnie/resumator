FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y texlive-xetex texlive-latex-recommended texlive-latex-extra git curl build-essential bison openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev libpq-dev postgresql-client-9.3 nodejs

RUN git clone https://github.com/sstephenson/ruby-build.git /opt/ruby-build
RUN /opt/ruby-build/bin/ruby-build 2.1.2 /opt/ruby-2.1.2/
ENV PATH /opt/ruby-2.1.2/bin/:$PATH

ADD . /opt/resumator
WORKDIR /opt/resumator
RUN gem install bundler
ENV RAILS_ENV production
RUN bundle install --deployment
CMD bash start.sh
EXPOSE 3000
