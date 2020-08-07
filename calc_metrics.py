import cv2
import matplotlib.pyplot as plt

def var_lap(frame):
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    value = cv2.Laplacian(gray, cv2.CV_64F).var()
    return value
d = {
    'raw':[],
    '5px':[],
    '10px':[],
    '15px':[],
    '25px':[],
    '50px':[]
}
for vid in d:
    print("video/%s.mp4"%(vid))
    cap = cv2.VideoCapture(r"video/%s.mp4"%(vid))

    # Check if camera opened successfully
    if (cap.isOpened()== False): 
        print("Error opening video stream or file")

    while(cap.isOpened()):
        ret, frame = cap.read()
        if ret == True:
            d[vid].append(var_lap(frame))
        else: 
            break
    cap.release()
    plt.plot(d[vid],label=vid)
plt.legend(loc="upper left")
plt.title("variance of laplacian over time")
plt.ylabel("variance of laplacian")
plt.show()