# SPDX-License-Identifier: GPL-2.0
LINUX		:= $(PWD)

define do_config
	$(eval VENDOR := $(1))
	$(eval SOC := $(2))
	$(eval BOARD_ENV := $(3))

	$(shell cp $(KMAKE_REPO)/kmakes/$(VENDOR)/$(SOC)/$(BOARD_ENV).mk $(PWD)/.kmake)

	$(eval include $(PWD)/.kmake)

	$(shell cp $(KMAKE_REPO)/configs/$(VENDOR)/$(SOC)/$(DEFCONFIG) $(PWD)/arch/$(ARCH)/configs/$(DEFCONFIG))

	@kmake $(DEFCONFIG)
endef

modules_cpio_gz: dir-pkg
	@echo Building $(BUILD)/modules.cpio.gz
	@mkdir -p $(BUILD)/tar-install/usr/
	@mv $(BUILD)/tar-install/lib $(BUILD)/tar-install/usr/lib
	@cd $(BUILD)/tar-install/; find usr | cpio -o -H newc -R +0:+0 |gzip -c > $(BUILD)/modules.cpio.gz
	@cd -

ramdisk: modules_cpio_gz
	@echo Appending modules.cpio.gz to final ramdisk
	@cat $(INITRD)	$(BUILD)/modules.cpio.gz \
			/home/abel/repos/linaro-boot/copy_modules_scripts.cpio.gz \
			/home/abel/repos/linaro-boot/firmware.cpio.gz \
			> $(BUILD)/ramdisk.cpio.gz;

mkbootimg: ramdisk
	@echo "Building $(BUILD)/boot.img"
	@echo "	DTB	: $(BUILD)/$(DTB)"
	@echo "	Image	: $(BUILD)/$(IMAGE)"
	@echo "	initrd	: $(INITRD)"
	@echo "	cmdline	: $(KARGS)"
	@echo "	commit  : "`git describe`

	@mkbootimg 	--kernel $(BUILD)/$(IMAGE) \
			--header_version 2 \
			--dtb $(BUILD)/$(DTB) \
			--cmdline $(KARGS) \
			--ramdisk $(BUILD)/ramdisk.cpio.gz \
			--base 0x80000000 \
			--pagesize 2048 \
			--output $(BUILD)/boot.img

