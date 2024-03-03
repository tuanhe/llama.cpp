FROM ubuntu:20.04

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN  apt-get clean && \
     apt-get update && \
     apt-get install -y --no-install-recommends \
     build-essential libgl-dev tzdata \
     wget curl vim cmake g++ gcc curl gnupg2 make git ccache\
     python3 python3-dev python3-pip libssl-dev \
     && pip3 install --upgrade pip

ADD . /tmp
RUN pip3 install  -r /tmp/requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple && rm -rf /tmp/*

EXPOSE 8050
 
CMD ["/bin/bash"]
