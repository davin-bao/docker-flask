FROM python:3.7

# COPY sources.list /etc/apt/sources.list

RUN apt-get update

RUN pip install -U pip
# RUN pip config set global.index-url http://mirrors.aliyun.com/pypi/simple
# RUN pip config set install.trusted-host mirrors.aliyun.com

RUN pip install Flask==1.1.2
RUN pip install flask-sqlalchemy==2.4.1
RUN pip install flask-restplus==0.13.0
RUN pip install Werkzeug==0.16.1
RUN pip install pymysql==0.9.3
RUN pip install python-dotenv==0.13.0
RUN pip install transitions==0.8.1
RUN pip install numpy==1.19.1
RUN pip install pandas==1.0.5
RUN pip install openpyxl==3.0.4
RUN pip install redis==3.5.3
RUN pip install gunicorn==20.0.4
RUN pip install gevent==20.6.2

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN export QT_QPA_PLATFORM=offscreen \
&& export QT_QPA_FONTDIR=/usr/share/fonts

RUN mkdir /home/www

WORKDIR /home/www
VOLUME ["/home/www"]

EXPOSE 5000
CMD ["/usr/local/bin/gunicorn", "--chdir", "/home/www", "app:app", "-c", "/etc/flask/gunicorn.conf"]
