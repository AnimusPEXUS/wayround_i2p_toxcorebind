
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

    @classmethod
    def tox_options_new(cls):
        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_OPTIONS_NEW error
        cdef wayround_org.toxcorebind.tox_h.Tox_Options * res
        res = wayround_org.toxcorebind.tox_h.tox_options_new(& error)
        if error == 0:
            ret = cls(< uintptr_t > res)
            ret.reset_defaults()
            ret._ok = True
        else:
            ret = None
        return ret, error

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


class Tox:

    @classmethod
    def tox_new(cls, options=None):

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
            ret = cls(< uintptr_t > res)
            ret._ok = True
        else:
            ret = None
        return ret, error

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

    # /*************************************************************************
    #  *
    #  * :: Connection lifecycle and event loop
    #  *
    #  ************************************************************************/

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
        self._tox_self_connection_status_cb_data = self, callback
        wayround_org.toxcorebind.tox_h.tox_callback_self_connection_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_self_connection_status_cb,
            < void * >self._tox_self_connection_status_cb_data
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

    # /*************************************************************************
    #  *
    #  * :: Internal client information (Tox address/id)
    #  *
    #  ************************************************************************/

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

    # /*************************************************************************
    #  *
    #  * :: User-visible client information (nickname/status)
    #  *
    #  ************************************************************************/

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

        friend_number_check(friend_number)

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

            _name = <uint8_t * >libc.stdlib.malloc(sizeof(uint8_t) * size)

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
        self._tox_friend_name_cb_data = self, callback
        wayround_org.toxcorebind.tox_h.tox_callback_friend_name(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_name_cb,
            < void * >self._tox_friend_name_cb_data
            )
        return

    def friend_get_status_message_size(self, friend_number):

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

            _status_message = <uint8_t * >libc.stdlib.malloc(sizeof(uint8_t) * size)

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
        self._tox_friend_status_message_cb_data = self, callback
        wayround_org.toxcorebind.tox_h.tox_callback_friend_status_message(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_status_message_cb,
            < void * >self._tox_friend_status_message_cb_data
            )
        return

    def friend_get_status(self, friend_number):

        friend_number_check(friend_number)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_QUERY error

        ret = wayround_org.toxcorebind.tox_h.tox_friend_get_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            & error
            )

        return ret

    def callback_friend_status(self, callback):
        self._tox_friend_status_cb_data = self, callback
        wayround_org.toxcorebind.tox_h.tox_callback_friend_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_status_cb,
            < void * >self._tox_friend_status_cb_data
            )
        return

    def friend_get_connection_status(self, friend_number):

        friend_number_check(friend_number)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_QUERY error

        ret = wayround_org.toxcorebind.tox_h.tox_friend_get_connection_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            & error
            )

        return ret, error

    def callback_friend_status(self, callback):
        self._tox_friend_connection_status_cb_data = self, callback
        wayround_org.toxcorebind.tox_h.tox_callback_friend_connection_status(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_connection_status_cb,
            < void * >self._tox_friend_connection_status_cb_data
            )
        return

    def friend_get_typing(self, friend_number):

        friend_number_check(friend_number)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_QUERY error

        ret = wayround_org.toxcorebind.tox_h.tox_friend_get_typing(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            & error
            )

        return bool(ret), error

    def callback_friend_typing(self, callback):
        self._tox_friend_typing_cb_data = self, callback
        wayround_org.toxcorebind.tox_h.tox_callback_friend_typing(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_typing_cb,
            < void * >self._tox_friend_typing_cb_data
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

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_SET_TYPING error

        ret = wayround_org.toxcorebind.tox_h.tox_self_set_typing(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            typing,
            & error
            )

        return bool(ret), error

    def friend_send_message(self, friend_number, message_type, message):

        friend_number_check(friend_number)
        friend_message_check(message)
        message_type_check(message_type)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FRIEND_SEND_MESSAGE error

        ret = wayround_org.toxcorebind.tox_h.tox_friend_send_message(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            message_type,
            message,
            len(message),
            & error
            )

        return ret, error

    def callback_friend_read_receipt(self, callback):

        self._tox_friend_read_receipt_cb_data = self, callback
        wayround_org.toxcorebind.tox_h.tox_callback_friend_read_receipt(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_read_receipt_cb,
            < void * >self._tox_friend_read_receipt_cb_data
            )

        return

    # /*************************************************************************
    #  *
    #  *::Receiving private messages and friend requests
    #  *
    #  ************************************************************************/

    def callback_friend_request(self, callback):

        self._tox_friend_request_cb_data = self, callback

        wayround_org.toxcorebind.tox_h.tox_callback_friend_request(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_request_cb,
            < void * >self._tox_friend_request_cb_data
            )

        return

    def callback_friend_message(self, callback):

        self._tox_friend_message_cb_data = self, callback
        wayround_org.toxcorebind.tox_h.tox_callback_friend_message(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_friend_message_cb,
            < void * >self._tox_friend_message_cb_data
            )

        return

    # /*************************************************************************
    #  *
    #  *:: File transmission: common between sending and receiving
    #  *
    #  ************************************************************************/

    def hash(self, data_in):
        return tox_hash(data_in)

    def file_control(self, friend_number, file_number, control):

        friend_number_check(friend_number)

        file_number_check(file_number)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FILE_CONTROL error

        if not isinstance(control, int):
            raise TypeError("`control' must be int")

        ret = wayround_org.toxcorebind.tox_h.tox_file_control(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            file_number,
            control,
            & error
            )

        return bool(ret), error

    def callback_file_recv_control(self, callback):

        self._tox_file_recv_control_cb_data = self, callback
        wayround_org.toxcorebind.tox_h.tox_callback_file_recv_control(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_file_recv_control_cb,
            < void * >self._tox_file_recv_control_cb_data
            )

        return

    def file_seek(self, friend_number, file_number, position):

        friend_number_check(friend_number)

        file_number_check(file_number)

        if not isinstance(position, int):
            raise TypeError("`position' must be int")

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FILE_SEEK error

        ret = wayround_org.toxcorebind.tox_h.tox_file_seek(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            file_number,
            position,
            & error
            )

        return bool(ret), error

    def file_get_file_id(self, friend_number, file_number):

        friend_number_check(friend_number)

        file_number_check(file_number)

        cdef uint8_t * _file_id
        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FILE_GET error

        _file_id = <uint8_t * >libc.stdlib.malloc(
            sizeof(uint8_t) * wayround_org.toxcorebind.tox_h.TOX_FILE_ID_LENGTH
            )

        ret = wayround_org.toxcorebind.tox_h.tox_file_get_file_id(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            file_number,
            _file_id,
            & error
            )

        if bool(ret):
            file_id = _file_id[
                :wayround_org.toxcorebind.tox_h.TOX_FILE_ID_LENGTH
                ]

        libc.stdlib.free(_file_id)

        return bool(ret), error, file_id

    # /*************************************************************************
    #  *
    #  *:: File transmission: sending
    #  *
    #  ************************************************************************/

    def file_send(self, friend_number, kind, file_size, file_id, filename):

        # TODO: add all parameters checks

        friend_number_check(friend_number)

        if file_id is not None and not isinstance(file_id, bytes):
            raise TypeError("`file_id' must be bytes")

        if file_id is not None and len(file_id) != TOX_FILE_ID_LENGTH:
            raise TypeError("`file_id' invalid format")

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FILE_SEND error

        cdef uint8_t * _file_id = NULL

        if file_id is not None:
            _file_id = file_id

        ret = wayround_org.toxcorebind.tox_h.tox_file_send(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            kind,
            file_size,
            _file_id,
            filename,
            len(filename),
            & error
            )

        return ret, error

    def file_send_chunk(self, friend_number, file_number, position, data):

        friend_number_check(friend_number)

        file_number_check(file_number)

        file_position_check(position)

        file_data_check(data)

        cdef wayround_org.toxcorebind.tox_h.TOX_ERR_FILE_SEND_CHUNK error

        ret = wayround_org.toxcorebind.tox_h.tox_file_send_chunk(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            friend_number,
            file_number,
            position,
            data,
            len(data),
            & error
            )

        return bool(ret), error

    def callback_file_chunk_request(self, callback):

        self._tox_file_chunk_request_cb_data = self, callback
        wayround_org.toxcorebind.tox_h.tox_callback_file_chunk_request(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_file_chunk_request_cb,
            < void * >self._tox_file_chunk_request_cb_data
            )

        return

    # /*************************************************************************
    #  *
    #  *:: File transmission: receiving
    #  *
    #  ************************************************************************/

    def callback_file_recv(self, callback):

        self._tox_file_recv_cb_data = self, callback
        wayround_org.toxcorebind.tox_h.tox_callback_file_recv(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_file_recv_cb,
            < void * >self._tox_file_recv_cb_data
            )

        return

    def callback_file_recv_chunk(self, callback):

        self._tox_file_recv_chunk_cb_data = self, callback
        wayround_org.toxcorebind.tox_h.tox_callback_file_recv_chunk(
            < wayround_org.toxcorebind.tox_h.Tox * > < uintptr_t > self._pointer,
            _tox_file_recv_chunk_cb,
            < void * >self._tox_file_recv_chunk_cb_data
            )

        return


def tox_hash(self, data_in):

    if not isinstance(data_in, bytes):
        raise TypeError("`data_in' must be bytes")

    cdef uint8_t * _data

    hash_out = None

    _data = <uint8_t * >libc.stdlib.malloc(
        sizeof(uint8_t) * wayround_org.toxcorebind.TOX_HASH_LENGTH
        )

    ret = wayround_org.toxcorebind.tox_h.tox_hash(
        _data,
        data_in,
        len(data_in)
        )

    if bool(ret):

        hash_out = _data[:wayround_org.toxcorebind.TOX_HASH_LENGTH]

    libc.stdlib.free(_data)

    return bool(ret), hash_out


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


def file_number_check(file_number):
    if not isinstance(file_number, int):
        raise TypeError("`file_number' must be int")
    return


def public_key_check(public_key):
    if not isinstance(public_key, bytes):
        raise TypeError("`public_key' must be bytes")

    if len(public_key) != wayround_org.toxcorebind.tox_h.TOX_PUBLIC_KEY_SIZE:
        raise ValueError("`public_key' invalid format")
    return


def friend_request_message_check(request_message):
    if not isinstance(request_message, bytes):
        raise TypeError("`request_message' must be bytes")

    l = len(request_message)

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


def file_position_check(position):
    if not isinstance(position, int):
        raise TypeError("`position' must be int")
    return


def file_data_check(file_data):
    if not isinstance(file_data, bytes):
        raise TypeError("`file_data' must be bytes")
    return


def message_type_check(message_type):
    if not isinstance(message_type, int):
        raise TypeError("`message_type' must be int")
    return

# ************** callbacks **************


cdef void _tox_friend_name_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        uint32_t friend_number,
        const uint8_t * name,
        size_t length,
        void * user_data
        ):

    obj = < object > user_data
    obj[1](obj[0], friend_number, name[:length])

    return


