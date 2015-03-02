#Dockerfile
FROM phusion/baseimage:0.9.15
MAINTAINER marc brown <marc@22walker.co.uk> v0.0.1

ENV username user

RUN mkdir /opt/headphones \
    && git clone https://github.com/rembo10/headphones.git /opt/headphones \
    
    
    
    RUN DEBIAN_FRONTEND=noninteractive apt-get clean \
    && rm -rf /var/lib/apt/lists/*  \
    && rm -rf /var/tmp/*  \
    rm -rf /tmp/*

VOLUME ["/config", "/download", "/media"]

EXPOSE 8181

# Copy the supervisord configuration files into the container
COPY headphones.conf /etc/supervisor/conf.d/headphones.conf
RUN echo "user=$username" >> /etc/supervisor/conf.d/headphones.conf

ENTRYPOINT ["python", "headphones/headphones.py"]
