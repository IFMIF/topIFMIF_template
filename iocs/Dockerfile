# --------------------------------------------------------------------------------------------------------------------
# Build all the IOCs
# --------------------------------------------------------------------------------------------------------------------

FROM ghcr.io/ifmif/lipac-dev as base

COPY . /work/iocs/
WORKDIR /work/iocs/
RUN cp /opt/epics-7.0/RELEASE.local configure/
RUN make clean
RUN make

# --------------------------------------------------------------------------------------------------------------------
# First IOC
# --------------------------------------------------------------------------------------------------------------------

FROM ghcr.io/ifmif/lipac-prod AS rectangle_ioc

COPY --from=base /work/iocs/target/rectangle_ioc/ /opt/rectangle_ioc/
WORKDIR /opt/rectangle_ioc/boot/
ENTRYPOINT ["./st.cmd"]

#EXPOSE 5049/udp
#EXPOSE 5064/udp
#EXPOSE 5064/tcp
#EXPOSE 5075/tcp
#EXPOSE 5076/udp

# --------------------------------------------------------------------------------------------------------------------
# Second IOC
# --------------------------------------------------------------------------------------------------------------------

FROM ghcr.io/ifmif/lipac-prod AS quadratic_ioc

COPY --from=base /work/iocs/target/quadratic_ioc/ /opt/quadratic_ioc/
WORKDIR /opt/quadratic_ioc/boot/
ENTRYPOINT ["./st.cmd"]

#EXPOSE 5049/udp
#EXPOSE 5064/udp
#EXPOSE 5064/tcp
#EXPOSE 5075/tcp
#EXPOSE 5076/udp
