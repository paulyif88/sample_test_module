FROM odoo:12.0
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-pip
RUN mkdir -p /coverage && chown -R odoo /coverage
RUN pip3 install pytest-odoo coverage pytest-html coveralls
USER odoo