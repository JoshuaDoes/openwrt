#
# Copyright (C) 2025 JoshuaDoes
#

define Device/google_oriole
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 6
  DEVICE_PACKAGES := tensor-kernel-prebuilt-raviole
  TENSOR_PRODUCT := raviole
  TENSOR_CMDLINE := cmdline=fips140.load_sequential=1 exynos_mfc.load_sequential=1 exynos_drm.load_sequential=1 g2d.load_sequential=1 disable_dma32=on earlycon=exynos4210,0x10A00000 console=ttySAC0,115200 androidboot.console=ttySAC0 printk.devkmsg=on cma_sysfs.experimental=Y cgroup_disable=memory cgroup.memory=nokmem rcupdate.rcu_expedited=1 rcu_nocbs=all rcutree.enable_rcu_lazy swiotlb=noforce disable_dma32=on sysctl.kernel.sched_pelt_multiplier=4 at24.write_timeout=100 log_buf_len=1024K
  TENSOR_BASE := 0x80000000
  TENSOR_PAGESIZE := 2048
  TENSOR_OFFSET_KERNEL := 0x800000
  TENSOR_OFFSET_RAMDISK := 0x4000000
  TENSOR_HEADER := 4
  IMAGE_SIZE := 67108k
endef
TARGET_DEVICES += google_oriole

define Device/google_raven
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 6 Pro
  DEVICE_PACKAGES := tensor-kernel-prebuilt-raviole
  TENSOR_PRODUCT := raviole
  TENSOR_CMDLINE := cmdline=fips140.load_sequential=1 exynos_mfc.load_sequential=1 exynos_drm.load_sequential=1 g2d.load_sequential=1 disable_dma32=on earlycon=exynos4210,0x10A00000 console=ttySAC0,115200 androidboot.console=ttySAC0 printk.devkmsg=on cma_sysfs.experimental=Y cgroup_disable=memory cgroup.memory=nokmem rcupdate.rcu_expedited=1 rcu_nocbs=all rcutree.enable_rcu_lazy swiotlb=noforce disable_dma32=on sysctl.kernel.sched_pelt_multiplier=4 at24.write_timeout=100 log_buf_len=1024K
  TENSOR_BASE := 0x80000000
  TENSOR_PAGESIZE := 2048
  TENSOR_OFFSET_KERNEL := 0x800000
  TENSOR_OFFSET_RAMDISK := 0x4000000
  TENSOR_HEADER := 4
  IMAGE_SIZE := 67108k
endef
TARGET_DEVICES += google_raven

define Device/google_bluejay
  $(call Device/tensor)
  DEVICE_MODEL := Pixel 6a
  DEVICE_PACKAGES := tensor-kernel-prebuilt-bluejay
  TENSOR_PRODUCT := bluejay
  TENSOR_CMDLINE := cmdline=fips140.load_sequential=1 exynos_mfc.load_sequential=1 exynos_drm.load_sequential=1 g2d.load_sequential=1 disable_dma32=on earlycon=exynos4210,0x10A00000 console=ttySAC0,115200 androidboot.console=ttySAC0 printk.devkmsg=on cma_sysfs.experimental=Y cgroup_disable=memory cgroup.memory=nokmem rcupdate.rcu_expedited=1 rcu_nocbs=all rcutree.enable_rcu_lazy swiotlb=noforce disable_dma32=on sysctl.kernel.sched_pelt_multiplier=4 at24.write_timeout=100 log_buf_len=1024K
  TENSOR_BASE := 0x80000000
  TENSOR_PAGESIZE := 2048
  TENSOR_OFFSET_KERNEL := 0x800000
  TENSOR_OFFSET_RAMDISK := 0x4000000
  TENSOR_HEADER := 4
  IMAGE_SIZE := 67108k
endef
TARGET_DEVICES += google_bluejay
