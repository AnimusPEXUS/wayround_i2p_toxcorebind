

# some simple analog of bot given here
# https://wiki.tox.chat/developers/client_examples/echo_bot

import time

import wayround_org.toxcorebind.tox


print("creating tox")

tox, error = wayround_org.toxcorebind.tox.Tox.new()

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
            'Echo Bot'.encode('utf-8')
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
            'Echoing your messages'.encode('utf-8')
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
print("nospam: {}".format(tox.self_get_nospam()))

print("nospam bytes: {}".format(tox.self_get_nospam_bytes().hex()))

print("bootstrapping...")


for i in [
        (
            b'144.76.60.215',
            33445,
            bytes.fromhex(
                '04119E835DF3E78BACF0F84235B300546AF8B936F035185E2A8E9E0A67C8924F'
            )
        ),
        (
            b'23.226.230.47',
            33445,
            bytes.fromhex(
                'A09162D68618E742FFBCA1C2C70385E6679604B2D80EA6E84AD0996A1AC8A074'
            )
        ),
        (
            b'178.21.112.187',
            33445,
            bytes.fromhex(
                '4B2C19E924972CB9B57732FB172F8A8604DE13EEDA2A6234E348983344B23057'
            )
        ),
        (
            b'195.154.119.113',
            33445,
            bytes.fromhex(
                'E398A69646B8CEACA9F0B84F553726C1C49270558C57DF5F3C368F05A7D71354'
            )
        ),
        (
            b'192.210.149.121',
            33445,
            bytes.fromhex(
                'F404ABAA1C99A9D37D61AB54898F56793E1DEF8BD46B1038B9D822E8460FAB67'
            )
        )
        ]:

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

while True:

    tox.iterate()
    time.sleep(tox.iteration_interval() / 1000)
