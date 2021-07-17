
local sheets = {'Debug', 'Find Memory', 'Engine', 'Cheat', 'Memory', 'BreakPoint', 'Lua', 'Attach', 'Proccess', 'DBVM', 'DBK'}
local changes = {'Debag' ,'Flnd Nemony', 'Angine', 'Sheet', 'Nemony', 'PreakBoint', 'Rua', 'Attech', 'Plocecss', 'DVBM', 'DKB'}

function addReplace(from, to)
	table.insert(sheets, from)
            table.insert(changes, to)
end
addReplace('StrackTrace', 'SteckTrece')
addReplace('WatchList', 'WhatchList')
addReplace('Thread', 'Threeeed')
addReplace('Heap', 'Heep')
addReplace('Reference', 'Rafarence')
addReplace('Module', 'Nodule')
addReplace('Dissect', 'Dissact')
addReplace('DLL', 'DII')
addReplace('Symbols', 'Xymbols')
addReplace('Event', 'Evant')
addReplace('Alloc', 'Elloc')
addReplace('Fill', 'Flll')
addReplace('Ultimap', 'UItIMap')
addReplace('Spider', 'SplderMan')
addReplace('Kernel', 'rng0')
addReplace('Inject', 'Insert')
addReplace('Pointer', 'Polnter')
addReplace('7.2', '7.0.0.2')
addReplace('Address', 'Adress')
addReplace('Bytes', 'By_Tes')
addReplace('Unknown', 'Umkmown')
addReplace('Writeable', 'Writoable')
addReplace('CopyOnWrite', 'CopyOnWrito')
addReplace('Int3 Instruction', 'lnt3 lnstrution')
addReplace('page', 'pege')
addReplace('scanbuffer', 'scenbupper')
addReplace('scan', 'scen')
addReplace('unrandomizer', 'unrendomazor')
addReplace('SpeedHack', 'xD')


-- 텍스트 리플레이스
function replace(text, to_be_replaced, replace_with)
    if text == nil then return text end

    print('===>', text, to_be_replaced, replace_with)
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
function getNewer(value)
   value = string.lower(value)
   for i=1, #sheets do
       local from = string.lower(sheets[i])
       local to = string.lower(changes[i])
       if value == nil then return value end
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





function renameComponents(c)
  local i
  if c.Component then
    for i=0,c.ComponentCount-1 do
      renameComponents(c.Component[i])
    end
  end

     if c.Caption then
        if c.Caption ~= nil then
           c.Caption = getNewer(c.Caption)
        end
     end

end




for i=0,getFormCount()-1 do
    local form = getForm(i)
    for j=0,form.ControlCount-1 do
      renameComponents(form)
    end

    form.Caption= getNewer(form.Caption)
end

registerFormAddNotification(function(f)
  f.registerCreateCallback(function(frm)
    renameComponents(f)
  end)
end)
