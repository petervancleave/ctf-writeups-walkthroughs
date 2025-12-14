
## Containerization Summary

Modern applications are often difficult to manage due to installation issues, environment specific configuration quirks, dependency conflicts, and troubleshooting complexity. Containers solve these problems through isolation. A container packages an application together with all of its dependencies into a single, self contained environment, ensuring consistent behavior across systems.

Unlike virtual machines, containers do not include a full guest operating system. Virtual machines run on a hypervisor and each VM contains its own OS, making them heavier and slower to start. Containers instead share the host operating system kernel and isolate only the application and its dependencies. This makes containers lightweight, fast to deploy, and highly scalable.

Containers are especially well suited for microservice architectures. Instead of deploying a single monolithic application, modern systems often break functionality into smaller services based on business needs. Containers allow individual services to scale independently, which improves performance and resource efficiency under varying workloads.

A container engine is responsible for building, running, and managing containers. Docker is one of the most widely used container engines. It uses Dockerfiles to define application environments and dependencies, allowing applications to be built and deployed consistently across systems.

From a security perspective, containers rely heavily on isolation. A container escape occurs when code running inside a container gains access to the host system or other containers. Docker uses a client server model where the Docker daemon exposes an API through a Unix socket. If a container has access to the Docker socket, it can interact directly with the Docker Engine, which may allow full control over the host and other containers.

---

## Walkthrough

First, list all running Docker containers on the system.

`docker ps`

This reveals multiple running services. The main web application is accessible at:

`http://MACHINE_IP:5001`

Visiting the site shows that the DoorDasher website has been defaced and replaced with a page labeled Hopperoo. Another container named uptime-checker appears interesting.

Next, access the uptime-checker container.

`docker exec -it uptime-checker sh`

Inside the container, check whether the Docker socket is accessible.

`ls -la /var/run/docker.sock`

The socket is readable and writable, meaning the container has access to the Docker API. This indicates a misconfiguration that allows Docker commands to be executed from within the container.

Confirm this by running Docker commands inside the container.

`docker ps`

Since Docker commands work, this confirms a Docker escape scenario where the container can control the Docker daemon.

Next, access the privileged deployer container.

`docker exec -it deployer bash`

Verify the current user.

`whoami`

Explore the container filesystem until the recovery script is found in the root directory.

Once located, execute the script with sudo to restore the website.

`sudo /recovery_script.sh`

After running the script, refresh the website at:

`http://MACHINE_IP:5001`

The DoorDasher site should now be restored.

Finally, retrieve the flag located in the root directory


---

Q: What exact command lists running Docker containers?

A: docker ps

Q: What file is used to define the instructions for building a Docker image?

A: Dockerfile

Q: What's the flag?

A: THM{DOCKER_ESCAPE_SUCCESS}

Q: Bonus Question: There is a secret code contained within the news site running on port `5002`; this code also happens to be the password for the deployer user! They should definitely change their password. Can you find it?

A: DeployMaster2025!


