# import cv2

# stream_url = "rtsp://@192.168.1.103:554/user=_password=_channel=1_stream=0.sdp"
# cap = cv2.VideoCapture(stream_url)

# # Check if the camera is opened successfully
# if not cap.isOpened():
#     print("Error: Could not open camera.")
#     exit()

# # Wait for the stream to initialize
# while True:
#     ret, frame = cap.read()
#     print(ret)
#     if ret:
#         break

# # Show the frame
# cv2.imshow( "mat",frame)

# # Save the frame as an image
# cv2.imwrite('snapshot.jpg', frame)

# # Release the camera
# cap.release()

# # Close OpenCV windows
# cv2.destroyAllWindows()

import cv2
ip ="rtsp://@192.168.1.103:554/user=_password=_channel=1_stream=0.sdp"
cap = cv2.VideoCapture(ip)
ret, frame = cap.read()
if ret:
    # Save the frame as a temporary image file
    cv2.imwrite('temp_image.jpg', frame)
    # Close the capture
    cap.release()