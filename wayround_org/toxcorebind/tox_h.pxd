
from libc.stdint cimport *

from libcpp cimport bool


cdef extern from "tox/tox.h":

    ctypedef enum:
        TOX_VERSION_MAJOR
        TOX_VERSION_MINOR
        TOX_VERSION_PATCH

        TOX_PUBLIC_KEY_SIZE
        TOX_SECRET_KEY_SIZE
        TOX_ADDRESS_SIZE
        TOX_MAX_NAME_LENGTH
        TOX_MAX_STATUS_MESSAGE_LENGTH
        TOX_MAX_FRIEND_REQUEST_LENGTH
        TOX_MAX_MESSAGE_LENGTH
        TOX_MAX_CUSTOM_PACKET_SIZE
        TOX_HASH_LENGTH
        TOX_FILE_ID_LENGTH
        TOX_MAX_FILENAME_LENGTH

    ctypedef struct Tox

    uint32_t tox_version_major()

    uint32_t tox_version_minor()

    uint32_t tox_version_patch()

    bool tox_version_is_compatible(
        uint32_t major,
        uint32_t minor,
        uint32_t patch
        )

    ctypedef enum TOX_USER_STATUS:
        TOX_USER_STATUS_NONE
        TOX_USER_STATUS_AWAY
        TOX_USER_STATUS_BUSY

    ctypedef enum TOX_MESSAGE_TYPE:
        TOX_MESSAGE_TYPE_NORMAL
        TOX_MESSAGE_TYPE_ACTION

    ctypedef enum TOX_PROXY_TYPE:
        TOX_PROXY_TYPE_NONE
        TOX_PROXY_TYPE_HTTP
        TOX_PROXY_TYPE_SOCKS5

    ctypedef enum TOX_SAVEDATA_TYPE:
        TOX_SAVEDATA_TYPE_NONE
        TOX_SAVEDATA_TYPE_TOX_SAVE
        TOX_SAVEDATA_TYPE_SECRET_KEY

    struct Tox_Options:
        bool ipv6_enabled
        bool udp_enabled
        TOX_PROXY_TYPE proxy_type
        char * proxy_host
        uint16_t proxy_port
        uint16_t start_port
        uint16_t end_port
        uint16_t tcp_port
        TOX_SAVEDATA_TYPE savedata_type
        const uint8_t * savedata_data
        size_t savedata_length

    void tox_options_default(Tox_Options * options)

    ctypedef enum TOX_ERR_OPTIONS_NEW:
        TOX_ERR_OPTIONS_NEW_OK
        TOX_ERR_OPTIONS_NEW_MALLOC

    Tox_Options * tox_options_new(TOX_ERR_OPTIONS_NEW * error)

    void tox_options_free(Tox_Options * options)

    ctypedef enum TOX_ERR_NEW:
        TOX_ERR_NEW_OK
        TOX_ERR_NEW_NULL
        TOX_ERR_NEW_MALLOC
        TOX_ERR_NEW_PORT_ALLOC
        TOX_ERR_NEW_PROXY_BAD_TYPE
        TOX_ERR_NEW_PROXY_BAD_HOST
        TOX_ERR_NEW_PROXY_BAD_PORT
        TOX_ERR_NEW_PROXY_NOT_FOUND
        TOX_ERR_NEW_LOAD_ENCRYPTED
        TOX_ERR_NEW_LOAD_BAD_FORMAT

    Tox * tox_new(Tox_Options * options, TOX_ERR_NEW * error)

    void tox_kill(Tox * tox)

    size_t tox_get_savedata_size(Tox * tox)

    void tox_get_savedata(Tox * tox, uint8_t * savedata)

    ctypedef enum TOX_ERR_BOOTSTRAP:
        TOX_ERR_BOOTSTRAP_OK
        TOX_ERR_BOOTSTRAP_NULL
        TOX_ERR_BOOTSTRAP_BAD_HOST
        TOX_ERR_BOOTSTRAP_BAD_PORT

    bool tox_bootstrap(
        Tox * tox,
        const char * address,
        uint16_t port,
        uint8_t * public_key,
        TOX_ERR_BOOTSTRAP * error
        )

    bool tox_add_tcp_relay(
        Tox * tox,
        char * address,
        uint16_t port,
        uint8_t * public_key,
        TOX_ERR_BOOTSTRAP * error
        )

    ctypedef enum TOX_CONNECTION:
        TOX_CONNECTION_NONE
        TOX_CONNECTION_TCP
        TOX_CONNECTION_UDP

    TOX_CONNECTION tox_self_get_connection_status(Tox * tox)

    ctypedef void tox_self_connection_status_cb(
        Tox * tox,
        TOX_CONNECTION connection_status,
        void * user_data
        )

    void tox_callback_self_connection_status(
        Tox * tox,
        tox_self_connection_status_cb * callback,
        void * user_data
        )

    uint32_t tox_iteration_interval(Tox * tox)

    void tox_iterate(Tox * tox)

    void tox_self_get_address(Tox * tox, uint8_t * address)

    void tox_self_set_nospam(Tox * tox, uint32_t nospam)

    uint32_t tox_self_get_nospam(Tox * tox)

    void tox_self_get_public_key(Tox * tox, uint8_t * public_key)

    void tox_self_get_secret_key(Tox * tox, uint8_t * secret_key)

    ctypedef enum TOX_ERR_SET_INFO:
        TOX_ERR_SET_INFO_OK
        TOX_ERR_SET_INFO_NULL
        TOX_ERR_SET_INFO_TOO_LONG

    bool tox_self_set_name(
        Tox * tox,
        uint8_t * name,
        size_t length,
        TOX_ERR_SET_INFO * error
        )

    size_t tox_self_get_name_size(const Tox * tox)

    void tox_self_get_name(
        Tox * tox,
        uint8_t * name
        )

    bool tox_self_set_status_message(
        Tox * tox,
        uint8_t * status_message,
        size_t length,
        TOX_ERR_SET_INFO * error
        )

    size_t tox_self_get_status_message_size(Tox * tox)

    void tox_self_get_status_message(
        Tox * tox,
        uint8_t * status_message
        )

    void tox_self_set_status(Tox * tox, TOX_USER_STATUS status)

    TOX_USER_STATUS tox_self_get_status(Tox * tox)

    ctypedef enum TOX_ERR_FRIEND_ADD:
        TOX_ERR_FRIEND_ADD_OK
        TOX_ERR_FRIEND_ADD_NULL
        TOX_ERR_FRIEND_ADD_TOO_LONG
        TOX_ERR_FRIEND_ADD_NO_MESSAGE
        TOX_ERR_FRIEND_ADD_OWN_KEY
        TOX_ERR_FRIEND_ADD_ALREADY_SENT
        TOX_ERR_FRIEND_ADD_BAD_CHECKSUM
        TOX_ERR_FRIEND_ADD_SET_NEW_NOSPAM
        TOX_ERR_FRIEND_ADD_MALLOC

    uint32_t tox_friend_add(
        Tox * tox,
        uint8_t * address,
        uint8_t * message,
        size_t length,
        TOX_ERR_FRIEND_ADD * error
        )

    uint32_t tox_friend_add_norequest(
        Tox * tox,
        uint8_t * public_key,
        TOX_ERR_FRIEND_ADD * error
        )

    ctypedef enum TOX_ERR_FRIEND_DELETE:
        TOX_ERR_FRIEND_DELETE_OK
        TOX_ERR_FRIEND_DELETE_FRIEND_NOT_FOUND

    bool tox_friend_delete(
        Tox * tox,
        uint32_t friend_number,
        TOX_ERR_FRIEND_DELETE * error
        )

    ctypedef enum TOX_ERR_FRIEND_BY_PUBLIC_KEY:
        TOX_ERR_FRIEND_BY_PUBLIC_KEY_OK
        TOX_ERR_FRIEND_BY_PUBLIC_KEY_NULL
        TOX_ERR_FRIEND_BY_PUBLIC_KEY_NOT_FOUND

    uint32_t tox_friend_by_public_key(
        Tox * tox,
        uint8_t * public_key,
        TOX_ERR_FRIEND_BY_PUBLIC_KEY * error
        )

    bool tox_friend_exists(
        Tox * tox,
        uint32_t friend_number
        )

    size_t tox_self_get_friend_list_size(const Tox * tox)

    void tox_self_get_friend_list(const Tox * tox, uint32_t * friend_list)

    ctypedef enum TOX_ERR_FRIEND_GET_PUBLIC_KEY:
        TOX_ERR_FRIEND_GET_PUBLIC_KEY_OK
        TOX_ERR_FRIEND_GET_PUBLIC_KEY_FRIEND_NOT_FOUND

    bool tox_friend_get_public_key(
        Tox * tox,
        uint32_t friend_number,
        uint8_t * public_key,
        TOX_ERR_FRIEND_GET_PUBLIC_KEY * error
        )

    ctypedef enum TOX_ERR_FRIEND_GET_LAST_ONLINE:
        TOX_ERR_FRIEND_GET_LAST_ONLINE_OK
        TOX_ERR_FRIEND_GET_LAST_ONLINE_FRIEND_NOT_FOUND

    uint64_t tox_friend_get_last_online(
        Tox * tox,
        uint32_t friend_number,
        TOX_ERR_FRIEND_GET_LAST_ONLINE * error
        )

    ctypedef enum TOX_ERR_FRIEND_QUERY:
        TOX_ERR_FRIEND_QUERY_OK
        TOX_ERR_FRIEND_QUERY_NULL
        TOX_ERR_FRIEND_QUERY_FRIEND_NOT_FOUND

    size_t tox_friend_get_name_size(
        Tox * tox,
        uint32_t friend_number,
        TOX_ERR_FRIEND_QUERY * error
        )

    bool tox_friend_get_name(
        Tox * tox,
        uint32_t friend_number,
        uint8_t * name,
        TOX_ERR_FRIEND_QUERY * error
        )

    ctypedef void tox_friend_name_cb(
        Tox * tox,
        uint32_t friend_number,
        uint8_t * name,
        size_t length,
        void * user_data
        )

    void tox_callback_friend_name(
        Tox * tox,
        tox_friend_name_cb * callback,
        void * user_data
        )

    size_t tox_friend_get_status_message_size(
        Tox * tox,
        uint32_t friend_number,
        TOX_ERR_FRIEND_QUERY * error
        )

    bool tox_friend_get_status_message(
        Tox * tox,
        uint32_t friend_number,
        uint8_t * status_message,
        TOX_ERR_FRIEND_QUERY * error
        )

    ctypedef void tox_friend_status_message_cb(
        Tox * tox,
        uint32_t friend_number,
        uint8_t * message,
        size_t length,
        void * user_data
        )

    void tox_callback_friend_status_message(
        Tox * tox,
        tox_friend_status_message_cb * callback,
        void * user_data
        )

    TOX_USER_STATUS tox_friend_get_status(
        Tox * tox,
        uint32_t friend_number,
        TOX_ERR_FRIEND_QUERY * error
        )

    ctypedef void tox_friend_status_cb(
        Tox * tox,
        uint32_t friend_number,
        TOX_USER_STATUS status,
        void * user_data
        )

    void tox_callback_friend_status(
        Tox * tox,
        tox_friend_status_cb * callback,
        void * user_data
        )

    TOX_CONNECTION tox_friend_get_connection_status(
        Tox * tox,
        uint32_t friend_number,
        TOX_ERR_FRIEND_QUERY * error
        )

    ctypedef void tox_friend_connection_status_cb(
        Tox * tox,
        uint32_t friend_number,
        TOX_CONNECTION connection_status,
        void * user_data
        )

    void tox_callback_friend_connection_status(
        Tox * tox,
        tox_friend_connection_status_cb * callback,
        void * user_data
        )

    bool tox_friend_get_typing(
        Tox * tox,
        uint32_t friend_number,
        TOX_ERR_FRIEND_QUERY * error
        )

    ctypedef void tox_friend_typing_cb(
        Tox * tox,
        uint32_t friend_number,
        bool is_typing,
        void * user_data
        )

    void tox_callback_friend_typing(
        Tox * tox,
        tox_friend_typing_cb * callback,
        void * user_data
        )

    ctypedef enum TOX_ERR_SET_TYPING:
        TOX_ERR_SET_TYPING_OK
        TOX_ERR_SET_TYPING_FRIEND_NOT_FOUND

    bool tox_self_set_typing(
        Tox * tox,
        uint32_t friend_number,
        bool typing,
        TOX_ERR_SET_TYPING * error
        )

    ctypedef enum TOX_ERR_FRIEND_SEND_MESSAGE:
        TOX_ERR_FRIEND_SEND_MESSAGE_OK
        TOX_ERR_FRIEND_SEND_MESSAGE_NULL
        TOX_ERR_FRIEND_SEND_MESSAGE_FRIEND_NOT_FOUND
        TOX_ERR_FRIEND_SEND_MESSAGE_FRIEND_NOT_CONNECTED
        TOX_ERR_FRIEND_SEND_MESSAGE_SENDQ
        TOX_ERR_FRIEND_SEND_MESSAGE_TOO_LONG
        TOX_ERR_FRIEND_SEND_MESSAGE_EMPTY

    uint32_t tox_friend_send_message(
        Tox * tox,
        uint32_t friend_number,
        TOX_MESSAGE_TYPE type,
        uint8_t * message,
        size_t length,
        TOX_ERR_FRIEND_SEND_MESSAGE * error
        )

    ctypedef void tox_friend_read_receipt_cb(
        Tox * tox,
        uint32_t friend_number,
        uint32_t message_id,
        void * user_data
        )

    void tox_callback_friend_read_receipt(
        Tox * tox,
        tox_friend_read_receipt_cb * callback,
        void * user_data
        )

    ctypedef void tox_friend_request_cb(
        Tox * tox,
        uint8_t * public_key,
        uint8_t * message,
        size_t length,
        void * user_data
        )

    void tox_callback_friend_request(
        Tox * tox,
        tox_friend_request_cb * callback,
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

    void tox_callback_friend_message(
        Tox * tox,
        tox_friend_message_cb * callback,
        void * user_data
        )

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

    ctypedef void tox_file_recv_chunk_cb(
        Tox * tox,
        uint32_t friend_number,
        uint32_t file_number,
        uint64_t position,
        const uint8_t * data,
        size_t length,
        void * user_data
        )

    void tox_callback_file_recv_chunk(
        Tox * tox,
        tox_file_recv_chunk_cb * callback,
        void * user_data
        )

    ctypedef enum TOX_ERR_FRIEND_CUSTOM_PACKET:
        TOX_ERR_FRIEND_CUSTOM_PACKET_OK
        TOX_ERR_FRIEND_CUSTOM_PACKET_NULL
        TOX_ERR_FRIEND_CUSTOM_PACKET_FRIEND_NOT_FOUND
        TOX_ERR_FRIEND_CUSTOM_PACKET_FRIEND_NOT_CONNECTED
        TOX_ERR_FRIEND_CUSTOM_PACKET_INVALID
        TOX_ERR_FRIEND_CUSTOM_PACKET_EMPTY
        TOX_ERR_FRIEND_CUSTOM_PACKET_TOO_LONG
        TOX_ERR_FRIEND_CUSTOM_PACKET_SENDQ

    bool tox_friend_send_lossy_packet(
        Tox * tox,
        uint32_t friend_number,
        const uint8_t * data,
        size_t length,
        TOX_ERR_FRIEND_CUSTOM_PACKET * error
        )

    bool tox_friend_send_lossless_packet(
        Tox * tox,
        uint32_t friend_number,
        const uint8_t * data,
        size_t length,
        TOX_ERR_FRIEND_CUSTOM_PACKET * error
        )

    ctypedef void tox_friend_lossy_packet_cb(
        Tox * tox,
        uint32_t friend_number,
        uint8_t * data,
        size_t length,
        void * user_data
        )

    void tox_callback_friend_lossy_packet(
        Tox * tox,
        tox_friend_lossy_packet_cb * callback,
        void * user_data
        )

    ctypedef void tox_friend_lossless_packet_cb(
        Tox * tox,
        uint32_t friend_number,
        const uint8_t * data,
        size_t length,
        void * user_data
        )

    void tox_callback_friend_lossless_packet(
        Tox * tox,
        tox_friend_lossless_packet_cb * callback,
        void * user_data
        )

    void tox_self_get_dht_id(
        Tox * tox,
        uint8_t * dht_id
        )

    ctypedef enum TOX_ERR_GET_PORT:
        TOX_ERR_GET_PORT_OK
        TOX_ERR_GET_PORT_NOT_BOUND

    uint16_t tox_self_get_udp_port(
        Tox * tox,
        TOX_ERR_GET_PORT * error
        )

    uint16_t tox_self_get_tcp_port(
        Tox * tox,
        TOX_ERR_GET_PORT * error
        )
