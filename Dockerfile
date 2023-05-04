FROM jupyter/pyspark-notebook:ubuntu-22.04

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYSPARK_MAJOR_PYTHON_VERSION=3
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

USER root

RUN apt-get update --fix-missing && apt-get install -y wget git openssh-server \
    python3-dev libsasl2-dev libsasl2-2 libsasl2-modules-gssapi-mit krb5-user

#COPY .config/requirements.txt /app/requirements.txt
COPY .config/.jupyter /root/.jupyter
COPY .config/.jupyter/start_jupyter.sh /app/start_jupyter.sh

## Add kerberos conf in case of kerberized cluster
#COPY .config/.krb5/krb5.conf /etc/krb5.conf

#RUN pip install -r /app/requirements.txt

## Fix pyspark installation issues by reinstalling it
RUN pip install pyspark

ADD notebooks /app/notebooks

EXPOSE 8890 5022

WORKDIR /app
RUN chmod a+x /app/start_jupyter.sh

CMD ["/app/start_jupyter.sh", "bash"]