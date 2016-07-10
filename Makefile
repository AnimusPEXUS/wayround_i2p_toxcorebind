
PYTHON=python3

all:
	$(PYTHON) ./setup.py build_ext --inplace

clean:
	make -C wayround_org/toxcorebind clean

