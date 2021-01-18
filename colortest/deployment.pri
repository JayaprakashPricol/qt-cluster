isEmpty(PREFIX) {
    PREFIX = /usr/local
}

target.path = $$PREFIX/bin

export(target.path)

INSTALLS += target

export(INSTALLS)
