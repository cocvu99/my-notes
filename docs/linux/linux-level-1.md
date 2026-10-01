Linux Level 1

## Linux Boot Process (Quá trình khởi động của Linux)

```mermaid
[Power On]
    |
    v
(1) FIRMWARE (UEFI / Legacy BIOS)
    POST -> init CPU/RAM/PCIe -> chọn boot device theo BootOrder
    |
    v
(2) BOOTLOADER
    UEFI : ESP -> shimx64.efi (Secure Boot) -> grubx64.efi
    BIOS : MBR boot.img (512B) -> core.img -> /boot/grub/*.mod + grub.cfg
    Output: vmlinuz + initramfs + kernel cmdline được nạp vào RAM
    |
    v
(3) KERNEL
    tự giải nén -> setup memory/paging, scheduler, interrupts
    -> init driver built-in -> giải nén initramfs vào rootfs -> exec /init (PID 1)
    |
    v
(4) INITRAMFS (early userspace)
    systemd/dracut: udev nạp module (NVMe, ENA, LVM, LUKS, RAID...)
    -> mount real root vào /sysroot -> switch_root
    |
    v
(5) systemd (PID 1 trên real root)
    sysinit.target -> basic.target -> multi-user.target [-> graphical.target]
    |
    v
(6) SERVICES: sshd, containerd, kubelet, cloud-init... -> Running system
```
