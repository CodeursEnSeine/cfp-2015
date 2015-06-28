FROM reubenbond/playframework2
MAINTAINER CodeursEnSeine team <contact@codeursenseine.com>

COPY . /app

# Compile the application and prepare it for staging
RUN cd /app; play2 clean stage

WORKDIR /app/target/universal/stage

CMD bin/cfp-devoxxfr
