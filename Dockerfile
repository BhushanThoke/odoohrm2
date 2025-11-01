FROM odoo:18.0

# Install git
USER root
RUN apt-get update && apt-get install -y git

# Create addons directory
RUN mkdir -p /mnt/extra-addons

# Clone the repo and copy only the module folder
RUN git clone -b main https://github.com/BhushanThoke/odoohrm2.git /tmp/odoohrm2 && \
    cp -r /tmp/odoohrm2/custom_addons/* /mnt/extra-addons/ && \
    rm -rf /tmp/odoohrm2

# Set permissions
RUN chown -R odoo:odoo /mnt/extra-addons

USER odoo

EXPOSE 8069
