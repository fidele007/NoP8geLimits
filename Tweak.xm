#ifndef kCFCoreFoundationVersionNumber_iOS_7_0
#define kCFCoreFoundationVersionNumber_iOS_7_0 847.20
#endif

#define IS_IOS_OR_NEWER(iOS7) (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_7_0)

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

%ctor {
	if (IS_IOS_OR_NEWER(iOS7)) {
		%init(iOS7);
	} else {
		%init(preiOS7);
	}
}