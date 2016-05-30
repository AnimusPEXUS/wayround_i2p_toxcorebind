#!/usr/bin/python3

from setuptools import setup, Extension
from Cython.Distutils import build_ext

setup(
    name='wayround_org_toxcorebind',
    version='0.0',
    description='Python toxcore binding',
    packages=[
        'wayround_org.toxcorebind'
        ],
    ext_modules=[
        Extension(
            "wayround_org.toxcorebind",
            ["wayround_org/toxcorebind/tox.pyx"],
            libraries=["toxcore"]
            # TODO: pkg-config
            )
        ],
    cmdclass={'build_ext': build_ext},
    package_data={'wayround_org.toxcorebind': ['*.pxd']},
    )
