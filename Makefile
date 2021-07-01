export PGPASSWORD:=odoo

run_tests:
	docker exec -u root -t odoo_web odoo -i test_module -d test_1 --stop-after-init
	docker exec -u root -it odoo_web coverage run --source=/mnt/extra-addons/  -m pytest -s --odoo-database=test_1 --odoo-log-level=test --html=/coverage/tests/report.html /mnt/extra-addons/
	docker exec -it -u root odoo_web coverage html -d /coverage/code
	docker cp odoo_web:/coverage coverage
