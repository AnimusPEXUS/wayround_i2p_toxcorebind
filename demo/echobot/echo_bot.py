

# some simple analog of bot given here
# https://wiki.tox.chat/developers/client_examples/echo_bot

import os.path
import time
import threading

import wayround_org.toxcorebind.tox


print("creating tox")

data_file_name = 'file.dat'

options, error = wayround_org.toxcorebind.tox.Tox_Options.new()

if os.path.isfile(data_file_name):
    with open(data_file_name, 'rb') as f:
        dat_data = f.read()

    options.savedata_data = dat_data
    options.savedata_type = wayround_org.toxcorebind.tox.TOX_SAVEDATA_TYPE_TOX_SAVE

tox, error = wayround_org.toxcorebind.tox.Tox.new(options=options)

if error != 0:
    print("error creating Tox instance")
    exit(1)

print()

print(
    "own name is ({}): {}".format(
        tox.self_get_name_size(),
        tox.self_get_name()
        )
    )

print(
    "set name result: {}".format(
        tox.self_set_name(
            b'Echo Bot'
            )
        )
    )

print(
    "own name is ({}): {}".format(
        tox.self_get_name_size(),
        tox.self_get_name()
        )
    )

print()

print(
    "own status message is ({}): {}".format(
        tox.self_get_status_message_size(),
        tox.self_get_status_message()
        )
    )

print(
    "set status_message result: {}".format(
        tox.self_set_status_message(
            b'Echoing your messages'
            )
        )
    )

print(
    "own status message is ({}): {}".format(
        tox.self_get_status_message_size(),
        tox.self_get_status_message()
        )
    )

print()

print("address: {}".format(tox.self_get_address().hex()))
print("nospam (integer): {}".format(tox.self_get_nospam()))

print("nospam (bytes)  : {}".format(tox.self_get_nospam_bytes().hex()))

print("bootstrapping...")

bootstrap_hosts = wayround_org.toxcorebind.tox.get_std_bootstrap_hosts()

for i in bootstrap_hosts:
    print("    {}: {}".format(i[2].hex(), tox.bootstrap(*i)))


print("    done")


def friend_request_cb(obj, public_key, message):
    print("got friend_request: {}: \"{}\"".format(public_key.hex(), message))
    tox.friend_add_norequest(public_key)
    return


tox.callback_friend_request(friend_request_cb)


def friend_message_cb(obj, friend_number, type_, message):
    print(
        "got message (friend {}, type {}): \"{}\"".format(
            friend_number,
            type_,
            message
            )
        )
    tox.friend_send_message(friend_number, type_, message)
    return

tox.callback_friend_message(friend_message_cb)


def connection_status(self, connection_status):

    csn = None

    if connection_status == wayround_org.toxcorebind.tox.TOX_CONNECTION_NONE:
        csn = 'NONE'
    elif connection_status == wayround_org.toxcorebind.tox.TOX_CONNECTION_UDP:
        csn = 'UDP'
    elif connection_status == wayround_org.toxcorebind.tox.TOX_CONNECTION_TCP:
        csn = 'TCP'
    else:
        csn = 'ERROR'
    print("connection status now is: {}".format(csn))
    return

tox.callback_self_connection_status(connection_status)

stop_flag = threading.Event()


def a(f):
    while True:
        if stop_flag.is_set():
            print("stopping")
            break
        tox.iterate()
        time.sleep(tox.iteration_interval() / 1000)

threading.Thread(target=a, args=(stop_flag,)).start()

input()

stop_flag.set()


with open(data_file_name, 'wb') as f:
    f.write(tox.get_savedata())
