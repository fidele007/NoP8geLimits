#ifndef kCFCoreFoundationVersionNumber_iOS_7_0
#define kCFCoreFoundationVersionNumber_iOS_7_0 847.20
#endif

#ifndef kCFCoreFoundationVersionNumber_iOS_8_4
#define kCFCoreFoundationVersionNumber_iOS_8_4 1145.15
#endif

%group preiOS7
%hook SBRootFolder
+(int)maxListCount {
	return -1;
}
%end
%end


%group iOS7
%hook SBFolder
-(unsigned)maxListCount {
	return -1;
}
%end
%end

%group iOS8_4
%hook SBFolder
-(unsigned long long)maxListCount {
	return -1;
}
%end
%end

%ctor {
	if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_8_4) {
		%init(iOS8_4);
	} else if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_7_0) {
		%init(iOS7);
	} else {
		%init(preiOS7);
	}
}