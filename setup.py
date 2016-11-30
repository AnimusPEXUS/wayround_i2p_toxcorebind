#!/usr/bin/python3

import glob

from setuptools import setup, Extension
#from Cython.Build import cythonize
from Cython.Distutils import build_ext

import wayround_i2p.utils.cython
import wayround_i2p.utils.pkgconfig

cflags = wayround_i2p.utils.pkgconfig.pkgconfig('libtoxcore', ['--cflags'])
ldflags = wayround_i2p.utils.pkgconfig.pkgconfig('libtoxcore', ['--libs'])

if cflags is None or ldflags is None:
    raise Exception(
        "can't determine `libtoxcore' compilation and linking parameters"
        " using pkg-config"
        )

if isinstance(cflags, str):
    cflags = cflags.split()

if isinstance(ldflags, str):
    ldflags = ldflags.split()

include_dirs = wayround_i2p.utils.pkgconfig.pkgconfig_include(
    'libtoxcore',
    remove_Is=True
    )

libs = wayround_i2p.utils.pkgconfig.pkgconfig_libs(
    'libtoxcore',
    remove_ls=True
    )

extensions = [
    Extension(
        "wayround_i2p.toxcorebind.tox",
        ["wayround_i2p/toxcorebind/tox.pyx"],
        extra_compile_args=cflags,
        extra_link_args=ldflags
        )
    ]

wayround_i2p.utils.cython.cythonize(
    glob.glob('wayround_i2p/toxcorebind/*.pyx'),
    cython_options=['-3']
    )

setup(
    name='wayround_i2p_toxcorebind',
    version='0.6',
    author='Alexey Gorshkov',
    author_email='animus@wayround.org',
    url='https://github.com/AnimusPEXUS/wayround_i2p_toxcorebind',
    description='Python toxcore binding',
    packages=[
        'wayround_i2p.toxcorebind'
        ],
    install_requires=[
        'Cython',
        'wayround_i2p_utils',
        ],
    classifiers=[
        'License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)',
        'Operating System :: POSIX',
        ],
    ext_modules=extensions,
    cmdclass={'build_ext': build_ext},
    package_data={'wayround_i2p.toxcorebind': ['*.pxd']},
    )
