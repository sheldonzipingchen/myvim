Vim�UnDo� G�5��4�bS�G ��S����	y�+[U�                                     `7�B    _�                            ����                                                                                                                                                                                                                                                                                                                                                             `7!S     �                	fmt.Println("Hello world")5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `7!T     �                   �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `7!d    �                  package main       import "fmt"       func main() {   6    environment := flag.String("e", "development", "")   }5�_�                       1    ����                                                                                                                                                                                                                                                                                                                                                             `7!�     �      	         	�             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `7!�     �      	   
      		�      	   	    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             `7"�    �               
   package main       import "flag"       func main() {   3	environment := flag.String("e", "development", "")   	flag.Usage = func() {   &		log.Fatal("Usage: server -e {mode}")   	}   }5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `7"�     �               	�             5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             `7"�     �               	�             5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                             `7"�    �                  package main       import (   	"flag"   	"log"   )       func main() {   3	environment := flag.String("e", "development", "")   	flag.Usage = func() {   &		log.Fatal("Usage: server -e {mode}")   	}   	flag.Parse()   	config.Init(*environment)   }5�_�   	              
      	    ����                                                                                                                                                                                                                                                                                                                                                             `7��     �               	�             5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                             `7��    �                  package main       import (   	"flag"   	"frostmourne/config"   	"log"   )       func main() {   3	environment := flag.String("e", "development", "")   	flag.Usage = func() {   &		log.Fatal("Usage: server -e {mode}")   	}   	flag.Parse()   	config.Init(*environment)   	server.Init()   }5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             `7�9     �                   �             5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             `7�A    �                  package main       import (   	"flag"   	"frostmourne/config"   	"frostmourne/server"   	"log"   )       func main() {   3	environment := flag.String("e", "development", "")   	flag.Usage = func() {   &		log.Fatal("Usage: server -e {mode}")   	}   	flag.Parse()   	config.Init(*environment)       loglib.Init()   	server.Init()   }5��