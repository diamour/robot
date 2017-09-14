;; Auto-generated. Do not edit!


(when (boundp 'myrobot_msgs::led)
  (if (not (find-package "MYROBOT_MSGS"))
    (make-package "MYROBOT_MSGS"))
  (shadow 'led (find-package "MYROBOT_MSGS")))
(unless (find-package "MYROBOT_MSGS::LED")
  (make-package "MYROBOT_MSGS::LED"))

(in-package "ROS")
;;//! \htmlinclude led.msg.html


(defclass myrobot_msgs::led
  :super ros::object
  :slots (_command ))

(defmethod myrobot_msgs::led
  (:init
   (&key
    ((:command __command) "")
    )
   (send-super :init)
   (setq _command (string __command))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get myrobot_msgs::led :md5sum-) "cba5e21e920a3a2b7b375cb65b64cdea")
(setf (get myrobot_msgs::led :datatype-) "myrobot_msgs/led")
(setf (get myrobot_msgs::led :definition-)
      "string command

")



(provide :myrobot_msgs/led "cba5e21e920a3a2b7b375cb65b64cdea")


