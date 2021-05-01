# What is Devspace
Devspace is a tool to build, run and develop using Kubernetes.

Devspace in this instance will setup:

- Web (Using nginx + fpm + supervisor) (8.0)
- Redis
- MySQL (MariaDB Galera)
- PHPMyAdmin
- RedisAdmin
- Mailhog

# How to install Devspace
Simply install NodeJS and NPM first, then use npm install -g devspace

If your environment is set up correctly, you can now type devspace and it should just work, otherwise refer to https://devspace.sh/cli/docs/getting-started/installation

# How to use Devspace

To use Devspace you need a local (or remote) Kubernetes cluster ready to go.

This can be done in a few ways.

## Windows
- Enable Kubernetes in the Docker For Windows preferences panel.
- Install Minikube

## MacOS
- Enable Kubernetes in the Docker For Mac preferences panel.
- Install Minikube

## Linux
- Install Minikube
- Use Ubuntu and install microk8s:
  - run sudo snap install microk8s, and setup with microk8s status

## Remote

Follow procedures outlined at the remote for how to get connected. Usually involves installing kubectl locally, and changing the `~/.kube/config` file

Once Kubernetes is setup and responds to a `kubectl get po -A` (microk8s: `microk8s kubectl get po -A`) you can simply do the following:

1. `kubectl create namespace <namespace>`
2. `devspace use namespace <namespace>`
2. `devspace dev -b`

This will build the containers and launch everything up.
This will also set up synchronization of files and ports from the cluster to the host.

# XDebug
XDebug is enabled and sending back signals on port 9003 using XDebug version 3.

# Devspace URLs
## HTTP Services
- Site: http://wordpress.microk8s.local/
- Admin: http://wordpress.microk8s.local/wp/wp-admin
- PHPMyAdmin: http://127.0.0.1:8070
- RedisAdmin: http://127.0.0.1:8060
- Mailhog: http://127.0.0.1:8025

## Non HTTP services:
- MySQL: localhost:3306
- Redis: localhost:6379
- Mailhog: localhost:1025

# How to get login for PHPMyAdmin

Open a terminal and type devspace print, then scroll up to the top.

## If no changes:
- phpmyadmin: root / rootpw

# How to interact with containers

The simple way is to look in the DevSpace DevUI, you can select to enter containers there and do stuff.

If you want to enter the CLI of the Web container, simply run: `devspace run cli`

# Post Setup things

First you will have to actually install Wordpress !

Go into container via `devspace run cli`

Then run: `wp --allow-root core install --url=<url to site> --title='Site title' --admin_user='<your admin user name>' --admin_password=<your admin password> --admin_email='<your email address>'`