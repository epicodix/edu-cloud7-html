#!/bin/sh

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate

# Create a superuser non-interactively
echo "Creating superuser (admin/password123)..."
python manage.py shell <<EOF
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'password123')
    print("Superuser 'admin' created.")
else:
    print("Superuser 'admin' already exists.")
EOF

# Start the Django development server
echo "Starting Django server on 0.0.0.0:8000..."
python manage.py runserver 0.0.0.0:8000
