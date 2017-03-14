@echo off

set SolutionDir=%~dp0
set SolutionFile=MSBuildTest.sln
set msbuild="C:\Program Files (x86)\MSBuild\14.0\bin\msbuild"
if not exist %msbuild% (
	set msbuild="C:\Program Files (x86)\MSBuild\12.0\bin\msbuild"
)

set OutputPath=%SolutionDir%Output\portable
set ObjOutputPath=%SolutionDir%Output\obj

rmdir /s/q "%OutputPath%" 2> nul
%msbuild% %SolutionDir%%SolutionFile% /property:OutputPath=%OutputPath%\;BaseIntermediateOutputPath=%ObjOutputPath%\
rmdir /s/q "%ObjOutputPath%"
