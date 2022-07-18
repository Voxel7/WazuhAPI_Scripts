package main

import (
 "net/http"
 "crypto/tls"
 "log"
 "io/ioutil"
 "fmt"
)

type wazuhInstance struct {
	addr string
	user string
	pass string
	token string
	transport  *http.Transport
	client *http.Client
}

func getWazuhToken(instance wazuhInstance) string {
	
	req, err := http.NewRequest("GET", instance.addr+"security/user/authenticate?raw=true", nil)
	if err != nil {
	 log.Fatal(err)
	}

	req.SetBasicAuth(instance.user, instance.pass)	
	resp, err := instance.client.Do(req)
	if err != nil {
	}

	defer resp.Body.Close()
    body, _ := ioutil.ReadAll(resp.Body)

    return string(body)
}

func wazuhGet(instance wazuhInstance, url string) string{

	req, err := http.NewRequest("GET", instance.addr+url, nil)
	if err != nil {
		log.Fatal(err)
	}
	
	req.Header.Set("Authorization", "Bearer "+instance.token)
	resp, err := instance.client.Do(req)
	if err != nil {
		log.Fatal(err)
	}
	
	defer resp.Body.Close()
    body, _ := ioutil.ReadAll(resp.Body)

    return string(body)
}



func main(){

	var ipaddr string
	
	fmt.Print("Enter IP address of Wazuh Manager ")
	
	fmt.Scanf("%s", &ipaddr)

	instance       := wazuhInstance{addr:"https://"+ipaddr+":55000/", user:"wazuh",pass:"wazuh",transport:&http.Transport{ TLSClientConfig: &tls.Config{InsecureSkipVerify: true},}  }
	instance.client = &http.Client{Transport: instance.transport}	
	instance.token  = getWazuhToken(instance)
	loop:
		for {
		var opt int
		fmt.Println("////////MENU////////\n\nSelect an option \n[1]Show Default Information\n[2]Show agents summary\n[3]Consult a specific rule\n[4]Show all rules within a specified group\n[5]Show monitored files by syscheck\n[6]Show informations about Wazuh-Manager\n[7]Show Informations about 2 active agents\n[8]Quit\n\n/////////MENU////////")
		fmt.Print("Select an option: ")
		_, err := fmt.Scanf("%d", &opt)
		if err != nil {
			fmt.Println("Invalid guess: err:", err)
			continue
		}
			switch {
	case opt==1:
	log.Println(wazuhGet(instance,"?pretty=true"))
	case opt==2:
	log.Println(wazuhGet(instance,"agents/summary/status?pretty=true"))
	case opt==3:{
	var idrule string
	fmt.Print("Enter ID of the rule you want to consult ")
	fmt.Scanf("%s", &idrule)
	log.Println(wazuhGet(instance,"rules?rule_ids="+idrule+"&pretty=true"))}
	case opt==4:{
	var criteria string
	fmt.Print("Enter criteria you want to consult ")
	fmt.Scanf("%s", &criteria)
	log.Println(wazuhGet(instance,"rules?pretty=true&limit=500&search=failures&group="+criteria+"&pci_dss=10.6.1"))}
	case opt==5:
	log.Println(wazuhGet(instance,"syscheck/000?pretty=true&search=.py"))
	case opt==6:
	log.Println(wazuhGet(instance,"manager/status?pretty=true"))
	case opt==7:
	log.Println(wazuhGet(instance,"agents?pretty=true&offset=1&limit=2&select=status%2Cid%2Cmanager%2Cname%2Cnode_name%2Cversion&status=active"))
	case opt==8:
	log.Println("Quitting")
	break loop  
	default: log.Println("Invalid option")
}
}    
}
