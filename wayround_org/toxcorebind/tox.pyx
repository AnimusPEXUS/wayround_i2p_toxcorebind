
cimport wayround_org.toxcorebind.tox_h

# from wayround_org.toxcorebind.wayround_org.toxcorebind.tox_h cimport *

cimport libc.stdlib
cimport libc.stdio
cimport libc.string

from libc.stdint cimport *


import builtins

TOX_VERSION_MAJOR = wayround_org.toxcorebind.tox_h.TOX_VERSION_MAJOR
TOX_VERSION_MINOR = wayround_org.toxcorebind.tox_h.TOX_VERSION_MINOR
TOX_VERSION_PATCH = wayround_org.toxcorebind.tox_h.TOX_VERSION_PATCH

TOX_PUBLIC_KEY_SIZE = wayround_org.toxcorebind.tox_h.TOX_PUBLIC_KEY_SIZE
TOX_SECRET_KEY_SIZE = wayround_org.toxcorebind.tox_h.TOX_SECRET_KEY_SIZE
TOX_ADDRESS_SIZE = wayround_org.toxcorebind.tox_h.TOX_ADDRESS_SIZE
TOX_MAX_NAME_LENGTH = wayround_org.toxcorebind.tox_h.TOX_MAX_NAME_LENGTH
TOX_MAX_STATUS_MESSAGE_LENGTH = wayround_org.toxcorebind.tox_h.TOX_MAX_STATUS_MESSAGE_LENGTH
TOX_MAX_FRIEND_REQUEST_LENGTH = wayround_org.toxcorebind.tox_h.TOX_MAX_FRIEND_REQUEST_LENGTH
TOX_MAX_MESSAGE_LENGTH = wayround_org.toxcorebind.tox_h.TOX_MAX_MESSAGE_LENGTH
TOX_MAX_CUSTOM_PACKET_SIZE = wayround_org.toxcorebind.tox_h.TOX_MAX_CUSTOM_PACKET_SIZE
TOX_HASH_LENGTH = wayround_org.toxcorebind.tox_h.TOX_HASH_LENGTH
TOX_FILE_ID_LENGTH = wayround_org.toxcorebind.tox_h.TOX_FILE_ID_LENGTH
TOX_MAX_FILENAME_LENGTH = wayround_org.toxcorebind.tox_h.TOX_MAX_FILENAME_LENGTH


def tox_version_major():
    return < int > wayround_org.toxcorebind.tox_h.tox_version_major()


def tox_version_minor():
    return < int > wayround_org.toxcorebind.tox_h.tox_version_minor()


def tox_version_patch():
    return < int > wayround_org.toxcorebind.tox_h.tox_version_patch()


def tox_version_is_compatible(
    major,
    minor,
    patch
        ):

    ret = bool(
        wayround_org.toxcorebind.tox_h.tox_version_is_compatible(
            major,
            minor,
            patch
        )
        )

    return ret

TOX_USER_STATUS_NONE = wayround_org.toxcorebind.tox_h.TOX_USER_STATUS_NONE
TOX_USER_STATUS_AWAY = wayround_org.toxcorebind.tox_h.TOX_USER_STATUS_AWAY
TOX_USER_STATUS_BUSY = wayround_org.toxcorebind.tox_h.TOX_USER_STATUS_BUSY

TOX_MESSAGE_TYPE_NORMAL = wayround_org.toxcorebind.tox_h.TOX_MESSAGE_TYPE_NORMAL
TOX_MESSAGE_TYPE_ACTION = wayround_org.toxcorebind.tox_h.TOX_MESSAGE_TYPE_ACTION

TOX_PROXY_TYPE_NONE = wayround_org.toxcorebind.tox_h.TOX_PROXY_TYPE_NONE
TOX_PROXY_TYPE_HTTP = wayround_org.toxcorebind.tox_h.TOX_PROXY_TYPE_HTTP
TOX_PROXY_TYPE_SOCKS5 = wayround_org.toxcorebind.tox_h.TOX_PROXY_TYPE_SOCKS5

TOX_SAVEDATA_TYPE_NONE = wayround_org.toxcorebind.tox_h.TOX_SAVEDATA_TYPE_NONE
TOX_SAVEDATA_TYPE_TOX_SAVE = wayround_org.toxcorebind.tox_h.TOX_SAVEDATA_TYPE_TOX_SAVE
TOX_SAVEDATA_TYPE_SECRET_KEY = wayround_org.toxcorebind.tox_h.TOX_SAVEDATA_TYPE_SECRET_KEY


