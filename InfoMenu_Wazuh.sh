#!/bin/bash

echo -e "/n enter ip address of wazuh server/n"

read ip

echo -e "\n Getting token \n"

TOKEN=$(curl -u wazuh:wazuh -k -X GET "https://${ip}:55000/security/user/authenticate?raw=true")

echo -e "\n- API calls with TOKEN environment variable \n"

while :

do

echo -e "\n\n/////////MENU////////\n\nSelect an option \n[1]Show Default Information\n[2]Show agents summary\n[3]Consult a specific rule\n[4]Show all rules within a specified group\n[5]Show monitored files by syscheck\n[6]Show informations about Wazuh-Manager\n[7]Show Informations about 2 active agents\n[8]Quit\n\n/////////MENU////////\n "

read -p "Enter your choice:" choice

case $choice in

1)echo -e "Getting default information\n"

curl -k -X GET "https://${ip}:55000/?pretty=true" -H  "Authorization: Bearer $TOKEN"
;;

2)echo -e "\n\n Getting  agents summary\n"

curl -k -X GET "https://${ip}:55000/agents/summary/status?pretty=true" -H  "Authorization: Bearer $TOKEN"
;;
3)echo -e "/n enter rule you want to consult/n"

read r

echo -e "\n\n Getting specified rules\n"

curl -k -X GET "https://${ip}:55000/rules?rule_ids=${r}&pretty=true" -H  "Authorization: Bearer $TOKEN"
;;
4)echo -e "\n\n Enter specific criteria (all rules within specified group)\n"

read c

echo -e "\n\n Getting specific criteria\n"

curl -k -X GET "https://${ip}:55000/rules?pretty=true&limit=500&search=failures&group=${c}&pci_dss=10.6.1" -H  "Authorization: Bearer $TOKEN"
;;
5)echo -e "\n\n Getting monitored files by syscheck\n"

curl -k -X GET "https://${ip}:55000/syscheck/000?pretty=true&search=.py" -H  "Authorization: Bearer $TOKEN"
;;
6)echo -e "\n\n Getting informations about Wazuh-Manager \n"

curl -k -X GET "https://${ip}:55000/manager/status?pretty=true" -H  "Authorization: Bearer $TOKEN"
;;
7)echo -e "\n\n Getting 2 active agents \n"

curl -k -X GET "https://${ip}:55000/agents?pretty=true&offset=1&limit=2&select=status%2Cid%2Cmanager%2Cname%2Cnode_name%2Cversion&status=active" -H  "Authorization: Bearer $TOKEN"
;;
8) echo -e "\nQuitting\n"
exit;;
*) echo -e "\ninvalid option\n";;
esac
done
