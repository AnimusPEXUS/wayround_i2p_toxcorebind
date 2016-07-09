
PYTHON=python3

all: build_proc


build_proc:
	touch wayround_org/__init__.py
	make -C wayround_org/toxcorebind all
	-rm wayround_org/__init__.py
	$(PYTHON) ./setup.py build_ext --inplace

clean:
	-rm wayround_org/__init__.py
	make -C wayround_org/toxcorebind clean

