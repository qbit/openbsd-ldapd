
test:
	@printf '[defaults]\nroles_path=../\n' >ansible.cfg
	@ansible-playbook tests/test.yml -i tests/inventory