cdef void _tox_self_connection_status_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        wayround_org.toxcorebind.tox_h.TOX_CONNECTION connection_status,
        void * user_data
        ):

    obj = < object > user_data
    obj[1](obj[0], connection_status)

    return

cdef void _tox_friend_status_message_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        uint32_t friend_number,
        const uint8_t * message,
        size_t length,
        void * user_data
        ):

    obj = < object > user_data
    obj[1](obj[0], friend_number, message[:length])

    return

cdef void _tox_friend_status_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        uint32_t friend_number,
        wayround_org.toxcorebind.tox_h.TOX_USER_STATUS status,
        void * user_data
        ):

    obj = < object > user_data
    obj[1](obj[0], friend_number, status)

    return

cdef void _tox_friend_connection_status_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        uint32_t friend_number,
        wayround_org.toxcorebind.tox_h.TOX_CONNECTION connection_status,
        void * user_data
        ):

    obj = < object > user_data
    obj[1](obj[0], friend_number, connection_status)

    return

cdef void _tox_friend_typing_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        uint32_t friend_number,
        wayround_org.toxcorebind.tox_h.bool is_typing,
        void * user_data
        ):

    obj = < object > user_data
    obj[1](obj[0], friend_number, bool(is_typing))

    return

cdef void _tox_friend_read_receipt_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        uint32_t friend_number,
        uint32_t message_id,
        void * user_data
        ):

    obj = < object > user_data
    obj[1](obj[0], friend_number, message_id)

    return

