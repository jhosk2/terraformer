FROM alpine:latest
# install git
RUN apk add git

# initialize terraform 
WORKDIR /workspace/lib
ENV TF_VERSION=0.11.3
COPY download_tf.sh .
RUN /workspace/lib/download_tf.sh

# RUN
COPY run.sh .
ENV REPOSITORY_URL=
ENV PROJECT_PATH=
ENV TF_COMMAND=plan
ENV TF_WORKSPACE=default
ENTRYPOINT [ "sh", "run.sh" ]
 