class Tox_Options:

    def __init__(self, pointer):
        self._pointer = pointer
        self._ok = False
        return

    def __del__(self):
        wayround_org.toxcorebind.tox_h.tox_options_free(
            < wayround_org.toxcorebind.tox_h.Tox_Options * >self._pointer
            )
        self._pointer = None
        return

    def reset_defaults(self):
        wayround_org.toxcorebind.tox_h.tox_options_default(
            < wayround_org.toxcorebind.tox_h.Tox_Options * >self._pointer
            )
        return

    @property
    def ipv6_enabled(self):
        ret = bool(
            (< wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)
            .ipv6_enabled
            )
        return ret

    @ipv6_enabled.setter
    def ipv6_enabled(self, value):
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .ipv6_enabled = < int > bool(value)
        return

    @property
    def udp_enabled(self):
        ret = bool(
         (< wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)
         .udp_enabled
         )
        return ret

    @udp_enabled.setter
    def udp_enabled(self, value):
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .udp_enabled = < int > bool(value)
        return

    @property
    def proxy_type(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .proxy_type
        return ret

    @proxy_type.setter
    def proxy_type(self, value):
        if not isinstance(value, int):
            raise TypeError("integer expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .proxy_type = value
        return

    @property
    def proxy_host(self):
        ret = < bytes > (
            < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer
        ).proxy_host
        return ret

    @proxy_host.setter
    def proxy_host(self, value):
        if not isinstance(value, bytes):
            raise TypeError("bytes expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .proxy_host = value
        return

    @property
    def proxy_port(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .proxy_port
        return ret

    @proxy_port.setter
    def proxy_port(self, value):
        if not isinstance(value, int):
            raise TypeError("integer expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .proxy_port = value
        return

    @property
    def start_port(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .start_port
        return ret

    @start_port.setter
    def start_port(self, value):
        if not isinstance(value, int):
            raise TypeError("integer expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .start_port = value
        return

    @property
    def end_port(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .end_port
        return ret

    @end_port.setter
    def end_port(self, value):
        if not isinstance(value, int):
            raise TypeError("integer expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .end_port = value
        return

    @property
    def tcp_port(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .tcp_port
        return ret

    @tcp_port.setter
    def tcp_port(self, value):
        if not isinstance(value, int):
            raise TypeError("integer expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .tcp_port = value
        return

    @property
    def savedata_type(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .savedata_type
        return ret

    @savedata_type.setter
    def savedata_type(self, value):
        if not isinstance(value, int):
            raise TypeError("integer expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .savedata_type = value
        return

    @property
    def savedata_data(self):
        t = (< wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)
        ret = t.savedata_data[0:self.savedata_length]
        return ret

    @savedata_data.setter
    def savedata_data(self, value):
        if not isinstance(value, bytes):
            raise TypeError("bytes expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .savedata_data = value
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .savedata_length = len(value)
        return

    @property
    def savedata_length(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > self._pointer)\
            .savedata_length
        return ret


def tox_options_new():
    cdef wayround_org.toxcorebind.tox_h.TOX_ERR_OPTIONS_NEW error
    cdef wayround_org.toxcorebind.tox_h.Tox_Options * res
    res = wayround_org.toxcorebind.tox_h.tox_options_new(& error)
    if error == 0:
        ret = Tox_Options(< uintptr_t > res)
        ret.reset_defaults()
        ret._ok = True
    else:
        ret = None
    return ret, error


class Tox:

    def __init__(self, pointer):
        self._pointer = pointer
        self._ok = False
        return

    def kill(self):
        wayround_org.toxcorebind.tox_h.tox_kill(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer
            )
        return

    def get_savedata_size(self):
        ret = wayround_org.toxcorebind.tox_h.tox_get_savedata_size(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer
            )
        return ret

    def get_savedata(self):

        cdef uint8_t * data

        size = self.get_savedata_size()

        data = <uint8_t * >libc.stdlib.malloc(size)

        ret = wayround_org.toxcorebind.tox_h.tox_get_savedata(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer,
            data
            )

        ret = <bytes > data[:size]

        libc.stdlib.free(data)

        return ret

    def bootstrap(
            self,
            address,
            port,
            public_key
            ):

        if not isinstance(address, bytes):
            raise TypeError("`address' must be bytes")

        if not isinstance(public_key, bytes):
            raise TypeError("`public_key' must be bytes")

        if len(public_key) != wayround_org.toxcorebind.tox_h.TOX_PUBLIC_KEY_SIZE:
            raise ValueError("`public_key' invalid format")

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_BOOTSTRAP error

        # libc.stdio.printf(
        #    "address: %s, strlen: %d\n",
        #    < char * > address,
        #    libc.string.strlen(< char * > address)
        #    )
        #print("address ({}): {}".format())

        ret = wayround_org.toxcorebind.tox_h.tox_bootstrap(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer,
            address,
            port,
            public_key,
            & error
            )

        print('bootxstrap exit')

        return bool(ret), error

    def add_tcp_relay(
            self,
            address,
            port,
            public_key
            ):

        if not isinstance(address, bytes):
            raise TypeError("`address' must be bytes")

        if not isinstance(public_key, bytes):
            raise TypeError("`public_key' must be bytes")

        if len(public_key) != wayround_org.toxcorebind.tox_h.TOX_PUBLIC_KEY_SIZE:
            raise ValueError("`public_key' invalid format")

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_BOOTSTRAP error

        ret = wayround_org.toxcorebind.tox_h.tox_add_tcp_relay(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer,
            address,
            port,
            public_key,
            & error
            )

        return bool(ret), error

    def self_get_connection_status(self):
        ret = wayround_org.toxcorebind.tox_h.tox_self_get_connection_status(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer
            )
        return ret

    def callback_self_connection_status(self, callback):
        o = tuple(self, callback)
        wayround_org.toxcorebind.tox_h.tox_callback_self_connection_status(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer,
            < wayround_org.toxcorebind.tox_h.tox_self_connection_status_cb * >
            _tox_self_connection_status_callback,
            < void * >o
            )
        return

    def iteration_interval(self):
        ret = wayround_org.toxcorebind.tox_h.tox_iteration_interval(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer
            )
        return ret

    def iterate(self):
        wayround_org.toxcorebind.tox_h.tox_iterate(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer
            )
        return

    def self_get_address(self):

        cdef uint8_t * address = NULL

        address = <uint8_t * >libc.stdlib.malloc(
            wayround_org.toxcorebind.tox_h.TOX_ADDRESS_SIZE
            )

        wayround_org.toxcorebind.tox_h.tox_self_get_address(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer,
            address
            )

        ret = <bytes > address[:wayround_org.toxcorebind.tox_h.TOX_ADDRESS_SIZE]

        libc.stdlib.free(address)

        return ret

    def self_set_nospam(self, nospam):
        wayround_org.toxcorebind.tox_h.tox_self_set_nospam(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer,
            nospam
            )
        return

    def self_get_nospam(self):
        ret = wayround_org.toxcorebind.tox_h.tox_self_get_nospam(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer
            )
        return ret

    def self_get_public_key(self):

        cdef uint8_t * key = NULL

        key = <uint8_t * >libc.stdlib.malloc(
            wayround_org.toxcorebind.tox_h.TOX_PUBLIC_KEY_SIZE
            )

        wayround_org.toxcorebind.tox_h.tox_self_get_public_key(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer,
            key
            )

        ret = <bytes > key[:wayround_org.toxcorebind.tox_h.TOX_PUBLIC_KEY_SIZE]

        libc.stdlib.free(key)

        return ret

    def self_get_secret_key(self, secret_key):

        cdef uint8_t * key = NULL

        key = <uint8_t * >libc.stdlib.malloc(
            wayround_org.toxcorebind.tox_h.TOX_SECRET_KEY_SIZE
            )

        wayround_org.toxcorebind.tox_h.tox_self_get_secret_key(
            < wayround_org.toxcorebind.tox_h.Tox * >self._pointer,
            key
            )

        ret = <bytes > key[:wayround_org.toxcorebind.tox_h.TOX_SECRET_KEY_SIZE]

        libc.stdlib.free(key)

        return ret

    def self_set_name(self, name):

        if not isinstance(name, bytes):
            raise TypeError("`name' must be bytes")

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_SET_INFO error

        ret = wayround_org.toxcorebind.tox_h.tox_self_set_name(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            name,
            len(name),
            & error
            )

        return bool(ret), error

    def self_get_name_size(self):
        ret = wayround_org.toxcorebind.tox_h.tox_self_get_name_size(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer
            )
        return ret

    def self_get_name(self):

        cdef uint8_t * data

        size = self.self_get_name_size()

        data = <uint8_t * >libc.stdlib.malloc(size)

        ret = wayround_org.toxcorebind.tox_h.tox_self_get_name(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            data
            )

        ret = <bytes > data[:size]

        libc.stdlib.free(data)

        return ret


cdef _tox_self_connection_status_callback(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        wayround_org.toxcorebind.tox_h.TOX_CONNECTION connection_status,
        void * user_data
        ):
    obj = < object > user_data
    ret = obj[1](obj[0], connection_status)
    return ret


def tox_new(options=None):

    if options is not None and not isinstance(options, Tox_Options):
        raise TypeError("`options' invalid type")

    if (options is not None and
            (not hasattr(options, '_ok') or not options._ok)):
        raise ValueError(
            "`options' value should have been created with "
            "tox_options_new()"
            )

    cdef wayround_org.toxcorebind.tox_h.TOX_ERR_NEW error
    cdef wayround_org.toxcorebind.tox_h.Tox * res

    if options is not None:

        res = wayround_org.toxcorebind.tox_h.tox_new(
            < wayround_org.toxcorebind.tox_h.Tox_Options * >options._pointer,
            & error
            )

    else:

        res = wayround_org.toxcorebind.tox_h.tox_new(NULL, & error)

    if error == 0:
        ret = Tox(<uintptr_t> res)
        ret._ok = True
    else:
        ret = None
    return ret, error
