#!/bin/bash

CUR=$(dirname $0)

${CUR}/bin/kend start
tail -f ${CUR}/data/logs/kend.out
