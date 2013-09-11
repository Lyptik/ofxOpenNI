#!/bin/sh

# if no _kinect, swap to xtion
[ -z $(ls | grep _kinect.dylib) ] > /dev/null &&
{
	echo "Swapping from Kinect to Xtion..." &&

	mv libXnDDK.dylib libXnDDK_kinect.dylib &&
	mv libXnDDK_xtion.dylib libXnDDK.dylib &&

	mv libXnDeviceFile.dylib libXnDeviceFile_kinect.dylib &&
	mv libXnDeviceFile_xtion.dylib libXnDeviceFile.dylib &&

	mv libXnDeviceSensorV2KM.dylib libXnDeviceSensorV2KM_kinect.dylib &&
	mv libXnDeviceSensorV2KM_xtion.dylib libXnDeviceSensorV2KM.dylib &&

	exit
}

# if no _xtion, swap to kinect
[ -z $(ls | grep _xtion.dylib) ] &&
{
	echo "Swapping from Kinect to Xtion..." &&

	mv libXnDDK.dylib libXnDDK_xtion.dylib &&
	mv libXnDDK_kinect.dylib libXnDDK.dylib &&

	mv libXnDeviceFile.dylib libXnDeviceFile_xtion.dylib &&
	mv libXnDeviceFile_kinect.dylib libXnDeviceFile.dylib &&

	mv libXnDeviceSensorV2KM.dylib libXnDeviceSensorV2KM_xtion.dylib &&
	mv libXnDeviceSensorV2KM_kinect.dylib libXnDeviceSensorV2KM.dylib &&

	exit	
}

echo "Failed to detect current state ! " >&2 && exit 1