cdef void _tox_friend_request_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        const uint8_t * public_key,
        const uint8_t * message,
        size_t length,
        void * user_data
        ):

    obj = < object > user_data

    obj[1](
        obj[0],
        public_key[:wayround_org.toxcorebind.tox_h.TOX_PUBLIC_KEY_SIZE],
        message[:length]
        )

    return

cdef void _tox_friend_message_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        uint32_t friend_number,
        wayround_org.toxcorebind.tox_h.TOX_MESSAGE_TYPE type_,
        const uint8_t * message,
        size_t length,
        void * user_data
        ):

    obj = < object > user_data
    obj[1](obj[0], friend_number, type_, message[:length])

    return

cdef void _tox_file_recv_chunk_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        uint32_t friend_number,
        uint32_t file_number,
        uint64_t position,
        const uint8_t * data,
        size_t length,
        void * user_data
        ):

    obj = < object > user_data
    obj[1](obj[0], friend_number, file_number, position, data[:length])

    return

cdef void _tox_file_recv_control_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        uint32_t friend_number,
        uint32_t file_number,
        wayround_org.toxcorebind.tox_h.TOX_FILE_CONTROL control,
        void * user_data
        ):

    obj = < object > user_data
    obj[1](obj[0], friend_number, file_number, control)

    return

cdef void _tox_file_chunk_request_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        uint32_t friend_number,
        uint32_t file_number,
        uint64_t position,
        size_t length,
        void * user_data
        ):

    obj = < object > user_data
    obj[1](obj[0], friend_number, file_number, position, length)

    return

cdef void _tox_file_recv_cb(
        wayround_org.toxcorebind.tox_h.Tox * tox,
        uint32_t friend_number,
        uint32_t file_number,
        uint32_t kind,
        uint64_t file_size,
        const uint8_t * filename,
        size_t filename_length,
        void * user_data
        ):

    obj = < object > user_data
    obj[1](
        obj[0],
        friend_number,
        file_number,
        kind,
        file_size,
        filename[:filename_length]
        )

    return
