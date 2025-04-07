project "glslang"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"glslang/**.cpp",
		"glslang/**.h"
	}

    defines
    {
		"ENABLE_HLSL"
    }

    includedirs
    {
		""
    }

	removefiles
	{
		"glslang/OSDependent/Unix/ossource.cpp",
		"glslang/OSDependent/Web/glslang.js.cpp"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "off"


	filter "system:linux"
		pic "On"
		systemversion "latest"
		staticruntime "off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Dist"
        runtime "Release"
        optimize "on"
			
	filter "configurations:Release"
		runtime "Release"
		optimize "on"