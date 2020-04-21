Version = inherit(Singleton)

function Version:constructor()
    -- Obtain version string
    self.m_VersionString = VERSION_LABEL

    -- Create the label
    self.m_VersionLabel = guiCreateLabel(screenWidth - 255, screenHeight - 28, 250, 18, self.m_VersionString, false)
    guiSetAlpha(self.m_VersionLabel, 0.8)
    guiLabelSetHorizontalAlign(self.m_VersionLabel, "right")
    guiMoveToBack(self.m_VersionLabel)
end

function Version:destructor()
    destroyElement(self.m_VersionLabel)
end

function Version:getVersion()
    return self.m_VersionString
end

function Version:setVersion(versionString)
    assert(type(versionString) == "string", "Bad argument @ Version:setVersion #1")

    -- Set new version
    self.m_VersionString = versionString
    guiSetText(self.m_VersionLabel, self.m_VersionString)
end