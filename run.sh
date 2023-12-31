### https://hub.docker.com/_/r-base
docker build -t myscript . > ./build.log
mkdir -p ./output/${1}
docker run -e SCRIPT_TO_RUN=${1} -v "$PWD"/output:/tmp/ -v "$PWD"/scripts:/usr/local/src/myscripts -v "$PWD"/data_sets:/usr/local/src/myscripts/data_sets myscript
cat ./output/${1}/${1}.log
#chown ec2-user:ec2-user ./output/${1}/*