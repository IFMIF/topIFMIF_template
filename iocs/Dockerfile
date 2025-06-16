# --------------------------------------------------------------------------------------------------------------------
# Build all the IOCs
# --------------------------------------------------------------------------------------------------------------------

FROM ghcr.io/ifmif/lipac-epics as build

COPY . /work/iocs/
WORKDIR /work/iocs/
RUN cp /opt/epics-7.0/*.local configure/
RUN make clean
RUN make

# --------------------------------------------------------------------------------------------------------------------
# First IOC
# --------------------------------------------------------------------------------------------------------------------

FROM ghcr.io/ifmif/lipac-epics as ioc_rectangle
COPY --from=build /work/iocs/target/ioc_rectangle/ /opt/ioc_rectangle/
WORKDIR /opt/ioc_rectangle/boot/
ENTRYPOINT ["./st.cmd"]

#EXPOSE 5049/udp
#EXPOSE 5064/udp
#EXPOSE 5064/tcp
#EXPOSE 5075/tcp
#EXPOSE 5076/udp

# --------------------------------------------------------------------------------------------------------------------
# Second IOC
# --------------------------------------------------------------------------------------------------------------------

FROM ghcr.io/ifmif/lipac-epics as ioc_quadratic
COPY --from=build /work/iocs/target/ioc_quadratic/ /opt/ioc_quadratic/
WORKDIR /opt/ioc_quadratic/boot/
ENTRYPOINT ["./st.cmd"]

#EXPOSE 5049/udp
#EXPOSE 5064/udp
#EXPOSE 5064/tcp
#EXPOSE 5075/tcp
#EXPOSE 5076/udp
