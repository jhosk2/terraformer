#!/bin/sh
# 설치된 버전이 아니면 테라폼 바이너리 업데이트

# ENV VAR가 제대로 입력되어 있는지 찾아본다
if [ ${#TF_VERSION} -eq 0 ]; then
    echo "No TF_VERSION"
    exit 1
fi
if [ ${#REPOSITORY_URL} -eq 0 ]; then
    echo "No REPOSITORY_URL"
    exit 1
fi

if [ ${#TF_COMMAND} -eq 0 ]; then
    echo "No TF_COMMAND"
    exit 1
fi

echo "Current tf version [$TF_VERSION]"

INSTALLED=$(ls /bin | grep $TF_VERSION)
if [ ${#INSTALLED} -eq 0 ]; then
    sh download_tf.sh 
fi

echo  "Cloning into $REPOSITORY_URL.."
git clone $REPOSITORY_URL

REPOSITORY_NAME=$(basename -- "$REPOSITORY_URL")
DIR_NAME="${REPOSITORY_NAME%.*}/${PROJECT_PATH}"

cd $DIR_NAME
terraform_${TF_VERSION} init
terraform_${TF_VERSION} ${TF_COMMAND}