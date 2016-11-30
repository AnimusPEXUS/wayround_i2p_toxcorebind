
import copy

ZERO_ADDRESS = b'\x00' * 38


def _hex(value):
    ret = value
    if ret is not None:
        ret = ret.hex()
        ret = ret.lower()
    return ret


def _from_hex(value):
    ret = value
    if ret is not None:
        ret = bytes.fromhex(ret)
    return ret


class ToxID:

    @classmethod
    def new_from_hex(cls, value):

        ret = cls()
        ret.address_hex = value

        return ret

    @classmethod
    def new_from_bytes(cls, value):

        ret = cls()
        ret.address = value

        return ret

    def __init__(self):
        self._address = ZERO_ADDRESS
        return

    def __str__(self):
        return self.address_hex

    def __eq__(self, value):

        ret = False

        if isinstance(value, ToxID):
            ret = value.address == self.address

        return ret

    @property
    def address(self):
        ret = self._address
        return ret

    @address.setter
    def address(self, value):

        if not isinstance(value, bytes):
            raise TypeError("`address' must be bytes")

        if len(value) not in [
                32,
                38
                ]:
            raise ValueError("invalid string length")

        self._address = value

        return

    @property
    def pkey(self):
        ret = self.address[:32]
        return ret

    @pkey.setter
    def pkey(self, value):

        if not isinstance(value, bytes):
            raise TypeError("`pkey' must be bytes")

        if len(value) != 32:
            raise ValueError("`pkey' length must be 32")

        last6 = self.last6
        if last6 is None:
            self.address = value
        else:
            self.address = value + last6

        return

    @property
    def last6(self):
        ret = None
        if len(self._address) == 38:
            ret = self._address[32:]
        return ret

    @last6.setter
    def last6(self, value):

        if value is not None:
            if not isinstance(value, bytes):
                raise TypeError("`last6' must be None or bytes")

            if len(value) != 6:
                raise ValueError("`last6' length must be 6 bytes")

        len_addr = len(self._address)
        if value is None:

            self.address = self.pkey

        elif isinstance(value, bytes):

            self.address = self.pkey + value

        else:
            raise Exception("programming error")

        return

    @property
    def nospam(self):
        last6 = self.last6
        ret = None
        if last6 is not None:
            ret = last6[:4]
        return ret

    @property
    def cs(self):
        last6 = self.last6
        ret = None
        if last6 is not None:
            ret = last6[-2:]
        return ret

    @property
    def address_hex(self):
        return _hex(self.address)

    @address_hex.setter
    def address_hex(self, value):
        if not isinstance(value, str):
            raise TypeError("`address_hex' must be str")
        if len(value) not in [64, 76]:
            raise ValueError("`address_hex' length must be 64 or 76")
        self.address = _from_hex(value)
        return

    @property
    def pkey_hex(self):
        return _hex(self.pkey)

    @pkey_hex.setter
    def pkey_hex(self, value):
        if not isinstance(value, str):
            raise TypeError("`pkey_hex' must be str")
        if len(value) != 64:
            raise ValueError("`pkey_hex' length must be 64")
        self.pkey = _from_hex(value)
        return

    @property
    def last6_hex(self):
        return _hex(self.last6)

    @last6_hex.setter
    def last6_hex(self, value):
        if value is not None:
            if not isinstance(value, str):
                raise TypeError("`last6_hex' must be str")
            if len(value) != 12:
                raise ValueError("`last6_hex' length must be 12")
        self.last6 = _from_hex(value)
        return

    @property
    def nospam_hex(self):
        return _hex(self.nospam)

    @property
    def cs_hex(self):
        return _hex(self.cs)
