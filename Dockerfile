FROM ruby:2.5

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
&& echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list

RUN apt-get update \
 && apt-get install --no-install-recommends -y build-essential google-chrome-stable libxml2-dev libxslt-dev nodejs \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle config build.nokogiri --use-system-libraries \
                                 --with-xml2-config=/usr/bin/xml2-config \
				 --with-xslt-config=/usr/bin/xslt-config \
 && bundle install

COPY . .

RUN useradd -m developer \
 && chown -R developer:developer $GEM_HOME \
 && chown -R developer:developer .

USER developer
# RUN chromedriver_helper_binary=$(bin/rails runner -e test 'puts Chromedriver::Helper.new.binary_path') \
#  && ln -sf /usr/bin/chromedriver $chromedriver_helper_binary
