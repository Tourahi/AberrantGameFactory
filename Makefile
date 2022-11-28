

LINTER = ./bin/lint_all
LOVE = love
MOON = moonc
SOURCE_PATH = ./src
TEST = busted

all: compile_moon agf


agf:
	${LOVE} ${SOURCE_PATH}

compile_moon:
	@find ${SOURCE_PATH} -name '*.moon' | xargs ${MOON}

clean:
	@find ${SOURCE_PATH} -name '*.lua' ! -path '*src/lib/lua*' -prune -exec rm {} \;

lint:
	@$(LINTER)

test:
	@${TEST} .
