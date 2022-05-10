cd 04_avi_cluster
terraform destroy -auto-approve -no-color -var-file=../controllers.json -var-file=../avi_config.json -var-file=../.password.json
cd ..
cd 03_avi_config
terraform destroy -auto-approve -no-color -var-file=../controllers.json -var-file=../avi_config.json -var-file=../.password.json
cd ..
cd 02_avi_username
terraform destroy -auto-approve -no-color -var-file=../controllers.json -var-file=../avi_config.json -var-file=../.password.json
cd ..
cd 01_infra
terraform destroy -auto-approve -no-color
cd ..