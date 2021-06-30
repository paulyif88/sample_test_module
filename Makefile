export PGPASSWORD:=odoo

generate_coverage_report:
	docker exec -u root -t odoo_web odoo -i test_module -d test_1 --stop-after-init
	docker exec -it odoo_web pytest -s --odoo-database=test_1 --odoo-log-level=test --html=/coverage/local/report.html /mnt/extra-addons/
	docker cp odoo_web:/coverage/local coverage