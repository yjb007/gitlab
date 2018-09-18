FROM gitlab/gitlab-ce:11.1.1-ce.0

COPY custom_hooks/ /custom_hooks/
COPY pattern.rb /opt/gitlab/embedded/service/gitlab-rails/lib/gitlab/sql/pattern.rb
RUN chown -R git:git /custom_hooks/ && chmod +x /custom_hooks/pre-receive.d/*
RUN sed -i 's#archive.ubuntu.com#mirrors.aliyun.com#g' /etc/apt/sources.list
RUN apt update && apt-get install -y python2.7 && apt-get -y install python-pip && pip install requests
