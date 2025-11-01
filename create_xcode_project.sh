#!/bin/bash
set -e

# Create the ToastyExample Xcode project
cd Examples

# Create project structure
mkdir -p ToastyExample.xcodeproj/project.xcworkspace/xcshareddata/swiftpm
mkdir -p ToastyExample.xcodeproj/xcshareddata/xcschemes

cat > ToastyExample.xcodeproj/project.pbxproj << 'PROJECT_EOF'
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 56;
	objects = {

/* Begin PBXBuildFile section */
		1A0000010000000000000001 /* ToastyExampleApp.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A0000020000000000000001 /* ToastyExampleApp.swift */; };
		1A0000030000000000000001 /* ContentView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A0000040000000000000001 /* ContentView.swift */; };
		1A0000050000000000000001 /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 1A0000060000000000000001 /* Assets.xcassets */; };
		1A0000070000000000000001 /* PrebuiltToastsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A0000080000000000000001 /* PrebuiltToastsView.swift */; };
		1A0000090000000000000001 /* CustomToastsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A00000A0000000000000001 /* CustomToastsView.swift */; };
		1A00000B0000000000000001 /* PlaygroundView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A00000C0000000000000001 /* PlaygroundView.swift */; };
		1A00000D0000000000000001 /* RealWorldScenariosView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 1A00000E0000000000000001 /* RealWorldScenariosView.swift */; };
/* End PBXBuildFile section */

/* Begin PBXFileReference section */
		1A0000110000000000000001 /* ToastyExample.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = ToastyExample.app; sourceTree = BUILT_PRODUCTS_DIR; };
		1A0000020000000000000001 /* ToastyExampleApp.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ToastyExampleApp.swift; sourceTree = "<group>"; };
		1A0000040000000000000001 /* ContentView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ContentView.swift; sourceTree = "<group>"; };
		1A0000060000000000000001 /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
		1A0000080000000000000001 /* PrebuiltToastsView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Examples/PrebuiltToastsView.swift; sourceTree = "<group>"; };
		1A00000A0000000000000001 /* CustomToastsView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Examples/CustomToastsView.swift; sourceTree = "<group>"; };
		1A00000C0000000000000001 /* PlaygroundView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Examples/PlaygroundView.swift; sourceTree = "<group>"; };
		1A00000E0000000000000001 /* RealWorldScenariosView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Examples/RealWorldScenariosView.swift; sourceTree = "<group>"; };
		1A0000100000000000000001 /* Toasty */ = {isa = PBXFileReference; lastKnownFileType = wrapper; path = Toasty; sourceTree = "<group>"; };
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
		1A0000120000000000000001 /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
		1A0000130000000000000001 = {
			isa = PBXGroup;
			children = (
				1A0000140000000000000001 /* ToastyExample */,
				1A0000150000000000000001 /* Products */,
			);
			sourceTree = "<group>";
		};
		1A0000140000000000000001 /* ToastyExample */ = {
			isa = PBXGroup;
			children = (
				1A0000020000000000000001 /* ToastyExampleApp.swift */,
				1A0000040000000000000001 /* ContentView.swift */,
				1A0000160000000000000001 /* Examples */,
				1A0000060000000000000001 /* Assets.xcassets */,
				1A0000100000000000000001 /* Toasty */,
			);
			path = ToastyExample;
			sourceTree = "<group>";
		};
		1A0000160000000000000001 /* Examples */ = {
			isa = PBXGroup;
			children = (
				1A0000080000000000000001 /* PrebuiltToastsView.swift */,
				1A00000A0000000000000001 /* CustomToastsView.swift */,
				1A00000C0000000000000001 /* PlaygroundView.swift */,
				1A00000E0000000000000001 /* RealWorldScenariosView.swift */,
			);
			path = Examples;
			sourceTree = "<group>";
		};
		1A0000150000000000000001 /* Products */ = {
			isa = PBXGroup;
			children = (
				1A0000110000000000000001 /* ToastyExample.app */,
			);
			name = Products;
			sourceTree = "<group>";
		};
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
		1A0000170000000000000001 /* ToastyExample */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = 1A0000180000000000000001 /* Build configuration list for PBXNativeTarget "ToastyExample" */;
			buildPhases = (
				1A0000190000000000000001 /* Sources */,
				1A0000120000000000000001 /* Frameworks */,
				1A00001A0000000000000001 /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = ToastyExample;
			packageProductDependencies = (
				1A00001B0000000000000001 /* Toasty */,
			);
			productName = ToastyExample;
			productType = "com.apple.product-type.application";
		};
/* End PBXNativeTarget section */

/* Begin PBXProject section */
		1A00001C0000000000000001 /* Project object */ = {
			isa = PBXProject;
			attributes = {
				LastSwiftUpdateCheck = 1500;
				LastUpgradeCheck = 1500;
			};
			buildConfigurationList = 1A00001D0000000000000001 /* Build configuration list for PBXProject "ToastyExample" */;
			compatibilityVersion = "Xcode 15.0";
			developmentRegion = en;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
				Base,
			);
			mainGroup = 1A0000130000000000000001;
			packageReferences = (
				1A00001E0000000000000001 /* XCRemoteSwiftPackageReference "Toasty" */,
			);
			productRefGroup = 1A0000150000000000000001 /* Products */;
			projectDirPath = "";
			projectRoot = "../..";
			targets = (
				1A0000170000000000000001 /* ToastyExample */,
			);
		};
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
		1A00001A0000000000000001 /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				1A0000050000000000000001 /* Assets.xcassets in Resources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXResourcesBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
		1A0000190000000000000001 /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				1A0000010000000000000001 /* ToastyExampleApp.swift in Sources */,
				1A0000030000000000000001 /* ContentView.swift in Sources */,
				1A0000070000000000000001 /* PrebuiltToastsView.swift in Sources */,
				1A0000090000000000000001 /* CustomToastsView.swift in Sources */,
				1A00000B0000000000000001 /* PlaygroundView.swift in Sources */,
				1A00000D0000000000000001 /* RealWorldScenariosView.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXSourcesBuildPhase section */

