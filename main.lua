local x = 'hello'

local sheets = {'Engine', 'Cheat', 'Memory', 'BreakPoint', 'Lua', 'Attach', 'Proccess', 'DBVM', 'DBK'}
local changes = {'Angine', 'Sheet', 'Nemony', 'PreakBoint', 'Rua', 'Attech', 'Plocecss', 'DVBM', 'DKB'}

-- 텍스트 리플레이스
function replace(text, to_be_replaced, replace_with) 
    if text == nil then return text end
    
    local strFindStart, strFindEnd = string.find(text, to_be_replaced) 
    if strFindStart ~= nil then --start가 있는경우에 
        local nStringCnt = string.len(text)
        local retText = string.sub(text, 1, strFindStart-1) .. replace_with ..  string.sub(text, strFindEnd+1, nStringCnt) 
        return retText
    else
        retText = text
        return retText
    end  
end
-- 패턴을 서칭한다
function patternChanger(value)
   value = string.lower(value)
   for i=1, #sheets do 
       local from = string.lower(sheets[i])
       local to = string.lower(changes[i])  
       local strFindStart, strFindEnd = string.find(value, from)
       
       if strFindEnd == nil then 
           goto continue
       else
           print(value, '\n', from, '\n', to)
           value = replace(value, from, to) 
       end
       
     
       
       ::continue::
   end  
   
   
   return value 
end

print(patternChanger("Cheat Engine Memory BreakPoint"))
 
 
