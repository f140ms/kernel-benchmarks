

from ubuntu:16.04

env DEBIAN_FRONTEND noninteractive
run apt-get update
run apt-get install -y apt-utils
run apt-get install -y build-essential flex bison libelf-dev git
run apt-get install -y wget
run apt-get install -y time
run apt-get install -y libncurses-dev openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf
run apt-get install -y bc

copy Makefile /
copy x86_64_defconfig_dot_config.gz /

#workdir /dev/shm
