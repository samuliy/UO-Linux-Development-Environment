#!/bin/bash

set -e

cd /ServUO
sed -i "s/^#CustomPath=.*/CustomPath=\/UOData/" /ServUO/Config/DataPath.cfg
make clean
dotnet build
make run