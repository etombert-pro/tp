FROM ubuntu:latest
MAINTAINER Elvinn Tombert 
WORKDIR /workspace
RUN apt-get update -y && apt-get dist-upgrade -y && \
    apt-get install python3 -y && \
    apt-get install python3-pip -y && \
    pip3 install virtualenv && \
    apt-get install git -y
RUN git config --global user.name "etombert" && \
    git config --global user.email elvinn.tombert@hetic.net && \
    git config --global user.password "VIEWFROMmywindow$1995"
RUN mkdir workspace
COPY requirements.txt /elvinn_tombert
RUN virtualenv -p python3 venv
CMD sh -c 'source venv/bin/activate;'   
RUN pip3 install -r requirements.txt
EXPOSE 8888
CMD ["sh", "-c" , "jupyter notebook --no-browser --port=8888 --ip='0.0.0.0' --allow-root"]