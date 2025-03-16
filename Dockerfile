FROM debian:bullseye

RUN apt-get -y -q update \
  && apt-get -y -q  \
  install sudo nano \
  git unzip xz-utils zip curl \
  net-tools \
  wget build-essential python2 python2-dev \
  python3 python3-dev python3-pip python3-pefile python3-yara


RUN pip3 install pycrypto

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output /tmp/get-pip.py \
  && python2 /tmp/get-pip.py \
  && python2 -m pip install distorm3 pycryptodome yara-python

RUN git clone https://github.com/volatilityfoundation/volatility /opt/volatility2/

RUN echo '#!/bin/bash\npython2 /opt/volatility2/vol.py ${@}' > /bin/volatility2 \
  && chmod +x /bin/volatility2

RUN git clone https://github.com/volatilityfoundation/volatility3 /opt/volatility3/

RUN echo '#!/bin/bash\npython3 /opt/volatility3/vol.py ${@}' > /bin/volatility3 \
  && chmod +x /bin/volatility3

RUN echo 'alias v="volatility2"' >> ~/.bashrc
RUN echo 'alias volatility="volatility2"' >> ~/.bashrc
RUN echo 'alias v2="volatility2"' >> ~/.bashrc
RUN echo 'alias v3="volatility3"' >> ~/.bashrc

RUN mkdir -p /data/

WORKDIR /data/


# 
# CMD [ "/bin/bash" ]
#
CMD ["tail", "-f", "/dev/null"]


