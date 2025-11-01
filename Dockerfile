FROM odoo:18.0

# Install git
USER root
RUN apt-get update && apt-get install -y git

# Create addons directory
RUN mkdir -p /mnt/extra-addons

# Clone your HRM GitHub module (replace the URL and branch as needed)
RUN git clone -b main https://github.com/<your-username>/<your-repo>.git /mnt/extra-addons/hrm

# Set permissions
RUN chown -R odoo:odoo /mnt/extra-addons/hrm

USER odoo

EXPOSE 8069
