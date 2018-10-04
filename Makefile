XPI=IMAPReceivedDate.xpi

CMD=find . \( \( -name '.??*' -o -name 'src' \) -prune \) -o \! -name '*~' \
    \! -name '.\#*' \! -name '*,v' \! -name Makefile \! -name '*.xpi' \
    \! -name '\#*' \! -name '*.pl' -type f -print
FILES=$(shell $(CMD))

all: $(XPI)

$(XPI): $(FILES)
	rm -f $@.tmp
	zip -r $@.tmp $(FILES)
	mv $@.tmp $@

clean: ; -rm -f *.xpi
