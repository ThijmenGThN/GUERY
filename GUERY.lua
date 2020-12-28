
-- screenHight = 11
-- print("                                        ")
-- 200 up
-- 208 down
-- 57 space
-- 28 enter
-- 32 s4

-- STATIC

version = "0.2.10"
fuelCurrent = 100
fuelNeeded = 500

config = {}
config["s1"] = {}
config["s2"] = {}

query = {}
query["s1"] = {}
query["s2"] = {}

query["s1"]["s1"] = "Place Torches |"
query["s1"]["s2"] = "Dispense Blocks |"
query["s1"]["s3"] = "Fill Floor Gaps |"
query["s1"]["s4"] = "Skip Fuel Check |"

query["s2"]["s1"] = "Place Torches |"
query["s2"]["s2"] = "Dispense Blocks |"
query["s2"]["s3"] = "Fill Floor Gaps |"
query["s2"]["s4"] = "Ignore Fuel Check |"

config["s1"]["s1"] = "Disabled" -- floor
config["s1"]["s2"] = "Disabled" -- torches
config["s1"]["s3"] = "Disabled" -- ignoreFuel
config["s1"]["s4"] = "Disabled" -- dropBlocks

config["s2"]["s1"] = "Disabled" -- floor
config["s2"]["s2"] = "Disabled" -- torches
config["s2"]["s3"] = "Disabled" -- ignoreFuel
config["s2"]["s4"] = "Disabled" -- dropBlocks

-- FUNCTIONS

function clean()
    term.clear()
    term.setCursorPos(1,1)
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.black)
    print(" GThN            GUERY          "..version.."  ")
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
end

function configPoll(id, title, size, page, totalPages, insertType, showFuel, note)
    local listen = true
    local selected = 1
    
    while listen do
        clean()
        print("\n", title, "| Showing Page", page, "out of", totalPages, "\n")

        for i = 1, size do
            if selected == i then
                print("->", query["s"..id]["s"..i], config["s"..id]["s"..i])
            else
                print("  ", query["s"..id]["s"..i], config["s"..id]["s"..i])
            end
        end

        if fuelCurrent < fuelNeeded then print("\n   - Insufficient Fuel".."\n\n", note) else print("\n   - Sufficient Fuel".."\n\n", note) end

        local evt, key = os.pullEvent("key")

        if key == 28 then listen = false end
        if key == 200 and selected > 1 then selected = selected - 1 end
        if key == 208 and selected < size then selected = selected + 1 end
        if key == 57 then 
            if insertType == "toggle" then
                -- if config["s"..selected]
            elseif insertType == "number" then

            end
        end
    end

end

-- MASTER

clean()

-- id title size page totalPages insertType showFuel note
configPoll(1, "Config", 4, 1, 10, "toggle", true, "SPACE to Toggle or ENTER to Resume")

-- ABORT

os.sleep(2)







