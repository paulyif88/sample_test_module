export PGPASSWORD:=odoo

tests:
	docker exec -u root -t odoo_web odoo -i test_module -d test_1 --stop-after-init
	docker exec -u root -it odoo_web coverage run --source=/mnt/extra-addons/  -m \
		pytest -s --odoo-database=test_1 --odoo-log-level=test /mnt/extra-addons/
	docker cp odoo_web:.coverage .


