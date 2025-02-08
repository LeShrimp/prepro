#!/usr/local/bin/lua
local defines = {}

local function process_file(filename)
    local file = io.open(filename, "r")
    if not file then
        io.stderr:write("Error: Could not open file " .. filename .. "\n")
        return
    end
    
    for line in file:lines() do
        local include_file = line:match('.?.?#include "([^"]+)"')
        if include_file then
            process_file(include_file)
        else
            local token, value = line:match(".?.?#define%s+(%S+)%s+(.+)")
            if token and value then
                defines[token] = value
            else
                for token, value in pairs(defines) do
                    line = line:gsub(token, value)
                end
                print(line)
            end
        end
    end
    
    file:close()
end

if #arg ~= 1 then
    io.stderr:write("Usage: lua prepro.lua <input_file> > <output_file>\n")
    os.exit(1)
end

process_file(arg[1])
