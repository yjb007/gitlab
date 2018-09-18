FROM gitlab/gitlab-ce:11.1.1-ce.0

COPY custom_hooks/ /custom_hooks/
RUN chown -R git:git /custom_hooks/ && chmod +x /custom_hooks/pre-receive.d/*
COPY pattern.rb /opt/gitlab/embedded/service/gitlab-rails/lib/gitlab/sql/pattern.rb
RUN apt update && apt-get install -y python2.7 && apt-get -y install python-pip && pip install requests
