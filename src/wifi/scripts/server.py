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
    s.listen(1)
    rospy.init_node('tcptalker',anonymous=0)
    pub=rospy.Publisher('tcptopic',led,queue_size=1)
    led_msg=led()
    print("i am listening")
    
    while not rospy.is_shutdown():
        c,addr = s.accept()
        data=c.recv(BUFSIZ).decode()
        data_str = "the data from PC is %s" % data
        print(data_str)
        if  "led_command" in data:
            led_msg.command=data[data.find("led_command")+11:data.find("##")]
	    pub.publish(led_msg)
            data_str = "the led commad is %s" % led_msg.command
	    rospy.loginfo(data_str)		
            c.send(('I have recieved led command!').encode())
    c.close()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
