#!/bin/bash
echo $(weather rjaa -m | grep -A 0 'Temperature' | cut -c17-20)
