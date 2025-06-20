ARCH		:= arm64
J		:= 32
#CC		:= clang
CROSS_COMPILE	:= ccache aarch64-linux-gnu-
#LLVM		:= 1
NOTIFY_CMD	:= echo
ALL_TARGETS	:= mkbootimg

ROOT		:= "UUID=7f812f79-ea2f-4447-8f92-187038f12cde"
KARGS		:= " root=$(ROOT) rw no_console_suspend cma=128M ignore_loglevel pd_ignore_unused clk_ignore_unused regulator_ignore_unused trace_event=regulator:* "
IMAGE		:= arch/arm64/boot/Image
DTB		:= arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb
INITRD		:= /home/abel/repos/linaro-boot/initrd.built.cpio.gz

DEFCONFIG	:= devkit_defconfig
