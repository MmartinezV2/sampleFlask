# Imatge base
FROM alpine:3.5
#FROM ubuntu:latest
# Instal·lam pyhon i pip
RUN apk add --update py2-pip
#RUN apt-get update && apt-get install python-pip -y && apt-get clean
# Instal·lar moduls python reqerits per l'aplicacio
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
# Copiar l'aplicacio
COPY app.py /usr/src/app/app.py
COPY templates/index.html /usr/src/app/templates/
# indicar el port que exposara el contenidor
EXPOSE 5000
# executar l'aplicacio
CMD ["python", "/usr/src/app/app.py"]
