ifeq ($(MTK_VOLTE_SUPPORT), yes)
$(info ENABLE MTK_VOLTE_SUPPORT)
include $(call all-subdir-makefiles)
endif
