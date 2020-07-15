docker-bootstrap:
	docker build -t kernel-benchmarks .
	docker run --rm -it -v /tmp:/tmp kernel-benchmarks make docker-run		

run-benchmark: linux-4.18.20.tar.xz
	rm -rf linux-4.18.20/
	#
	tar xJf linux-4.18.20.tar.xz
	gzip -dc /x86_64_defconfig_dot_config.gz > linux-4.18.20/.config
	#
	#cd linux-4.18.20/ && make defconfig
	md5sum linux-4.18.20/.config
	cd linux-4.18.20/ && make clean
	cd linux-4.18.20/ && time -v make -j `grep ^processor /proc/cpuinfo | wc -l`

linux-4.18.20.tar.xz:
	wget https://mirrors.edge.kernel.org/pub/linux/kernel/v4.x/linux-4.18.20.tar.xz

workdir=/tmp

docker-run:
	#cp /Makefile $(workdir)
	#cp x86_64_defconfig_dot_config.gz $(workdir)
	cd $(workdir) && make -f /Makefile run-benchmark

