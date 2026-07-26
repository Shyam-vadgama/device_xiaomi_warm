# warm Android 16 (LineageOS 23.2) Sepolicy Reference

## Overview
Device: Xiaomi Redmi Note 14 (warm, 24116RNC1I)
Platform: Qualcomm pitti (SM7550 / Snapdragon 7 Gen 3)
Android: 16 (BP2A.250605.031.A3, API 34)
LineageOS: 23.2

## Sepolicy Structure

### sepolicy/vendor/ (43 files)

| Domain | Type | Purpose |
|--------|------|---------|
| hal_audio.te | hal_server | Audio HAL — bluetooth, socket to ssgtzd/init/vui_dmgr |
| hal_bluetooth.te | hal_client | Bluetooth HAL — read mac_addr data |
| hal_camera.te | hal_server | Camera HAL — sysfs, persist, flash, thermal, displayfeature |
| hal_displayfeature_xiaomi.te | hal_server | Xiaomi displayfeature — composer, color, postproc clients |
| hal_drm_widevine.te | hal_client | Widevine DRM — tee access |
| hal_fingerprint.te | hal_server | Fingerprint HAL — perf, tee, uhid, goodix, displayfeature |
| hal_gnss.te | hal_client | GNSS — persist sensors, dmabuf |
| hal_graphics_composer.te | hal_server | Graphics composer — displayfeature, rild, sensor binds |
| hal_light.te | hal_client | Light HAL — sysfs displayfeature |
| hal_mlipay.te | hal_server | MI Payment — tee, firmware, dmabuf |
| hal_perf.te | hal_server | Perf HAL — surfaceflinger, camera, fp, thermal data |
| hal_power_default.te | hal_server | Power HAL — input device |
| hal_sensors.te | hal_server | Sensors HAL — audio socket, sound device, tp virtual prox |
| hal_wifi_supplicant.te | hal_client | WiFi supplicant — ssr prop |
| mi_thermald.te | domain | Thermal daemon — kgsl, battery, graphics, thermal data |
| wcnss_service.te | domain | WCNSS service — mac addr, diag, wifi log, modem data |
| displayfeature.te | domain | Displayfeature service — system_server binder |
| tee.te | domain | TEE — gunyah, qvirtservice |
| init.te | domain | Vendor init — ptrace fp, set display/camera/fp props |
| vendor_init.te | domain | Vendor init props — audio, fp, deviceid |
| qti_display_boot.te | domain | Display boot — set displayfeature prop |
| qti_init_shell.te | domain | Init shell — proc watermark, firmware/data files |
| rild.te | domain | RIL daemon — mbn data, cpuid/miui/cpuid props |
| radio.te | domain | Radio — datafactory/latency hwservice, cnd, wifi |
| mediacodec.te | domain | Media codec — mistcdisplay, displayfeature prop |
| mediaserver.te | domain | Media server — sound device, qconfig |
| mediaswcodec.te | domain | Media SW codec — audio prop |
| vendor_sensors.te | domain | Vendor sensors — proc tp_proximity, battery supply |
| zygote.te | domain | Zygote — fp prop |
| servicemanager.te | domain | Service manager — bluetooth, citsensor binder |
| system_server.te | domain | System server — hal_displayfeature_xiaomi binder |

### Service Contexts
- `vendor.xiaomi.hardware.displayfeature_aidl.IDisplayFeature` → displayfeature
- `vendor.xiaomi.hardware.fx.tunnel.IMiFxTunnel` → fingerprint
- `vendor.xiaomi.hardware.mlipay.IMlipayService` → mlipay

### VNDService Contexts
- `display.mistcservice`
- `miclstcservice`
- `DisplayFeatureControl`

### Property Contexts (182 lines)
Major categories: camera, CIT, display (~100+ props), fingerprint, GNSS, mlipay, RIL (IMEI/MEID/SN), thermal

### Key File Types
- `vendor_displayfeature_device`, `vendor_fingerprint_device`, `touchfeature_device`, `sound_device`
- 12 file types: audio_socket, camera_persist, vendor_modem_data, sysfs_displayfeature, fp/ins/mac/thermal data, proc_tp_proximity, sysfs

## Notes for Android 17 Bringup
- No sepolicy/private/ directory (needed for A17 seapp_contexts)
- No sepolicy/diag/ (optional, QCOM diag-router)
- Device-specific HALs: Xiaomi displayfeature, mlipay, mi_thermald, fingerprint V2
- Platform: pitti (SM7550), A/B slots, dynamic partitions, AVB
