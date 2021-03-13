# use a node base image
FROM node:7-onbuild

WORKDIR C:\\Windows\\System32\\config\\systemprofile\\AppData\\Local\\Jenkins\\.jenkins\\workspace\\scripted-hello-world-pipeline

# set maintainer
LABEL maintainer "academy@release.works"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000

