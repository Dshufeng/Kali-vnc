FROM kalilinux/kali-linux-docker
MAINTAINER shufengDong <dongshufeng@powerun.org.cn>

# Add Xwindows configuration
ADD .vnc /root/.vnc
ADD .Xauthority /root/.Xauthority
# Copy startup script
ADD startup.sh /startup.sh

ENV USER root
# Run startup script
RUN apt-get update && \ 
    apt-get install -y && \
    apt-get install -y vim tightvncserver x11vnc xfce4 && \
    sed -i "s/1024x768/1280x1024/g" /usr/bin/vncserver && \
    chmod 0755 /startup.sh
   
RUN apt-get install -y kali-linux-all && apt-get clean all

# Expose VNC
EXPOSE 5901

ENTRYPOINT ["/startup.sh"]
