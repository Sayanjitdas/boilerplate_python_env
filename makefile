# makefile for building and setting the development environment
# Author : Sayanjit Das


# install and build development environment
PYTHON_VER := "3.8"
SYSTEM_VER := $(shell python --version | grep $(PYTHON_VER))

install-dev:
	@echo "Checking python version compatiblity..."
	@echo "SYSTEM_VER $(SYSTEM_VER)"
	@if [ -z "$(SYSTEM_VER)" ]; then \
		echo "Python version incompatible"; \
		echo "Required version \"$(PYTHON_VER)\""; \
		exit 1; \
	else \
		echo "python version compatible.."; \
	fi
	@echo "Creating python venv.."
	python -m venv .venv
	@echo "Installing poetry.."
	.venv/bin/pip install poetry
	.venv/bin/poetry --version
	@echo "Installing dependencies.."
	.venv/bin/poetry install
	@echo "done.."
	@echo "\tactivate the env by using the command"
	@echo "\tsource .venv/bin/activate"
	@echo ""
