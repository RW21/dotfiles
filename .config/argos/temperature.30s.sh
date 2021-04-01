#!/bin/bash
echo $(sensors | grep -A 0 'Package'  | cut -c17-25)
