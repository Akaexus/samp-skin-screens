import os
import re
import time
import pyautogui

# obtain screenshots path
screenshotsFolders = map(lambda p: os.path.expanduser(p), [
    '~/Dokumenty/GTA San Andreas User Files/SAMP/screens',
    '~/Documents/GTA San Andreas User Files/SAMP/screens',
])

path = list(filter(lambda p: os.path.exists(p), screenshotsFolders))
if not len(path):
    print('Can\'t find screenshots path!')
    os.exit(1)
else:
    path = path[0]

# obtain last current screenshot id
screenshotIndex = 0
fileList = sorted(os.listdir(path), reverse = True)
if len(fileList):
    lastScreenshot = fileList[0]
    screenshotIndex = int(re.findall(r'sa-mp-(\d{3}).png', lastScreenshot)[0])+1

if not os.path.exists('skins/'):
    os.mkdir('skins')

excludedSkins = [74]

print('PREPARE YOUR GTA')
time.sleep(7)
for index in range(242, 312):
    if index not in excludedSkins:
        pyautogui.typewrite('t/skin %d\n' % index)
        pyautogui.typewrite('t/arrange\n')
        time.sleep(0.1)
        pyautogui.typewrite(['f8'])
        time.sleep(1)
        pyautogui.typewrite('t/arrange2\n')
        time.sleep(0.1)
        pyautogui.typewrite(['f8'])
        time.sleep(1)
        print('screenshoted skin %d' % index)
        os.rename(path + '/'+'sa-mp-{0:03d}.png'.format(screenshotIndex), os.getcwd()+'/skins/'+'skin-{}.png'.format(index))
        os.rename(path + '/'+'sa-mp-{0:03d}.png'.format(screenshotIndex+1), os.getcwd()+'/skins/'+'skin-{}_top.png'.format(index))
        # pyautogui.typewrite('t/weather 19\n')
        time.sleep(0.1)
        # pyautogui.typewrite('t/weather 2\n')
