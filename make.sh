#!/bin/bash

rm wayround_org/toxcorebind/*.so
rm wayround_org/toxcorebind/*.c

reset

python3 ./setup.py build_ext --inplace

