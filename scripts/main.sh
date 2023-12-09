#! /bin/bash
mkdir -p /tmp/${SCRIPT_TO_RUN}
Rscript ${SCRIPT_TO_RUN}.R > /tmp/${SCRIPT_TO_RUN}/${SCRIPT_TO_RUN}.log
