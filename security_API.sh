#!/bin/bash

#Login

TOKEN=$(curl -u wazuh:wazuh -k -X GET "https://10.100.50.10:55000/security/user/authenticate?raw=true")

#Logout current user

#curl -k -X DELETE "https://10.100.50.10:55000/security/user/authenticate?pretty=true" -H "Authorization: Bearer $TOKEN"

#Get the information of the current user

#curl -k -X GET "https://10.100.50.10:55000/security/users/me?pretty=true"  -H "Authorization: Bearer $TOKEN"

#Get current user processed policies

#curl -k -X GET "https://10.100.50.10:55000/security/users/me/policies?pretty=true" -H "Authorization: Bearer $TOKEN"

#Revoke JWT tokens

#curl -k -X PUT "https://10.100.50.10:55000/security/user/revoke" -H "Authorization: Bearer $TOKEN"

#List RBAC actions

#curl -k -X GET "https://10.100.50.10:55000/security/actions?pretty=true" -H "Authorization: Bearer $TOKEN"

#List RBAC resources

#curl -k -X GET "https://10.100.50.10:55000/security/resources?pretty=true" -H "Authorization: Bearer $TOKEN"

#List API users

#curl -k -X GET "https://10.100.50.10:55000/security/users?pretty=true" -H "Authorization: Bearer $TOKEN"

#Add API user

#curl -k -X POST "https://10.100.50.10:55000/security/users?pretty=true" -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d "{\"username\":\"newuser\",\"password\":\"NewPasswordForùser1\"}"

#Delete API users

#curl -k -X DELETE "https://10.100.50.10:55000/security/users?user_ids=100&pretty=true" -H "Authorization: Bearer $TOKEN"

#Modify a API user's password

#curl -k -X PUT "https://10.100.50.10:55000/security/users/100?pretty=true"  -H "Authorization: Bearer $TOKEN" -H  "Content-Type: application/json" -d "{\"password\":\"NewPasswordForùser3\"}"

#List roles

#curl -k -X GET "https://10.100.50.10:55000/security/roles?pretty=true" -H "Authorization: Bearer $TOKEN" 

#Add role

#curl -k -X POST "https://10.100.50.10:55000/security/roles?pretty=true"  -H "Authorization: Bearer $TOKEN" -H  "Content-Type: application/json" -d "{\"name\":\"RuleCreated\"}"

#Delete roles

#curl -k -X DELETE "https://10.100.50.10:55000/security/roles?role_ids=100&pretty=true" -H "Authorization: Bearer $TOKEN" 

#Update role????

curl -k -X PUT "https://10.100.50.10:55000/security/roles/?role_id=101&pretty=true" -H "Authorization: Bearer $TOKEN" -H  "Content-Type: application/json" -d "{\"name\":\"RuleModified\"}"

#List security rules

#curl -k -X GET "https://10.100.50.10:55000/security/rules?pretty=true" -H "Authorization: Bearer $TOKEN"

#Add security rule

#curl -k -X POST "https://10.100.50.10:55000/security/rules?pretty=true" -H "Authorization: Bearer $TOKEN" -H  "Content-Type: application/json" -d '{"name": "newrule","rule": {"MATCH": {"definition":"da newrule"}}}'

#Delete security rules

#curl -k -X DELETE "https://10.100.50.10:55000/security/rules?rule_ids=100&pretty=true" -H "Authorization: Bearer $TOKEN"

#Update security rule

#curl -k -X PUT "https://10.100.50.10:55000/security/rules/103?pretty=true" -H "Authorization: Bearer $TOKEN" -H  "Content-Type: application/json" -d '{"name": "newrule103","rule": {"MATCH": {"definition":"da newrule"}}}'

#List policies

#curl -k -X GET "https://10.100.50.10:55000/security/policies?pretty=true" -H "Authorization: Bearer $TOKEN"

#Add policy

#curl -k -X POST "https://10.100.50.10:55000/security/policies?pretty=true" -H "Authorization: Bearer $TOKEN" -H  "Content-Type: application/json" -d '{"name": "normal_policy","policy": {"actions": ["agent:delete"],"resources": ["agent:id:009"],"effect": "allow"}}'

#Delete policies

#curl -k -X DELETE "https://10.100.50.10:55000/security/policies?policy_ids=100&pretty=true" -H "Authorization: Bearer $TOKEN"

#Update policy

#curl -k -X PUT "https://10.100.50.10:55000/security/policies/100?pretty=true" -H "Authorization: Bearer $TOKEN" -H  "Content-Type: application/json" -d '{"name": "new_policy","policy": {"actions": ["agent:delete"],"resources": ["agent:id:009"],"effect": "allow"}}'

#Add roles to user

#curl -k -X POST "https://10.100.50.10:55000/security/users/100/roles?role_ids=100&pretty=true" -H "Authorization: Bearer $TOKEN"

#Remove roles from user

#curl -k -X DELETE "https://10.100.50.10:55000/security/users/100/roles?role_ids=100&pretty=true" -H "Authorization: Bearer $TOKEN"

#Add policies to role

#curl -k -X POST "https://10.100.50.10:55000/security/roles/100/policies?policy_ids=100&pretty=true" -H "Authorization: Bearer $TOKEN"

#Remove policies from role

#curl -k -X DELETE "https://10.100.50.10:55000/security/roles/100/policies?policy_ids=100&pretty=true" -H "Authorization: Bearer $TOKEN"

#Add security rules to role

#curl -k -X POST "https://10.100.50.10:55000/security/roles/100/rules?rule_ids=103&pretty=true" -H "Authorization: Bearer $TOKEN"

#Remove security rules from role

#curl -k -X DELETE "https://10.100.50.10:55000/security/roles/100/rules?rule_ids=103&pretty=true" -H "Authorization: Bearer $TOKEN"

#Get security config

#curl -k -X GET "https://10.100.50.10:55000/security/config?pretty=true" -H "Authorization: Bearer $TOKEN"

#Update security config

#curl -k -X PUT "https://10.100.50.10:55000/security/config?pretty=true" -H "Authorization: Bearer $TOKEN" -H  "Content-Type: application/json" -d '{"auth_token_exp_timeout":999,"rbac_mode": "white"}'  

#Restore default security config

#curl -k -X DELETE "https://10.100.50.10:55000/security/config?pretty=true" -H "Authorization: Bearer $TOKEN"


