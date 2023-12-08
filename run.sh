### https://hub.docker.com/_/r-base
docker build -t myscript .
docker run -v "$PWD"/output:/tmp/ myscript
ls -l ./output