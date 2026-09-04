.PHONY: check build clean
check:
	./check.sh
build: check
	rm -rf dist build *.egg-info src/*.egg-info
	/home/dmh/桌面/system-tools-week3/.venv-dev/bin/python -m build --no-isolation --wheel
clean:
	rm -rf dist build .pytest_cache .ruff_cache src/*.egg-info
