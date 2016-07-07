#!/usr/bin/python3

from setuptools import setup, Extension
#from Cython.Build import cythonize
from Cython.Distutils import build_ext

import wayround_org.utils.pkgconfig

cflags = wayround_org.utils.pkgconfig.pkgconfig('libtoxcore', ['--cflags'])
ldflags = wayround_org.utils.pkgconfig.pkgconfig('libtoxcore', ['--libs'])

if cflags is None or ldflags is None:
    raise Exception(
        "can't determine `libtoxcore' compilation and linking parameters"
        " using pkg-config"
        )

if ldflags is None:
    raise Exception("can't determine --cflags using pkg-config")

if isinstance(cflags, str):
    cflags = cflags.split()

if isinstance(ldflags, str):
    ldflags = ldflags.split()

include_dirs = wayround_org.utils.pkgconfig.pkgconfig_include(
    'libtoxcore',
    remove_Is=True
    )

libs = wayround_org.utils.pkgconfig.pkgconfig_libs(
    'libtoxcore',
    remove_ls=True
    )

if isinstance(include_dirs, str):
    include_dirs = include_dirs.split()

if isinstance(libs, str):
    libs = libs.split()

line = '-' * 10

print("""\
---v--- libtoxcore information ---v---
cflags: {}
ldflags: {}
---^--- libtoxcore information ---^---""".format(
        cflags,
        ldflags
        )
    )


setup(
    name='wayround_org_toxcorebind',
    version='0.0',
    description='Python toxcore binding',
    packages=[
        'wayround_org.toxcorebind'
        ],
    ext_modules=# cythonize('wayround_org/toxcorebind/tox.pyx'),
    [
        Extension(
            "wayround_org.toxcorebind.tox",
            ["wayround_org/toxcorebind/tox.pyx"],
            # libraries=libs,
            # include_dirs=include_dirs,
            extra_compile_args=cflags,
            extra_link_args=ldflags
            )
        ],
    cmdclass={'build_ext': build_ext},
    package_data={'wayround_org.toxcorebind': ['*.pxd']},
    )
