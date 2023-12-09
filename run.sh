### https://hub.docker.com/_/r-base
docker build -t myscript .
docker run -e SCRIPT_TO_RUN=${1} -v "$PWD"/output:/tmp/ myscript 
cat ./output/${1}/${1}.log