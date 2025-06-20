# SPDX-License-Identifier: GPL-2.0

PHONY += config/qcom/x1e80100/crd
config/qcom/x1e80100/crd:
	$(call do_config,qcom,x1e80100,crd)

PHONY += config/qcom/x1e80100/devkit
config/qcom/x1e80100/devkit:
	$(call do_config,qcom,x1e80100,devkit)

