#WordPress LEMP Stack with Docker
This project demonstrates a lightweight WordPress system built on the LEMP stack (Nginx, MariaDB, PHP) using Docker and Docker Compose. It serves as a practical learning environment to gain experience with system administration using Docker.

#Features:
Simplified Setup: Leverages Docker Compose to streamline the configuration and deployment of the LEMP stack components (Nginx, MariaDB, PHP) and WordPress. Customizable: Easily modify environment variables in .env to tailor settings for your WordPress installation. Scalable: Docker's containerization approach allows for scaling the number of WordPress instances or other services as needed. Portable: Docker ensures consistent development and deployment environments across different machines. Requirements:

Docker Engine (install instructions: https://docs.docker.com/engine/install/) Docker Compose (install instructions: https://docs.docker.com/compose/install/) Getting Started:

Clone the Repository:

git clone https://github.com/HamzaAmeur11/inception
cd inception


docker-compose up -d
-d flag runs the containers in detached mode. Accessing WordPress:

By default, WordPress will be accessible at http://localhost:8080. Update the VIRTUAL_HOST environment variable in .env for custom domain access. Navigate to the URL in your browser to complete the WordPress installation process. Additional Notes:

Database Access: Use a tool like phpMyAdmin (https://www.phpmyadmin.net/downloads/) to access the MariaDB database (credentials stored in .env). Persistent Volumes (Optional): Consider using Docker volumes to persist WordPress data beyond container restarts (refer to Docker documentation for details: https://docs.docker.com/storage/volumes/). Security:

This setup is intended for development purposes. For production environments, implement additional security measures (firewalls, proper user permissions, etc.). Always keep Docker and Docker Compose updated. Contributing:

We welcome contributions to this project! Feel free to submit pull requests for bug fixes, enhancements, or suggestions.

#License:

This project is licensed under the MIT License: https://choosealicense.com/licenses/mit/.
