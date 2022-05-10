# test summary

## cluster

- version: 21.1.2, cluster: true, dhcp: true, avi_password: auto // PASSED
- version: 21.1.2, cluster: true, dhcp: true, avi_password: static // PASSED
- version: 21.1.2, cluster: true, dhcp: false, avi_password: auto // PASSED
- version: 21.1.2, cluster: true, dhcp: false, avi_password: static // PASSED

## standalone

- version: 21.1.2, cluster: false, dhcp: true, avi_password: auto // PASSED
- version: 21.1.2, cluster: false, dhcp: true, avi_password: static // PASSED
- version: 21.1.2, cluster: false, dhcp: false, avi_password: auto // PASSED
- version: 21.1.2, cluster: false, dhcp: false, avi_password: static // PASSED
- version: 21.1.3, cluster: false, dhcp: true, avi_password: auto // PASSED