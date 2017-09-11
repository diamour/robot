#!/usr/bin/python

import socket              
import rospy
import time
from myrobot_msgs.msg import led

def main():
    s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)         
    host = '192.168.31.111'
    port = 8008                
    BUFSIZ = 1024
    s.bind((host, port))      
    s.listen(5)                
    rospy.init_node('tcptalker',anonymous=0)
    pub=rospy.Publisher('tcptopic',led,queue_size=1)
    rospy.loginfo('i am listening')
    led_msg=led()
    while not rospy.is_shutdown():
        c,addr = s.accept()
        data=c.recv(BUFSIZ).decode()
        data_str = "the data from PC is %s" % data     
        rospy.loginfo(data_str)
	try:
	    if  "led_command" in data:
		led_msg.commad=data[data.find("led_command"),data.find("##")]
        	pub.publish(msg)
        	c.send(('I have recieved led command!').encode())
	except:
	    continue
    c.close()                

if __name__ == '__main__':
    main()
