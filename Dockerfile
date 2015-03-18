FROM reubenbond/playframework2
MAINTAINER BreizhCamp team <team@breizhcamp.org>

COPY . /app

# Compile the application and prepare it for staging
RUN cd /app; play2 clean stage

WORKDIR /app/target/universal/stage

CMD bin/cfp-devoxxfr
