FROM reubenbond/playframework2
MAINTAINER BreizhCamp team <team@breizhcamp.org>

COPY . /app
WORKDIR /app

# Compile the application and prepare it for staging
RUN play2 clean stage

CMD target/universal/stage/bin/cfp-devoxxfr
