VERSION = "4.3.4 "
BUILD = "development"
--BUILD = "stable"
--BUILD = "unstable"
REVISION = 1

if BUILD == "development" then
	VERSION_LABEL = ("German VenoX Reallife %sdev r%d"):format(VERSION, REVISION)
elseif BUILD == "unstable" then
	VERSION_LABEL = ("German VenoX Reallife %s unstable"):format(VERSION)
else
	VERSION_LABEL = ("German VenoX Reallife %s"):format(VERSION)
end