:: creates VM szorgalmi with default settings
VBoxManage createvm --name "szorgalmi" --ostype Windows7_64 --default --register

:: adds hard disk Cdrive

VBoxManage storageattach "szorgalmi" --storagectl "SATA" --device 0 --port 0 --type hdd --medium Cdrive.vdi	

:: modify settings
VBoxManage modifyvm "szorgalmi" --memory 2048
VBoxManage modifyvm "szorgalmi" --vram 18
VBoxManage modifyvm "szorgalmi" --vrde on

:: mounts iso for install
:: UPDATE iso path
VBoxManage unattended install "szorgalmi" --iso=C:\Users\lesek\Downloads\VM\hu_windows_7_professional_with_sp1_vl_build_x64_dvd_624171.iso --user=Les --password=student --start-vm=session-type headless

:: starts vm and installs win
VBoxManage startvm "szorgalmi" --type headless
mstsc /v:192.168.0.66:3389
