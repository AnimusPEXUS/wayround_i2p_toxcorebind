#!/bin/bash

rm wayround_i2p/toxcorebind/*.so
rm wayround_i2p/toxcorebind/*.c

reset

python3 ./setup.py build_ext --inplace

