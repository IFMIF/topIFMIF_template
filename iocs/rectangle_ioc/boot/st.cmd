#!../bin/linux-x86_64/rectangle

## Environment variables
epicsEnvSet("CURRENT_DIR", ${PWD})
epicsEnvSet("P", "my-awesome-ioc")
epicsEnvSet("R", "rectangle")

## Register all support components.
cd ../dbd
dbLoadDatabase("rectangle.dbd")
rectangle_registerRecordDeviceDriver(pdbbase)

## Load record instances. Sometimes DB files contain relative references to other files,
## so it is safer to jump into the DB folder, load the files, and then go back to the original folder.
cd ../db
dbLoadRecords("rectangle.db","P=$(P),R=$(R)")
cd ${CURRENT_DIR}

## Start the IOC
iocInit()

## Start any sequence programs
# dbpf $(P):START 1

# garbage
