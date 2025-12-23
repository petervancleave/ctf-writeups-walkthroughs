# Containers - DoorDasher's Demise

<img width="900" height="900" alt="6228f0d4ca8e57005149c3e3-1762360425839" src="https://github.com/user-attachments/assets/4bc5b044-6485-4b5e-83e2-f03fc59f440b" />

https://tryhackme.com/room/container-security-aoc2025-z0x3v6n9m2


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

<img width="937" height="883" alt="ss1" src="https://github.com/user-attachments/assets/85732539-78f9-424f-9812-544580bbaaf0" />


This reveals multiple running services. The main web application is accessible at:

`http://MACHINE_IP:5001`

<img width="938" height="225" alt="ss2" src="https://github.com/user-attachments/assets/fa7e8da0-184a-4587-85da-91334c3c324d" />


Visiting the site shows that the DoorDasher website has been defaced and replaced with a page labeled Hopperoo. Another container named uptime-checker appears interesting.

<img width="1408" height="927" alt="ss3" src="https://github.com/user-attachments/assets/614b095b-573d-48c0-8bc2-bfca7ef6a37e" />


Next, access the uptime-checker container.

`docker exec -it uptime-checker sh`

<img width="885" height="91" alt="ss4" src="https://github.com/user-attachments/assets/d9c8c5b2-432a-4dbf-b5fc-bff665079c68" />


Inside the container, check whether the Docker socket is accessible.

`ls -la /var/run/docker.sock`

The socket is readable and writable, meaning the container has access to the Docker API. This indicates a misconfiguration that allows Docker commands to be executed from within the container.

Confirm this by running Docker commands inside the container.

`docker ps`

<img width="938" height="240" alt="ss5" src="https://github.com/user-attachments/assets/d4f4bf7e-4bdd-4869-8461-2dcedad778bd" />


Since Docker commands work, this confirms a Docker escape scenario where the container can control the Docker daemon.

Next, access the privileged deployer container.

`docker exec -it deployer bash`

Verify the current user.

`whoami`

<img width="482" height="95" alt="ss6" src="https://github.com/user-attachments/assets/9c66426f-379d-4658-8b74-5b8fb08d22d7" />


Explore the container filesystem until the recovery script is found in the root directory.

Once located, execute the script with sudo to restore the website.

`sudo /recovery_script.sh`

<img width="692" height="213" alt="ss7" src="https://github.com/user-attachments/assets/756e591f-b0fb-4380-aef6-1aba96867848" />


After running the script, refresh the website at:

`http://MACHINE_IP:5001`

The DoorDasher site should now be restored.

<img width="1486" height="916" alt="ss8" src="https://github.com/user-attachments/assets/1019b4df-7cca-41f2-9640-81a89b73dbac" />


Finally, retrieve the flag located in the root directory


---

Q: What exact command lists running Docker containers?

A: docker ps

Q: What file is used to define the instructions for building a Docker image?

A: Dockerfile

Q: What's the flag?

A: THM{DOCKER_ESCAPE_SUCCESS}

Q: Bonus Question: There is a secret code contained within the news site running on port `5002`; this code also happens to be the password for the deployer user! They should definitely change their password. Can you find it?

<img width="1372" height="877" alt="ss9" src="https://github.com/user-attachments/assets/d7138fe7-142d-4e72-b087-fa534ac7e36b" />

<img width="388" height="400" alt="ss10" src="https://github.com/user-attachments/assets/cc92e918-2ccc-421e-b6c6-0f1a43308606" />



A: DeployMaster2025!


