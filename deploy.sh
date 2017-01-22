#!/bin/sh

hugo && \
rsync -av --delete public/ my:/srv/u.initd.cz/
