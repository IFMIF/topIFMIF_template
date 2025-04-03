# Podman quadlets

To deploy the IOCs in production with Podman Quadlets, follow these steps:

- Copy these files into `/etc/containers/systemd/`
- Run `systemctl daemon-reload`
- Run `systemctl start rectangle_ioc quadractic_ioc`

There you go, your containers will run now as SystemD services, and will start automatically if you reboot your machine.

To update running containers, run `podman auto-update`

# References

- https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html
- https://www.redhat.com/en/blog/quadlet-podman
