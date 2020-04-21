Core = inherit(Singleton)

function Core:constructor()
    -- Push the core variable into the global namespace
    core = self

    -- Establish a new MySQL connection
    Storage:new("mysql-mariadb-5-101.zap-hosting.com", 3306, "zap369798-1", "Zbi84V27zaHQXy5f", "zap369798-1")

    -- Notify 
    outputDebugString("Core initialized..", 3)
end

function Core:destructor()

end