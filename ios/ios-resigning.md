http://dansdevdiary.tumblr.com/post/3255871033/further-adventures-in-resigning-for-ios

<code>
Further adventures in resigning for iOS

In the beginning days of iOS development, before the official SDK release, Craig Hockenberry (@chockenberry) helped everyone out by figuring out app resigning. He has the seminal post on app resigning. I learned what I needed from it. Craig is the giant on whose shoulders I’ve stood.

I work at a large iOS game studio. Due to restrictions and device limits on the Apple Dev Portal we have to create many versions of each build that is generated so that we can make sure it can run on any device we have.  As I have developed a custom resigning system I’ve learned a few things that help in addition to Craig’s post.

First, every iOS app bundle has the profile it was signed with when built in Xcode embedded in it. This causes no end of issues with resigning because you can’t just drop the freshly resigned app bundle onto a device unless you first have the resigned profile already installed. Why is that? If you ever watch the steps of app install you’ll see at some point it copies the embedded profile from the app bundle to the device. After that it does the codesign comparison to see if the executable is allowed to run on the device (which is why when you install an app with invalid permissions it copies the whole thing to the device and then errors out telling you there are not sufficient permissions). When you have an app bundle that contains an embedded profile that matches its signing everything is copacetic will install smoothy, assuming the device is on the provisioning profile.

At my day-job we combatted this problem by educating users to always install the provisioning profile and app bundle at the same time, they are distributed together for just this reason. This of course leads to problems down the road when a device has multiple copies of a profile and one expires, but that’s a story for another day. Not being able to allow users to just install an app bundle without a provisioning profile on resigned builds didn’t make much sense to me, especially in light of buiding IPA bundles for over the air distribution, so I dug in a bit more. It turns out there’s a solution staring you right in the face in your Xcode build logs.

Remember how I said there’s an embedded profile for each app bundle? Well, you just need to copy your resigning provisioning profile into the app bundle:

% cd $SRCROOT/build/Debug-iphoneos
% cp AltDevPortal.mobileprovision SomeApp.app/embedded.mobileprovision
Okay, now you’ve got that in the app bundle you need to tell codesign about it:

% export EMBEDDED_PROFILE_NAME=embedded.mobileprovision
And, using Master Hockenberry’s steps from his post we get this as the entire set of steps to successfully resign an iOS app bundle:

% cd $SRCROOT/build/Debug-iphoneos
% cp AltDevPortal.mobileprovision SomeApp.app/embedded.mobileprovision
% export EMBEDDED_PROFILE_NAME=embedded.mobileprovision
% export CODESIGN_ALLOCATE=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/codesign_allocate
% codesign -f -vv -s "iPhone Developer" SomeApp.app
Do note that if you’re working like me and you have more than one portal at your command and far more than a handful of profiles (say over 100) then you’ll want to be more explicit with the codesign tool. I use the command like so:

% codesign -f -vv -s "iPhone Developer: Build User (XXXXXXXX)" -i <profile name> SomeApp.app
The profile name used is generally the UUID of the profile. If you look in ~/Library/MobileDevice/Provisioning\ Profiles you’ll see the files are moved to the UUID name when installed by Xcode. You can manually copy a file in there, say SomeApp.mobileprovision, and then use -i SomeApp in your call to codesign.

This was posted 5 years ago. It has 2 notes.

</code>
