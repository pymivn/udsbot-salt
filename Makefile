all: test


test:
	echo "base:\n  '*':\n    - uds" > states/top.sls
	vagrant up
