#!/bin/env python3

import time
from epics import caget, caput, cainfo

# Starting data
print('Original values')
print('\tWidth', caget('my-awesome-ioc:rectangle:width'))
print('\tHeight', caget('my-awesome-ioc:rectangle:height'))
print('\tPerimeter', caget('my-awesome-ioc:rectangle:perimeter'))
print('\tArea', caget('my-awesome-ioc:rectangle:area'))

# Add some delay, otherwise EPICS can't refresh properly
time.sleep(1)
print('Set some new values')
caput('my-awesome-ioc:rectangle:width', 48)
caput('my-awesome-ioc:rectangle:height', 11)
time.sleep(1)

# Final data
print('Resulting values')
print('\tWidth', caget('my-awesome-ioc:rectangle:width'))
print('\tHeight', caget('my-awesome-ioc:rectangle:height'))
print('\tPerimeter', caget('my-awesome-ioc:rectangle:perimeter'))
print('\tArea', caget('my-awesome-ioc:rectangle:area'))
