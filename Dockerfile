FROM circleci/python:3.7-stretch

RUN sudo pip install --no-cache-dir azure-cli==2.0.43
