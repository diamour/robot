; Auto-generated. Do not edit!


(cl:in-package myrobot_msgs-msg)


;//! \htmlinclude led.msg.html

(cl:defclass <led> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform ""))
)

(cl:defclass led (<led>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <led>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'led)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myrobot_msgs-msg:<led> is deprecated: use myrobot_msgs-msg:led instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <led>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myrobot_msgs-msg:command-val is deprecated.  Use myrobot_msgs-msg:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <led>) ostream)
  "Serializes a message object of type '<led>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <led>) istream)
  "Deserializes a message object of type '<led>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<led>)))
  "Returns string type for a message object of type '<led>"
  "myrobot_msgs/led")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'led)))
  "Returns string type for a message object of type 'led"
  "myrobot_msgs/led")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<led>)))
  "Returns md5sum for a message object of type '<led>"
  "cba5e21e920a3a2b7b375cb65b64cdea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'led)))
  "Returns md5sum for a message object of type 'led"
  "cba5e21e920a3a2b7b375cb65b64cdea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<led>)))
  "Returns full string definition for message of type '<led>"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'led)))
  "Returns full string definition for message of type 'led"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <led>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <led>))
  "Converts a ROS message object to a list"
  (cl:list 'led
    (cl:cons ':command (command msg))
))
