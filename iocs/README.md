# IOCS

Put your EPICS IOCs here. This folder has been created from the standard EPICS template following three criteria:

- Put the compilation results in a separate `target` folder; don't mix them with the original source code.
- Put each IOC in a fully independent folder, so that they are easy to deploy.
- Use full static linking, so that each IOC is completely self-contained and can be run from any location without any special requirements.

The resulting structure is organized as follows:

- `./configure` -> The EPICS build scripts, comming from the EPICS distribution itself.
- `./xxxIOC`    -> Your IOCs, one per folder:
    - `boot`    -> Boot scripts for the IOC, usually called `st.cmd`
    - `db`      -> EPICS database files. If you add additional support modules like `asyn`, you will need to reference them in the Makefile.
    - `src`     -> Source code of the IOC. If you add additional support modules like `asyn`, you will need to reference them in the Makefile.
    - `systemd` -> SystemD service files, to launch the IOCs as a SystemD service.
- `./target`    -> The output of the compilation process.
- `Makefile`    -> The instructions to compile all the IOCs.

To compile the IOCs, please follow these instructions:

- Download and install [the official EPICS distribution for LIPAc](https://github.com/IFMIF/epics-7.0/).
- Copy the resulting `CONFIG_SITE.local` and `RELEASE.local` into `configure/`
- Run `make`

The output artifacts will be located in the `target/` folder, one independent subfolder per IOC with the following structure:

- `./bin`  -> The IOC binary.
- `./boot` -> Boot scripts.
- `./db`   -> EPICS database files, including the ones required for the support modules.
- `./dbd`  -> EPICS record definition files, including the ones required for the support modules.
- `./lib`  -> Additional libraries. Usually this folder is empty.

To run an IOC locally:

- Go to `./target/${IOC}/boot`
- Run `st.cmd`

To deploy your IOC in production:

- Install the minimum dependencies:
    - `readline`
    - `libevent-pthreads`
    - `procServ`
- Copy the folder `./target/xxxIOC` wherever you want.
- Adjust the `st.cmd` file according to your system.
- Maybe install the SystemD service file.
- That's it!

# TODO

- Define the procedure to deploy the IOC as containers.
- Use a newer, more friendly build tool like CMake or Meson instead of Makefiles.
