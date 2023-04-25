# syntax=docker/dockerfile:1

# FROM python:alpine

# WORKDIR /python-docker

# COPY requirements.txt requirements.txt
# RUN pip3 install -r requirements.txt

# COPY . .
# RUN ls
# # Create a new user with UID 10016
# RUN addgroup -g 10016 choreo && \
#     adduser  --disabled-password  --no-create-home --uid 10016 --ingroup choreo choreouser
# USER 10016
# EXPOSE 5000
# CMD [ "flask", "run", "--host=0.0.0.0"]


FROM alpine:latest
RUN apk update
RUN apk add py-pip
RUN apk add --no-cache python3-dev 
RUN pip install --upgrade pip
WORKDIR /app
COPY . /app
RUN pip --no-cache-dir install -r requirements.txt
RUN addgroup -g 10016 choreo && \
    adduser  --disabled-password  --no-create-home --uid 10016 --ingroup choreo choreouser
USER 10016
EXPOSE 5000
CMD [ "flask", "run", "--host=0.0.0.0"]
# CMD ["python3", "app.py"]
# a change 