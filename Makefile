# Variables
GO_APP = main.go
VENV_DIR = behave-env
PYTHON = python3
BEHAVE = $(VENV_DIR)/bin/behave
PORT = 8080

# Create the virtual environment and install dependencies
.PHONY: setup
setup:
	$(PYTHON) -m venv $(VENV_DIR)
	$(VENV_DIR)/bin/pip install behave

# Run the Go application
.PHONY: run
run:
	go run $(GO_APP)

# Run Behave tests in the virtual environment
.PHONY: test
test:
	$(BEHAVE)

# Start the Go application in the background and run Behave tests
.PHONY: test-all
test-all: 
	@echo "Starting Go application..."
	go run $(GO_APP) & 
	GO_PID=$$! && sleep 2 && $(BEHAVE); kill $$GO_PID

# Clean up the virtual environment
.PHONY: clean
clean:
	rm -rf $(VENV_DIR)
