ARCH		:= arm64
J		:= 32
#CC		:= clang
CROSS_COMPILE	:= ccache aarch64-linux-gnu-
#LLVM		:= 1
NOTIFY_CMD	:= echo
ALL_TARGETS	:= mkbootimg

ROOT		:= "/dev/nvme0n1p19"
KARGS		:= " root=$(ROOT) rw no_console_suspend cma=128M ignore_loglevel pd_ignore_unused clk_ignore_unused "
IMAGE		:= arch/arm64/boot/Image
DTB		:= arch/arm64/boot/dts/qcom/x1e80100-crd.dtb
INITRD		:= /home/abel/repos/linaro-boot/initrd.built.cpio.gz

DEFCONFIG	= crd_defconfig

