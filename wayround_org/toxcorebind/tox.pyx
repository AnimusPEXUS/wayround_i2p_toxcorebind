
cimport wayround_org.toxcorebind.tox_h

# from wayround_org.toxcorebind.wayround_org.toxcorebind.tox_h cimport *

cimport libc.stdlib
cimport libc.stdio
cimport libc.string

from libc.stdint cimport *


import builtins
import sys

# UINT64_MAX = libc.stdint.UINT64_MAX

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
            < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer
            )
        self._pointer = None
        return

    def reset_defaults(self):
        wayround_org.toxcorebind.tox_h.tox_options_default(
            < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer
            )
        return

    @property
    def ipv6_enabled(self):
        ret = bool(
            (< wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)
            .ipv6_enabled
            )
        return ret

    @ipv6_enabled.setter
    def ipv6_enabled(self, value):
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)\
            .ipv6_enabled = < int > bool(value)
        return

    @property
    def udp_enabled(self):
        ret = bool(
         (< wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)
         .udp_enabled
         )
        return ret

    @udp_enabled.setter
    def udp_enabled(self, value):
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)\
            .udp_enabled = < int > bool(value)
        return

    @property
    def proxy_type(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)\
            .proxy_type
        return ret

    @proxy_type.setter
    def proxy_type(self, value):
        if not isinstance(value, int):
            raise TypeError("integer expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t >  self._pointer)\
            .proxy_type = value
        return

    @property
    def proxy_host(self):
        ret = < bytes > (
            < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer
        ).proxy_host
        return ret

    @proxy_host.setter
    def proxy_host(self, value):
        if not isinstance(value, bytes):
            raise TypeError("bytes expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)\
            .proxy_host = value
        return

    @property
    def proxy_port(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)\
            .proxy_port
        return ret

    @proxy_port.setter
    def proxy_port(self, value):
        if not isinstance(value, int):
            raise TypeError("integer expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t >  self._pointer)\
            .proxy_port = value
        return

    @property
    def start_port(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t >  self._pointer)\
            .start_port
        return ret

    @start_port.setter
    def start_port(self, value):
        if not isinstance(value, int):
            raise TypeError("integer expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t >  self._pointer)\
            .start_port = value
        return

    @property
    def end_port(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t >  self._pointer)\
            .end_port
        return ret

    @end_port.setter
    def end_port(self, value):
        if not isinstance(value, int):
            raise TypeError("integer expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)\
            .end_port = value
        return

    @property
    def tcp_port(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)\
            .tcp_port
        return ret

    @tcp_port.setter
    def tcp_port(self, value):
        if not isinstance(value, int):
            raise TypeError("integer expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)\
            .tcp_port = value
        return

    @property
    def savedata_type(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t >  self._pointer)\
            .savedata_type
        return ret

    @savedata_type.setter
    def savedata_type(self, value):
        if not isinstance(value, int):
            raise TypeError("integer expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)\
            .savedata_type = value
        return

    @property
    def savedata_data(self):
        t = (< wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)
        ret = t.savedata_data[0:self.savedata_length]
        return ret

    @savedata_data.setter
    def savedata_data(self, value):
        if not isinstance(value, bytes):
            raise TypeError("bytes expected")
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)\
            .savedata_data = value
        ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t > self._pointer)\
            .savedata_length = len(value)
        return

    @property
    def savedata_length(self):
        ret = ( < wayround_org.toxcorebind.tox_h.Tox_Options * > < uintptr_t >  self._pointer)\
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
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer
            )
        return

    def get_savedata_size(self):
        ret = wayround_org.toxcorebind.tox_h.tox_get_savedata_size(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer
            )
        return ret

    def get_savedata(self):

        cdef uint8_t * data

        size = self.get_savedata_size()

        data = <uint8_t * >libc.stdlib.malloc(size)

        ret = wayround_org.toxcorebind.tox_h.tox_get_savedata(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
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

        public_key_check(public_key)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_BOOTSTRAP error

        ret = wayround_org.toxcorebind.tox_h.tox_bootstrap(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            address,
            port,
            public_key,
            & error
            )

        return bool(ret), error

    def add_tcp_relay(
            self,
            address,
            port,
            public_key
            ):

        if not isinstance(address, bytes):
            raise TypeError("`address' must be bytes")

        public_key_check(public_key)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_BOOTSTRAP error

        ret = wayround_org.toxcorebind.tox_h.tox_add_tcp_relay(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            address,
            port,
            public_key,
            & error
            )

        return bool(ret), error

    def self_get_connection_status(self):
        ret = wayround_org.toxcorebind.tox_h.tox_self_get_connection_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer
            )
        return ret

    def callback_self_connection_status(self, callback):
        o = tuple(self, callback)
        wayround_org.toxcorebind.tox_h.tox_callback_self_connection_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            < wayround_org.toxcorebind.tox_h.tox_self_connection_status_cb * >
            _tox_self_connection_status_callback,
            < void * >o
            )
        return

    def iteration_interval(self):
        ret = wayround_org.toxcorebind.tox_h.tox_iteration_interval(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer
            )
        return ret

    def iterate(self):
        wayround_org.toxcorebind.tox_h.tox_iterate(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer
            )
        return

    def self_get_address(self):

        cdef uint8_t * address = NULL

        address = <uint8_t * >libc.stdlib.malloc(
            sizeof(uint8_t) * wayround_org.toxcorebind.tox_h.TOX_ADDRESS_SIZE
            )

        wayround_org.toxcorebind.tox_h.tox_self_get_address(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            address
            )

        ret = <bytes > address[:wayround_org.toxcorebind.tox_h.TOX_ADDRESS_SIZE]

        libc.stdlib.free(address)

        return ret

    def self_set_nospam(self, nospam):
        wayround_org.toxcorebind.tox_h.tox_self_set_nospam(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            nospam
            )
        return

    def self_get_nospam(self):
        ret = wayround_org.toxcorebind.tox_h.tox_self_get_nospam(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer
            )
        return ret

    def self_get_nospam_bytes(self):
        i = self.self_get_nospam()
        ret = i.to_bytes(4, sys.byteorder)
        return ret

    def self_get_public_key(self):

        cdef uint8_t * key = NULL

        key = <uint8_t * >libc.stdlib.malloc(
            sizeof(uint8_t) * wayround_org.toxcorebind.tox_h.TOX_PUBLIC_KEY_SIZE
            )

        wayround_org.toxcorebind.tox_h.tox_self_get_public_key(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            key
            )

        ret = <bytes > key[:wayround_org.toxcorebind.tox_h.TOX_PUBLIC_KEY_SIZE]

        libc.stdlib.free(key)

        return ret

    def self_get_secret_key(self, secret_key):

        cdef uint8_t * key = NULL

        key = <uint8_t * >libc.stdlib.malloc(
            sizeof(uint8_t) * wayround_org.toxcorebind.tox_h.TOX_SECRET_KEY_SIZE
            )

        wayround_org.toxcorebind.tox_h.tox_self_get_secret_key(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            key
            )

        ret = <bytes > key[:wayround_org.toxcorebind.tox_h.TOX_SECRET_KEY_SIZE]

        libc.stdlib.free(key)

        return ret

    def self_set_name(self, name):

        if not isinstance(name, bytes):
            raise TypeError("`name' must be bytes")

        if len(name) > wayround_org.toxcorebind.tox_h.TOX_MAX_NAME_LENGTH:
            raise ValueError("`name' is too long")

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

        data = <uint8_t * >libc.stdlib.malloc(sizeof(uint8_t) * size)

        ret = wayround_org.toxcorebind.tox_h.tox_self_get_name(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            data
            )

        ret = <bytes > data[:size]

        libc.stdlib.free(data)

        return ret

    def self_set_status_message(self, status_message):

        if not isinstance(status_message, bytes):
            raise TypeError("`status_message' must be bytes")

        if (len(status_message) >
                wayround_org.toxcorebind.tox_h.TOX_MAX_STATUS_MESSAGE_LENGTH):
            raise ValueError("`status_message' is too long")

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_SET_INFO error

        ret = wayround_org.toxcorebind.tox_h.tox_self_set_status_message(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            status_message,
            len(status_message),
            & error
            )

        return bool(ret), error

    def self_get_status_message_size(self):
        ret = wayround_org.toxcorebind.tox_h.tox_self_get_status_message_size(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer
            )
        return ret

    def self_get_status_message(self):

        cdef uint8_t * data

        size = self.self_get_status_message_size()

        data = <uint8_t * >libc.stdlib.malloc(sizeof(uint8_t) * size)

        ret = wayround_org.toxcorebind.tox_h.tox_self_get_status_message(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            data
            )

        ret = <bytes > data[:size]

        libc.stdlib.free(data)

        return ret

    def self_set_status(self, status):

        if not isinstance(status, int):
            raise TypeError("integer expected")

        wayround_org.toxcorebind.tox_h.tox_self_set_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            status
            )

        return

    def self_get_status(self):

        ret = wayround_org.toxcorebind.tox_h.tox_self_get_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer
            )

        return ret

    #/************************************************************************
    # *
    # * :: Friend list management
    # *
    # *************************************************************************/

    def friend_add(self, address, message):

        address_check(address)

        friend_request_message_check(message)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_ADD error

        ret = wayround_org.toxcorebind.tox_h.tox_friend_add(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            address,
            message,
            len(message),
            & error
            )

        return ret, error

    def friend_add_norequest(self, public_key):

        public_key_check(public_key)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_ADD error

        ret = wayround_org.toxcorebind.tox_h.tox_friend_add_norequest(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            public_key,
            & error
            )

        return ret, error

    def friend_delete(self, friend_number):

        friend_number_check(friend_number)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_DELETE error

        ret = wayround_org.toxcorebind.tox_h.tox_friend_delete(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            & error
            )

        return ret, error

    #/************************************************************************
    # *
    # * :: Friend list queries
    # *
    # *************************************************************************/

    def friend_by_public_key(self, public_key):

        public_key_check(public_key)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_BY_PUBLIC_KEY error

        ret = wayround_org.toxcorebind.tox_h.tox_friend_by_public_key(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            public_key,
            & error
            )

        return ret, error

    def friend_exists(self, friend_number):

        friend_number_check(friend_number)

        ret = wayround_org.toxcorebind.tox_h.tox_friend_exists(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number
            )

        return bool(ret)

    def self_get_friend_list_size(self):
        ret = wayround_org.toxcorebind.tox_h.tox_self_get_friend_list_size(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer
            )
        return ret

    def self_get_friend_list(self):

        cdef uint32_t * friend_list

        list_size = self.self_get_friend_list_size()

        friend_list = <uint32_t * > libc.stdlib.malloc(
            sizeof(uint32_t) * list_size
            )

        wayround_org.toxcorebind.tox_h.tox_self_get_friend_list(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_list
            )

        ret = []

        for i in range(list_size):
            ret.append(friend_list[i])

        libc.stdlib.free(friend_list)

        return ret

    def friend_get_public_key(self, friend_number):

        friend_number_check(friend_number)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_GET_PUBLIC_KEY error

        cdef uint8_t * _public_key

        _public_key = <uint8_t * >libc.stdlib.malloc(
            wayround_org.toxcorebind.tox_h.TOX_PUBLIC_KEY_SIZE
            )

        ret = wayround_org.toxcorebind.tox_h.tox_friend_get_public_key(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            _public_key,
            & error
            )

        public_key = _public_key[
            :wayround_org.toxcorebind.tox_h.TOX_PUBLIC_KEY_SIZE
            ]

        libc.stdlib.free(_public_key)

        return bool(ret), error, public_key

    def friend_get_last_online(self, friend_number):

        frient_number_check(friend_number)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_GET_LAST_ONLINE error

        ret = wayround_org.toxcorebind.tox_h.tox_friend_get_last_online(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            & error
            )

        return ret, error

    #/************************************************************************
    # *
    # * :: Friend-specific state queries (can also be received through callbacks)
    # *
    # *************************************************************************/

    def friend_get_name_size(self, friend_number):

        friend_number_check(friend_number)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_QUERY error

        ret = wayround_org.toxcorebind.tox_h.tox_friend_get_name_size(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            & error
            )

        return ret, error

    def friend_get_name(self, friend_number):

        friend_number_check(friend_number)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_QUERY error
        cdef uint8_t * _name

        ret = False

        size, error = self.friend_get_name_size(friend_number)

        if error == wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_QUERY_OK:

            _name = libc.stdlib.malloc(sizeof(uint8_t) * size)

            ret = wayround_org.toxcorebind.tox_h.tox_friend_get_name(
                < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
                friend_number,
                _name,
                & error
                )
            if error == wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_QUERY_OK:

            name = _name[:size]

            libc.stdlib.free(_name)

        return bool(ret), error, name

    def callback_friend_name(self, callback):
        o = tuple(self, callback)
        wayround_org.toxcorebind.tox_h.tox_callback_friend_name(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_name_cb,
            < void * >o
            )
        return

    def friend_get_status_message_size(self, friend_number)

        friend_number_check(friend_number)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_QUERY error

        ret = wayround_org.toxcorebind.tox_h.tox_friend_get_status_message_size(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            & error
            )

        return ret, error

    def friend_get_status_message(self, friend_number):

        friend_number_check(friend_number)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_QUERY error
        cdef uint8_t * _status_message

        ret = False

        size, error = self.friend_get_name_size(friend_number)

        if error == wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_QUERY_OK:

            _status_message = libc.stdlib.malloc(sizeof(uint8_t) * size)

            ret = wayround_org.toxcorebind.tox_h.tox_friend_get_status_message(
                < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
                friend_number,
                _status_message,
                & error
                )
            if error == wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_QUERY_OK:

            status_message = _status_message[:size]

            libc.stdlib.free(_status_message)

        return bool(ret), error, status_message

    def callback_friend_status_message(self, callback):
        o = tuple(self, callback)
        wayround_org.toxcorebind.tox_h.tox_callback_friend_status_message(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_status_message_cb,
            < void * >o
            )
        return

    def friend_get_status(self, friend_number):

        friend_number_check(friend_number)

        cdef TOX_ERR_FRIEND_QUERY error

        ret = tox_friend_get_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            & error
            )

        return ret

    def callback_friend_status(self, callback):
        o = tuple(self, callback)
        wayround_org.toxcorebind.tox_h.tox_callback_friend_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_callback_friend_status,
            < void * >o
            )
        return

    def friend_get_connection_status(self, friend_number):

        friend_number_check(friend_number)

        cdef TOX_ERR_FRIEND_QUERY error

        ret = tox_friend_get_connection_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            & error
            )

        return ret, error

    def callback_friend_status(self, callback):
        o = tuple(self, callback)
        wayround_org.toxcorebind.tox_h.tox_callback_friend_connection_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_connection_status_cb,
            < void * >o
            )
        return

    def friend_get_typing(self, friend_number):

        friend_number_check(friend_number)

        cdef TOX_ERR_FRIEND_QUERY error

        ret = tox_friend_get_typing(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            & error
            )

        return bool(ret), error

    def callback_friend_typing(self, callback):
        o = tuple(self, callback)
        wayround_org.toxcorebind.tox_h.tox_callback_friend_typing(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_typing_cb,
            < void * >o
            )
        return

    # /*************************************************************************
    #  *
    #  *:: Sending private messages
    #  *
    #  ************************************************************************/

    def self_set_typing(self, friend_number, typing):

        friend_number_check(friend_number)

        if not isinstance(typing, bool):
            raise TypeError("`typing' must be bool")

        cdef TOX_ERR_SET_TYPING error

        ret = tox_self_set_typing(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            typing,
            & error
            )

        return bool(ret), error

    def friend_send_message(self, friend_number, message, message_type):

        friend_number_check(friend_number)
        friend_message_check(message)
        message_type_check(message_type)

        cdef TOX_ERR_FRIEND_SEND_MESSAGE error

        ret = tox_friend_send_message(
            Tox * tox,
            friend_number,
            message_type,
            message,
            len(message),
            & error
            )

        return ret, error

    def callback_friend_read_receipt(self, callback):

        o = tuple(self, callback)
        wayround_org.toxcorebind.tox_h.tox_callback_friend_read_receipt(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_read_receipt_cb,
            < void * >o
            )

        return

    # /*************************************************************************
    #  *
    #  *::Receiving private messages and friend requests
    #  *
    #  ************************************************************************/

        void tox_callback_friend_request(
            Tox * tox,
            tox_friend_request_cb * callback,
            void * user_data
            )

        void tox_callback_friend_message(
            Tox * tox,
            tox_friend_message_cb * callback,
            void * user_data
            )

    # /*************************************************************************
    #  *
    #  *:: File transmission: common between sending and receiving
    #  *
    #  ************************************************************************/

        bool tox_hash(
            uint8_t * hash,
            uint8_t * data,
            size_t length
            )

        ctypedef enum TOX_FILE_KIND:
            TOX_FILE_KIND_DATA
            TOX_FILE_KIND_AVATAR

        ctypedef enum TOX_FILE_CONTROL:
            TOX_FILE_CONTROL_RESUME
            TOX_FILE_CONTROL_PAUSE
            TOX_FILE_CONTROL_CANCEL

        ctypedef enum TOX_ERR_FILE_CONTROL:
            TOX_ERR_FILE_CONTROL_OK
            TOX_ERR_FILE_CONTROL_FRIEND_NOT_FOUND
            TOX_ERR_FILE_CONTROL_FRIEND_NOT_CONNECTED
            TOX_ERR_FILE_CONTROL_NOT_FOUND
            TOX_ERR_FILE_CONTROL_NOT_PAUSED
            TOX_ERR_FILE_CONTROL_DENIED
            TOX_ERR_FILE_CONTROL_ALREADY_PAUSED
            TOX_ERR_FILE_CONTROL_SENDQ

        bool tox_file_control(
            Tox * tox,
            uint32_t friend_number,
            uint32_t file_number,
            TOX_FILE_CONTROL control,
            TOX_ERR_FILE_CONTROL * error
            )

        ctypedef void tox_file_recv_control_cb(
            Tox * tox,
            uint32_t friend_number,
            uint32_t file_number,
            TOX_FILE_CONTROL control,
            void * user_data
            )

        void tox_callback_file_recv_control(
            Tox * tox,
            tox_file_recv_control_cb * callback,
            void * user_data
            )

        ctypedef enum TOX_ERR_FILE_SEEK:
            TOX_ERR_FILE_SEEK_OK
            TOX_ERR_FILE_SEEK_FRIEND_NOT_FOUND
            TOX_ERR_FILE_SEEK_FRIEND_NOT_CONNECTED
            TOX_ERR_FILE_SEEK_NOT_FOUND
            TOX_ERR_FILE_SEEK_DENIED
            TOX_ERR_FILE_SEEK_INVALID_POSITION
            TOX_ERR_FILE_SEEK_SENDQ

        bool tox_file_seek(
            Tox * tox,
            uint32_t friend_number,
            uint32_t file_number,
            uint64_t position,
            TOX_ERR_FILE_SEEK * error
            )

        ctypedef enum TOX_ERR_FILE_GET:
            TOX_ERR_FILE_GET_OK
            TOX_ERR_FILE_GET_NULL
            TOX_ERR_FILE_GET_FRIEND_NOT_FOUND
            TOX_ERR_FILE_GET_NOT_FOUND

        bool tox_file_get_file_id(
            Tox * tox,
            uint32_t friend_number,
            uint32_t file_number,
            uint8_t * file_id,
            TOX_ERR_FILE_GET * error
            )

    # /*************************************************************************
    #  *
    #  *:: File transmission: sending
    #  *
    #  ************************************************************************/

        ctypedef enum TOX_ERR_FILE_SEND:
            TOX_ERR_FILE_SEND_OK
            TOX_ERR_FILE_SEND_NULL
            TOX_ERR_FILE_SEND_FRIEND_NOT_FOUND
            TOX_ERR_FILE_SEND_FRIEND_NOT_CONNECTED
            TOX_ERR_FILE_SEND_NAME_TOO_LONG
            TOX_ERR_FILE_SEND_TOO_MANY

        uint32_t tox_file_send(
            Tox * tox,
            uint32_t friend_number,
            uint32_t kind,
            uint64_t file_size,
            uint8_t * file_id,
            const uint8_t * filename,
            size_t filename_length,
            TOX_ERR_FILE_SEND * error
            )

        ctypedef enum TOX_ERR_FILE_SEND_CHUNK:
            TOX_ERR_FILE_SEND_CHUNK_OK
            TOX_ERR_FILE_SEND_CHUNK_NULL
            TOX_ERR_FILE_SEND_CHUNK_FRIEND_NOT_FOUND
            TOX_ERR_FILE_SEND_CHUNK_FRIEND_NOT_CONNECTED
            TOX_ERR_FILE_SEND_CHUNK_NOT_FOUND
            TOX_ERR_FILE_SEND_CHUNK_NOT_TRANSFERRING
            TOX_ERR_FILE_SEND_CHUNK_INVALID_LENGTH
            TOX_ERR_FILE_SEND_CHUNK_SENDQ
            TOX_ERR_FILE_SEND_CHUNK_WRONG_POSITION

        bool tox_file_send_chunk(
            Tox * tox,
            uint32_t friend_number,
            uint32_t file_number,
            uint64_t position,
            uint8_t * data,
            size_t length,
            TOX_ERR_FILE_SEND_CHUNK * error
            )

        ctypedef void tox_file_chunk_request_cb(
            Tox * tox,
            uint32_t friend_number,
            uint32_t file_number,
            uint64_t position,
            size_t length,
            void * user_data
            )

        void tox_callback_file_chunk_request(
            Tox * tox,
            tox_file_chunk_request_cb * callback,
            void * user_data
            )


    # /*************************************************************************
    #  *
    #  *:: File transmission: receiving
    #  *
    #  ************************************************************************/

        ctypedef void tox_file_recv_cb(
            Tox * tox,
            uint32_t friend_number,
            uint32_t file_number,
            uint32_t kind,
            uint64_t file_size,
            const uint8_t * filename,
            size_t filename_length,
            void * user_data
            )

        void tox_callback_file_recv(
            Tox * tox,
            tox_file_recv_cb * callback,
            void * user_data
            )

        void tox_callback_file_recv_chunk(
            Tox * tox,
            tox_file_recv_chunk_cb * callback,
            void * user_data
            )


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
        ret = Tox(< uintptr_t > res)
        ret._ok = True
    else:
        ret = None
    return ret, error


