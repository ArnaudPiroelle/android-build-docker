FROM openjdk:8-jdk-alpine

RUN apk --no-cache add wget bash unzip git

RUN wget -O android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip

ENV ANDROID_HOME /android-sdk
ENV PATH $PATH:$ANDROID_SDK_HOME/tools
ENV PATH $PATH:$ANDROID_SDK_HOME/platform-tools
ENV TERM dumb
ENV JAVA_OPTS "-Xms4096m -Xmx4096m"
ENV GRADLE_OPTS "-XX:+UseG1GC -XX:MaxGCPauseMillis=1000"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]