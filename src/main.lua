 --[[
  By: BIack1st & luisgamercooI231fan, 
  Time: Sun Jan 30 12:19:00 2022 ,
  Description: core module for the Random Library,
 ]]--
--[[
Credit is not needed, but is appreciated!,
This module's intent is to help people make randomly generated stuff. Like random chances and random points!
]]
local module = {}
function module:GetRandomChance(input:any, -- get a random chance. Input must be a table with a chance variable
	returnValue:string | number) 
	local function GetSum(Table)
		local Sum = 0
		for _, Data in pairs(Table) do
			Sum += Data.Chance
		end
		return Sum
	end
	local function Get(Table)
		local Rng = Random.new()
		local RandomNum = Rng:NextNumber(0, GetSum(input))
		for _, Data in pairs(Table) do
			if RandomNum <= Data.Chance then
				return Data
			else
				RandomNum -= Data.Chance
			end
		end
		
	end
	local Data = Get(input)
	if returnValue ~= nil then
		return Data[returnValue]
	else -- no return value
		return Data
	end
end
function module:GetRandomPointInPart(Part:BasePart)
	local Rng = Random.new()
	local RandomCFrame = Part.CFrame * CFrame.new(Rng:NextNumber(-Part.Size.X/2, Part.Size.X/2),Rng:NextNumber(-Part.Size.Y/2, Part.Size.Y/2),Rng:NextNumber(-Part.Size.Z/2, Part.Size.Z/2))

	return  RandomCFrame
end
function module:GetRandomPointInModel(Model:Model)
	local Rng = Random.new()
	local ModelCF, Size = Model:GetBoundingBox()
	local RandomCFrame = ModelCF * CFrame.new(Rng:NextNumber(-Size.X/2, Size.X/2),Rng:NextNumber(-Size.Y/2, Size.Y/2),Rng:NextNumber(-Size.Z/2, Size.Z/2))
	return RandomCFrame
end
function module:GetRandomPointInRegion(RegionSize:Vector3, RegionCFrame:CFrame)
	local Rng = Random.new()
	local RandomCFrame = RegionCFrame * CFrame.new(Rng:NextNumber(-RegionSize.X/2, RegionSize.X/2),Rng:NextNumber(-RegionSize.Y/2, RegionSize.Y/2),Rng:NextNumber(-RegionSize.Z/2, RegionSize.Z/2))
return RandomCFrame	
end
return module
