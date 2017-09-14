#!/usr/bin/python

import rospy
import time
import serial
from myrobot_msgs.msg import led

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + "get the led command:  %s", data.command)
    try:
	ser = serial.Serial('/dev/ttyUSB0', 9600, timeout=0)        
        print(ser.name)
######################################################
	var1=data.command
	var2 = var1.split()
	bytesToSend = len(var2)
	i=0
	for i in range(0,bytesToSend):
		var1 = int(var2[i])
		var = bytes([var1])
		#print("you entered", str(var, 'utf-8'), var1)
		ser.write(var)
	while(not(ser.in_waiting)):
		s = 'A'
	s = ser.read(bytesToSend)
	print(s)
	ser.close()
######################################################
    except:
	print("cannot open the serial")

def main():
    rospy.init_node('led_listener',anonymous=0)
    rospy.Subscriber("tcptopic", led, callback)
    rospy.spin()


if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass

