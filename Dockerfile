FROM reubenbond/playframework2
MAINTAINER LeanKanbanFrance team <speakers2015@leankanban.fr>

COPY . /app

# Compile the application and prepare it for staging
RUN cd /app; play2 clean stage

WORKDIR /app/target/universal/stage

CMD bin/cfp-devoxxfr
