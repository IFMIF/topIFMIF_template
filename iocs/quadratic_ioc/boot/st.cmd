#!../bin/linux-x86_64/quadratic

## Environment variables
epicsEnvSet("CURRENT_DIR", ${PWD})
epicsEnvSet("P", "my-awesome-ioc")
epicsEnvSet("R", "quadratic")

## Register all support components.
cd ../dbd
dbLoadDatabase("quadratic.dbd")
quadratic_registerRecordDeviceDriver(pdbbase)

## Load record instances. Sometimes DB files contain relative references to other files,
## so it is safer to jump into the DB folder, load the files, and then go back to the original folder.
cd ../db
dbLoadRecords("quadratic.db","P=$(P),R=$(R)")
dbLoadRecords("ioc.db","IOCNAME=QUADRATIC,TODFORMAT=%Y/%m/%d %H:%M:%S")
cd ${CURRENT_DIR}

## Start the IOC
iocInit()

## Start any sequence programs
# dbpf $(P):START 1