# ************** checkers **************


def address_check(address):
    if not isinstance(address, bytes):
        raise TypeError("`address' must be bytes")

    if len(address) != wayround_org.toxcorebind.tox_h.TOX_ADDRESS_SIZE:
        raise ValueError("`address' invalid format")
    return


def friend_number_check(friend_number):
    if not isinstance(friend_number, int):
        raise TypeError("`friend_number' must be int")
    return


def public_key_check(public_key):
    if not isinstance(public_key, bytes):
        raise TypeError("`public_key' must be bytes")

    if len(public_key) != wayround_org.toxcorebind.tox_h.TOX_PUBLIC_KEY_SIZE:
        raise ValueError("`public_key' invalid format")
    return


def friend_request_message_check(request_message):
    if not isinstance(message, bytes):
        raise TypeError("`request_message' must be bytes")

    l = len(message)

    if l < 1 or l > wayround_org.toxcorebind.tox_h.TOX_MAX_FRIEND_REQUEST_LENGTH:
        raise ValueError("`request_message' invalid format")
    return


def friend_message_check(message):
    if not isinstance(message, bytes):
        raise TypeError("`message' must be bytes")

    l = len(message)

    if l < 1 or l > wayround_org.toxcorebind.tox_h.TOX_MAX_MESSAGE_LENGTH:
        raise ValueError("`message' invalid format")
    return

