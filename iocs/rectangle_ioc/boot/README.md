To start the ioc from this directory execute the command
````
../bin/linux-x86_64/<appname> st.cmd
````

Alternatively make the st.cmd file directly executable with `chmod +x st.cmd` and check the executable name on the first line of the st.cmd file.

You may need to change the name of the `.dbd` and `.db` files in the st.cmd's `dbLoadDatabase()` commands and of the `registerRecordDeviceDriver` routine before starting the ioc.