/* Begin XCRemoteSwiftPackageReference section */
		1A00001E0000000000000001 /* XCRemoteSwiftPackageReference "Toasty" */ = {
			isa = XCRemoteSwiftPackageReference;
			requirement = {
				branch = "main";
				kind = branch;
			};
			repositoryURL = "file:///Users/nickrogers/DEV/Packages/Toasty";
		};
/* End XCRemoteSwiftPackageReference section */

/* Begin XCSwiftPackageProductDependency section */
		1A00001B0000000000000001 /* Toasty */ = {
			isa = XCSwiftPackageProductDependency;
			package = 1A00001E0000000000000001 /* XCRemoteSwiftPackageReference "Toasty" */;
			productName = Toasty;
		};
/* End XCSwiftPackageProductDependency section */

/* Begin XCBuildConfiguration section */
		1A00001F0000000000000001 /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				ASSETCATALOG_COMPILER_METAL_IMAGE_PARAMETERIZATION = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_ENABLE_OBJC_WEAK = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_COMMA = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_STRICT_PROTOTYPES = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
				CLANG_WARN_UNREACHABLE_CODE = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = dwarf;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_TESTABILITY = YES;
				ENABLE_USER_SCRIPT_SANDBOXING = YES;
				GCC_C_LANGUAGE_STANDARD = gnu17;
				GCC_DYNAMIC_NO_PIC = NO;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_OPTIMIZATION_LEVEL = 0;
				GCC_PREPROCESSOR_DEFINITIONS = (
					"DEBUG=1",
					"$(inherited)",
				);
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNDECLARED_SELECTOR = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 17.0;
				LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
				MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
				MTL_FAST_MATH = YES;
				ONLY_ACTIVE_ARCH = YES;
				SDKROOT = iphoneos;
				SWIFT_ACTIVE_COMPILATION_CONDITIONS = "DEBUG $(inherited)";
				SWIFT_OPTIMIZATION_LEVEL = "-Onone";
				SWIFT_VERSION = 5.0;
			};
			name = Debug;
		};
		1A0000200000000000000001 /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				ASSETCATALOG_COMPILER_METAL_IMAGE_PARAMETERIZATION = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_ENABLE_OBJC_WEAK = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_COMMA = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_STRICT_PROTOTYPES = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
				CLANG_WARN_UNREACHABLE_CODE = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
				ENABLE_NS_ASSERTIONS = NO;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_USER_SCRIPT_SANDBOXING = YES;
				GCC_C_LANGUAGE_STANDARD = gnu17;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNDECLARED_SELECTOR = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 17.0;
				LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
				MTL_ENABLE_DEBUG_INFO = NO;
				MTL_FAST_MATH = YES;
				SDKROOT = iphoneos;
				SWIFT_COMPILATION_MODE = wholemodule;
				SWIFT_OPTIMIZATION_LEVEL = "-O";
				SWIFT_VERSION = 5.0;
			};
			name = Release;
		};
		1A0000210000000000000001 /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_ASSET_PATHS = "";
				DEVELOPMENT_TEAM = "";
				GENERATE_INFOPLIST_FILE = YES;
				INFOPLIST_FILE = "";
				INFOPLIST_KEY_UIApplicationSceneManifest_Generation = YES;
				INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
				INFOPLIST_KEY_UILaunchScreen_Generation = YES;
				INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad = "UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
				INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone = "UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
				IPHONEOS_DEPLOYMENT_TARGET = 17.0;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.nickrogers.ToastyExample;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SDKROOT = iphoneos;
				SWIFT_EMIT_LOC_STRINGS = YES;
				TARGETED_DEVICE_FAMILY = "1,2";
			};
			name = Debug;
		};
		1A0000220000000000000001 /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_ASSET_PATHS = "";
				DEVELOPMENT_TEAM = "";
				GENERATE_INFOPLIST_FILE = YES;
				INFOPLIST_FILE = "";
				INFOPLIST_KEY_UIApplicationSceneManifest_Generation = YES;
				INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
				INFOPLIST_KEY_UILaunchScreen_Generation = YES;
				INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad = "UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
				INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone = "UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
				IPHONEOS_DEPLOYMENT_TARGET = 17.0;
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.nickrogers.ToastyExample;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SDKROOT = iphoneos;
				SWIFT_EMIT_LOC_STRINGS = YES;
				TARGETED_DEVICE_FAMILY = "1,2";
			};
			name = Release;
		};
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
		1A00001D0000000000000001 /* Build configuration list for PBXProject "ToastyExample" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				1A00001F0000000000000001 /* Debug */,
				1A0000200000000000000001 /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		1A0000180000000000000001 /* Build configuration list for PBXNativeTarget "ToastyExample" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				1A0000210000000000000001 /* Debug */,
				1A0000220000000000000001 /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
/* End XCConfigurationList section */
	};
	rootObject = 1A00001C0000000000000001 /* Project object */;
}
PROJECT_EOF

