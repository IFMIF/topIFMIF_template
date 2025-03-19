# --------------------------------------------------------------------------------------------------------------------
# Build all the IOCs
# --------------------------------------------------------------------------------------------------------------------

FROM ghcr.io/ifmif/lipac-dev as base
MAINTAINER pepito@gmail.com

COPY iocs/ /work/iocs/
WORKDIR /work/iocs/
RUN cp /opt/epics-7.0/RELEASE.local configure/
RUN make

# --------------------------------------------------------------------------------------------------------------------
# First IOC
# --------------------------------------------------------------------------------------------------------------------

FROM ghcr.io/ifmif/lipac-prod AS rectangle_ioc
COPY --from=base /work/iocs/target/rectangleIOC/ /opt/rectangleIOC/

# Start the IOC
WORKDIR /opt/rectangleIOC/boot/
#ENTRYPOINT ["./st.cmd"]
ENTRYPOINT ["/usr/bin/procServ", "--logfile", "-", "--port", "20000", "./st.cmd"]

# --------------------------------------------------------------------------------------------------------------------
# Individual IOCs
# --------------------------------------------------------------------------------------------------------------------

FROM ghcr.io/ifmif/lipac-prod AS quadratic_ioc
COPY --from=base /work/iocs/target/quadraticIOC/ /opt/quadraticIOC/

# Start the IOC
WORKDIR /opt/quadraticIOC/boot/
#ENTRYPOINT ["./st.cmd"]
ENTRYPOINT ["/usr/bin/procServ", "--logfile", "-", "--port", "20000", "./st.cmd"]
