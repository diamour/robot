;; Auto-generated. Do not edit!


(when (boundp 'myrobot_msg::led)
  (if (not (find-package "MYROBOT_MSG"))
    (make-package "MYROBOT_MSG"))
  (shadow 'led (find-package "MYROBOT_MSG")))
(unless (find-package "MYROBOT_MSG::LED")
  (make-package "MYROBOT_MSG::LED"))

(in-package "ROS")
;;//! \htmlinclude led.msg.html


(defclass myrobot_msg::led
  :super ros::object
  :slots (_command ))

(defmethod myrobot_msg::led
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

(setf (get myrobot_msg::led :md5sum-) "cba5e21e920a3a2b7b375cb65b64cdea")
(setf (get myrobot_msg::led :datatype-) "myrobot_msg/led")
(setf (get myrobot_msg::led :definition-)
      "string command

")



(provide :myrobot_msg/led "cba5e21e920a3a2b7b375cb65b64cdea")