# ************** callbacks **************


cdef _tox_friend_name_cb(
        Tox * tox,
        uint32_t friend_number,
        uint8_t * name,
        size_t length,
        void * user_data
        ):

    obj = < object > user_data
    ret = obj[1](obj[0], friend_number, name[:length])
    return ret


cdef _tox_self_connection_status_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        wayround_org.toxcorebind.tox_h.TOX_CONNECTION connection_status,
        void * user_data
        ):
    obj = < object > user_data
    ret = obj[1](obj[0], connection_status)
    return ret

    ctypedef void tox_friend_status_message_cb(
        Tox * tox,
        uint32_t friend_number,
        uint8_t * message,
        size_t length,
        void * user_data
        )

    ctypedef void tox_friend_status_cb(
        Tox * tox,
        uint32_t friend_number,
        TOX_USER_STATUS status,
        void * user_data
        )

    ctypedef void tox_friend_connection_status_cb(
        Tox * tox,
        uint32_t friend_number,
        TOX_CONNECTION connection_status,
        void * user_data
        )

    ctypedef void tox_friend_typing_cb(
        Tox * tox,
        uint32_t friend_number,
        bool is_typing,
        void * user_data
        )

    ctypedef void tox_friend_read_receipt_cb(
        Tox * tox,
        uint32_t friend_number,
        uint32_t message_id,
        void * user_data
        )

    ctypedef void tox_friend_request_cb(
        Tox * tox,
        uint8_t * public_key,
        uint8_t * message,
        size_t length,
        void * user_data
        )

    ctypedef void tox_friend_message_cb(
        Tox * tox,
        uint32_t friend_number,
        TOX_MESSAGE_TYPE type,
        uint8_t * message,
        size_t length,
        void * user_data
        )

    ctypedef void tox_file_recv_chunk_cb(
        Tox * tox,
        uint32_t friend_number,
        uint32_t file_number,
        uint64_t position,
        const uint8_t * data,
        size_t length,
        void * user_data
        )        