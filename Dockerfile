FROM python:3-alpine

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="Dockeried udemy-dl - by @r0oth3x49" \
  org.label-schema.description="A cross-platform python based utility to download courses from udemy for personal offline use." \
  org.label-schema.url="https://rokibhasansagar.github.io/docker_udemy-dl" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url=$VCS_URL \
  org.label-schema.vendor="Rokib Hasan Sagar" \
  org.label-schema.version=$VERSION \
  org.label-schema.schema-version="1.0"

LABEL maintainer="fr3akyphantom <rokibhasansagar2014@outlook.com>"

RUN apk --update --no-cache add git curl build-base libffi-dev openssl-dev

RUN git clone https://github.com/r0oth3x49/udemy-dl.git --depth 1

RUN pip3 install -r /udemy-dl/requirements.txt

RUN mkdir /downloads && chmod a+rw /downloads

WORKDIR /downloads

VOLUME ["/downloads"]

ENTRYPOINT ["python3", "/udemy-dl/udemy-dl.py", "-o", "/downloads"]
