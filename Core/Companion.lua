-- AIDDEV_Companion/Core/Companion.lua
-- Provides project data and environment metadata to AIDDEV/DevTools.

local Companion = {}
AIDDEV_Companion = Companion

-- Stored project (populated by external tools or manual injection)
Companion.currentProject = nil

-- Environment metadata:
-- realm, client build, ruleset version, etc.
Companion.environment = {
    realm         = GetRealmName and GetRealmName() or "UNKNOWN",
    clientBuild   = select(4, GetBuildInfo and GetBuildInfo() or 0),
    ruleset       = "ascension",
    encoding      = "UTF-8",
    lineEndings   = "LF",
}

---------------------------------------------------------------------
-- External API
---------------------------------------------------------------------

-- Called by external tooling / scripts to inject a project.
-- project format:
-- {
--   files = {
--     ["path/to/file.lua"] = {
--        content = "text",
--     },
--   },
-- }
function Companion:SetCurrentProject(project)
    self.currentProject = project
end

function Companion:GetCurrentProject()
    return self.currentProject
end

function Companion:GetEnvironment()
    return self.environment
end

-- Quick debug injection helper (for manual /script usage)
function Companion:BuildProjectFromFiles(fileMap)
    local project = { files = {} }
    for filename, content in pairs(fileMap) do
        project.files[filename] = {
            content = content,
        }
    end
    self.currentProject = project
    return project
end
