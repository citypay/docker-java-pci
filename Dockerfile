FROM citypay/java:1.8

RUN export OSQUERY_KEY=1484120AC4E9F8A1A577AEEE97A80C63C9D8B80B \
    && apt-get update \
    && apt-get install gnupg net-tools -y \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys $OSQUERY_KEY \
    && echo 'deb [arch=amd64] https://pkg.osquery.io/deb deb main' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install osquery sudo \
    && apt-get purge gnupg -y \
    && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log} \
    && rm -rf /var/log/apt && rm -rf /var/log/{dpkg*,alternatives*} \
    && groupadd osquery

RUN echo "%osquery ALL=(ALL) NOPASSWD: /usr/bin/osqueryd" > /etc/sudoers.d/osquery
COPY files/osquery.conf /etc/osquery/osquery.conf
COPY files/fim.conf /etc/osquery/fim.conf

CMD osqueryd & && /bin/bash

