
cdef extern from "tox.h":

    Tox *tox_new(const struct Tox_Options *options, TOX_ERR_NEW *error);

    uint32_t tox_version_major(void);

    uint32_t tox_version_minor(void);

    uint32_t tox_version_patch(void);

    bool tox_version_is_compatible(uint32_t major, uint32_t minor, uint32_t patch);
